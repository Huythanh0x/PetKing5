#!/bin/bash
# Script to compile Java code to Smali and compare with original Apktool Smali
# Usage: ./compare_java_to_smali.sh [class_name]
# Example: ./compare_java_to_smali.sh MainCanvas

set -e

CLASS_NAME="${1:-MainCanvas}"
JAVA_SRC_DIR="jadx_gradle_export/app/src/main/java"
ORIGINAL_SMALI_DIR="original_petking_5/smali"
OUTPUT_DIR="java_to_smali_comparison"
BAKSMALI_JAR="baksmali.jar"
D8_PATH=$(find ~/Library/Android/sdk/build-tools -name "d8" 2>/dev/null | head -1)

if [ -z "$D8_PATH" ]; then
    echo "Error: d8 not found. Please ensure Android SDK build-tools are installed."
    exit 1
fi

# Check if baksmali is available
if [ ! -f "$BAKSMALI_JAR" ]; then
    echo "Downloading baksmali..."
    curl -L -o "$BAKSMALI_JAR" "https://github.com/JesusFreke/smali/releases/download/v2.5.2/baksmali-2.5.2.jar" || {
        echo "Error: Failed to download baksmali. Please download manually from:"
        echo "https://github.com/JesusFreke/smali/releases"
        exit 1
    }
fi

# Create output directory
mkdir -p "$OUTPUT_DIR/compiled_smali"
mkdir -p "$OUTPUT_DIR/diffs"

echo "=== Step 1: Finding Java source file ==="
JAVA_FILE=$(find "$JAVA_SRC_DIR" -name "${CLASS_NAME}.java" | head -1)
if [ -z "$JAVA_FILE" ]; then
    echo "Error: ${CLASS_NAME}.java not found in $JAVA_SRC_DIR"
    exit 1
fi
echo "Found: $JAVA_FILE"

# Extract package path
PACKAGE_PATH=$(grep "^package " "$JAVA_FILE" | sed 's/package //;s/;//' | tr '.' '/')
echo "Package path: $PACKAGE_PATH"

echo ""
echo "=== Step 2: Compiling Java to class files ==="
CLASS_OUTPUT_DIR="$OUTPUT_DIR/classes"
mkdir -p "$CLASS_OUTPUT_DIR"

# Find all dependencies (other Java files in the same package and imports)
# For now, compile just the target class with basic classpath
CLASSPATH="$JAVA_SRC_DIR:$(find jadx_gradle_export -name "*.jar" | tr '\n' ':')"

javac -d "$CLASS_OUTPUT_DIR" \
      -sourcepath "$JAVA_SRC_DIR" \
      -cp "$CLASSPATH" \
      "$JAVA_FILE" 2>&1 | tee "$OUTPUT_DIR/compile.log" || {
    echo "Warning: Compilation had errors. Check $OUTPUT_DIR/compile.log"
    echo "Continuing anyway..."
}

echo ""
echo "=== Step 3: Converting class files to DEX ==="
DEX_OUTPUT="$OUTPUT_DIR/classes.dex"
"$D8_PATH" --lib ~/Library/Android/sdk/platforms/android-34/android.jar \
           --output "$OUTPUT_DIR" \
           "$CLASS_OUTPUT_DIR"/**/*.class 2>&1 | tee "$OUTPUT_DIR/d8.log" || {
    echo "Warning: D8 conversion had errors. Check $OUTPUT_DIR/d8.log"
}

if [ ! -f "$DEX_OUTPUT" ]; then
    echo "Error: DEX file not created. Check $OUTPUT_DIR/d8.log"
    exit 1
fi

echo ""
echo "=== Step 4: Converting DEX to Smali ==="
java -jar "$BAKSMALI_JAR" disassemble "$DEX_OUTPUT" \
     -o "$OUTPUT_DIR/compiled_smali" 2>&1 | tee "$OUTPUT_DIR/baksmali.log" || {
    echo "Error: baksmali conversion failed. Check $OUTPUT_DIR/baksmali.log"
    exit 1
}

echo ""
echo "=== Step 5: Finding original Smali file ==="
ORIGINAL_SMALI=$(find "$ORIGINAL_SMALI_DIR" -name "${CLASS_NAME}.smali" | head -1)
if [ -z "$ORIGINAL_SMALI" ]; then
    echo "Warning: Original ${CLASS_NAME}.smali not found in $ORIGINAL_SMALI_DIR"
    echo "Generated Smali is in: $OUTPUT_DIR/compiled_smali"
    exit 0
fi
echo "Found: $ORIGINAL_SMALI"

COMPILED_SMALI=$(find "$OUTPUT_DIR/compiled_smali" -name "${CLASS_NAME}.smali" | head -1)
if [ -z "$COMPILED_SMALI" ]; then
    echo "Error: Compiled ${CLASS_NAME}.smali not found"
    exit 1
fi
echo "Compiled: $COMPILED_SMALI"

echo ""
echo "=== Step 6: Comparing Smali files ==="
DIFF_OUTPUT="$OUTPUT_DIR/diffs/${CLASS_NAME}.diff"
diff -u "$ORIGINAL_SMALI" "$COMPILED_SMALI" > "$DIFF_OUTPUT" || {
    echo "Differences found! See: $DIFF_OUTPUT"
    echo ""
    echo "Summary:"
    echo "  Original:  $ORIGINAL_SMALI"
    echo "  Compiled:  $COMPILED_SMALI"
    echo "  Diff:      $DIFF_OUTPUT"
} && {
    echo "No differences found! Java code matches original Smali."
    rm -f "$DIFF_OUTPUT"
}

echo ""
echo "=== Done ==="
echo "All output files are in: $OUTPUT_DIR"






