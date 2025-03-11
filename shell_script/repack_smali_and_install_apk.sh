#!/bin/bash

# Define variables
SMALI_DIR="apktool_output"
OUTPUT_APK="repacked_petking_5.apk"
PACKAGE_NAME="com.PetKing5_480x800"
KEYSTORE="shell_script/mock_keystore.jks"
KEY_ALIAS="mockkey"
KEYSTORE_PASS="mockpassword"
KEYSTORE_KEY_PASS="mockpassword"
APK_SIGNER="/Users/thanh0x/Library/Android/sdk/build-tools/34.0.0/apksigner"

# Repack smali files into an APK
apktool b "$SMALI_DIR" -o "$OUTPUT_APK"

# Generate a keystore (if not already done)
if [ ! -f "$KEYSTORE" ]; then
  keytool -genkeypair -v -keystore "$KEYSTORE" -keyalg RSA -keysize 2048 -validity 10000 -alias "$KEY_ALIAS" -dname "CN=Mock, OU=Mock, O=Mock, L=Mock, S=Mock, C=US" -storepass "$KEYSTORE_PASS" -keypass "$KEYSTORE_KEY_PASS"
fi

# Sign the APK using apksigner
"$APK_SIGNER" sign --ks "$KEYSTORE" --ks-key-alias "$KEY_ALIAS" --ks-pass pass:"$KEYSTORE_PASS" --key-pass pass:"$KEYSTORE_KEY_PASS" --out "$OUTPUT_APK" "$OUTPUT_APK"

# Verify the APK signature (optional)
"$APK_SIGNER" verify "$OUTPUT_APK"

# Install the APK on the connected device
adb install -r "$OUTPUT_APK"

# Launch the app (optional)
adb shell monkey -p "$PACKAGE_NAME" -c android.intent.category.LAUNCHER 1