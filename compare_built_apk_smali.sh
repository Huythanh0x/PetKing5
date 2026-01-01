#!/bin/bash
# Script to build Java APK, decompile to Smali, and compare with original
# This ensures the Java code produces the same bytecode as the original

set -e

OUTPUT_DIR="smali_comparison"
ORIGINAL_SMALI_DIR="original_petking_5/smali"
BUILT_APK="jadx_gradle_export/app/build/outputs/apk/debug/app-debug.apk"
BAKSMALI_JAR="baksmali.jar"

echo "=== Step 1: Building APK with Gradle ==="
cd jadx_gradle_export
mkdir -p ../"$OUTPUT_DIR"
if ./gradlew assembleDebug 2>&1 | tee ../"$OUTPUT_DIR"/gradle_build.log; then
    echo "Build succeeded"
else
    BUILD_EXIT_CODE=$?
    if grep -q "BUILD SUCCESSFUL" ../"$OUTPUT_DIR"/gradle_build.log; then
        echo "Build succeeded (despite non-zero exit code)"
    else
        echo "Error: Gradle build failed. Check $OUTPUT_DIR/gradle_build.log"
        cd ..
        exit 1
    fi
fi
cd ..

if [ ! -f "$BUILT_APK" ]; then
    echo "Error: Built APK not found at $BUILT_APK"
    exit 1
fi

echo ""
echo "=== Step 2: Decompiling built APK with Apktool ==="
BUILT_SMALI_DIR="$OUTPUT_DIR/built_smali"
rm -rf "$BUILT_SMALI_DIR"
apktool d "$BUILT_APK" -o "$BUILT_SMALI_DIR" --force 2>&1 | tee "$OUTPUT_DIR/apktool_decompile.log" || {
    echo "Error: Apktool decompilation failed. Check $OUTPUT_DIR/apktool_decompile.log"
    exit 1
}

echo ""
echo "=== Step 3: Comparing Smali files ==="
mkdir -p "$OUTPUT_DIR/diffs"

# Find all .smali files in the main package
find "$ORIGINAL_SMALI_DIR/main" -name "*.smali" | while read original_file; do
    rel_path=${original_file#$ORIGINAL_SMALI_DIR/}
    filename=$(basename "$original_file")
    
    # Search for the file in all DEX directories (smali, smali_classes2, etc.)
    built_file=$(find "$BUILT_SMALI_DIR" -path "*/$rel_path" -type f | head -1)
    
    if [ -n "$built_file" ] && [ -f "$built_file" ]; then
        diff_output="$OUTPUT_DIR/diffs/${filename}.diff"
        
        echo "Comparing: $filename"
        echo "  Original: $original_file"
        echo "  Built:    $built_file"
        if diff -u "$original_file" "$built_file" > "$diff_output" 2>&1; then
            echo "  → No differences"
            rm -f "$diff_output"
        else
            echo "  → Differences found! See: $diff_output"
            # Show summary (count actual diff lines, not headers)
            diff_count=$(grep -E '^[+-][^+-]' "$diff_output" | wc -l | tr -d ' ')
            echo "  → Lines changed: $diff_count"
        fi
    else
        echo "Warning: $rel_path not found in built APK"
        echo "  Searched in: $(find "$BUILT_SMALI_DIR" -type d -name main | head -3 | tr '\n' ' ')"
    fi
done

echo ""
echo "=== Step 4: Generating comparison report ==="
REPORT="$OUTPUT_DIR/comparison_report.txt"
{
    echo "Smali Comparison Report"
    echo "Generated: $(date)"
    echo ""
    echo "Original Smali: $ORIGINAL_SMALI_DIR"
    echo "Built APK Smali: $BUILT_SMALI_DIR"
    echo ""
    echo "Files with differences:"
    find "$OUTPUT_DIR/diffs" -name "*.diff" -exec basename {} \; | sed 's/\.diff$//' | while read file; do
        echo "  - $file"
    done
    echo ""
    echo "Total files compared: $(find "$ORIGINAL_SMALI_DIR/main" -name "*.smali" | wc -l)"
    echo "Files with differences: $(find "$OUTPUT_DIR/diffs" -name "*.diff" | wc -l)"
} > "$REPORT"

echo "Report saved to: $REPORT"
echo ""
echo "=== Done ==="
echo "All output files are in: $OUTPUT_DIR"
echo ""
echo "To view differences for a specific file:"
echo "  cat $OUTPUT_DIR/diffs/MainCanvas.smali.diff"

