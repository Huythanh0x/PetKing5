#!/bin/bash
# Script to zipalign and sign the APK for Android 11+ compatibility

APK_PATH="original_petking_5/dist/original_petking_5.apk"
KEYSTORE="debug.keystore"
ALIGNED_APK="${APK_PATH}.aligned"
SIGNED_APK="${APK_PATH}"

# Find build tools (zipalign and apksigner)
BUILD_TOOLS_DIR=$(find ~/Library/Android/sdk/build-tools -maxdepth 1 -type d 2>/dev/null | sort -V | tail -1)
if [ -z "$BUILD_TOOLS_DIR" ]; then
    BUILD_TOOLS_DIR=$(find ~/Android/Sdk/build-tools -maxdepth 1 -type d 2>/dev/null | sort -V | tail -1)
fi

ZIPALIGN="$BUILD_TOOLS_DIR/zipalign"
APKSIGNER="$BUILD_TOOLS_DIR/apksigner"

if [ ! -f "$ZIPALIGN" ] || [ ! -f "$APKSIGNER" ]; then
    echo "Error: zipalign or apksigner not found!"
    echo "Please install Android SDK build-tools:"
    echo "  - Via Android Studio: SDK Manager > SDK Tools > Android SDK Build-Tools"
    echo "  - Via command line: sdkmanager 'build-tools;34.0.0'"
    exit 1
fi

echo "Step 1: Zipaligning APK..."
$ZIPALIGN -v -p 4 "$APK_PATH" "$ALIGNED_APK"

if [ $? -ne 0 ]; then
    echo "Error: Zipalign failed!"
    exit 1
fi

echo "Step 2: Signing aligned APK with apksigner (v2/v3 signatures)..."
$APKSIGNER sign \
    --ks "$KEYSTORE" \
    --ks-key-alias androiddebugkey \
    --ks-pass pass:android \
    --key-pass pass:android \
    --out "$SIGNED_APK" \
    "$ALIGNED_APK"

if [ $? -ne 0 ]; then
    echo "Error: Signing failed!"
    rm -f "$ALIGNED_APK"
    exit 1
fi

# Clean up aligned temp file
rm -f "$ALIGNED_APK"

echo "APK successfully aligned and signed!"
echo "You can now install it with: adb install -r $SIGNED_APK"

