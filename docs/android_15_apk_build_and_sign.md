# Android 15 APK Build and Signing Guide

## Overview

This document covers the steps taken to configure the Pet Kingdom 5 APK to target Android 15 (API level 35) and resolve installation issues on modern Android devices, particularly Oppo devices.

## Issues Encountered

### 1. Missing Target SDK Declaration

**Problem:** The original AndroidManifest.xml did not have a `<uses-sdk>` element, preventing proper targeting of Android 15.

**Error:** None initially, but the APK would not be configured for modern Android versions.

**Solution:** Added the `<uses-sdk>` element to AndroidManifest.xml:
```xml
<uses-sdk android:minSdkVersion="21" android:targetSdkVersion="35"/>
```

- `minSdkVersion="21"`: Android 5.0 Lollipop (reasonable minimum for modern devices)
- `targetSdkVersion="35"`: Android 15 (current target)

---

### 2. Missing `android:exported` Attributes (Android 12+ Requirement)

**Problem:** When targeting Android 12+ (API level 31+), all activities, services, and receivers with intent filters must explicitly declare the `android:exported` attribute.

**Error:**
```
INSTALL_PARSE_FAILED_MANIFEST_MALFORMED: 
Targeting S+ (version 31 and above) requires that an explicit value for android:exported 
be defined when intent filters are present
```

**Solution:** Added `android:exported="true"` to all components with intent filters:

1. **Main Activity** (`.PetKing5`): Launcher activity - must be exported
2. **soars.Choose Activity**: Also has launcher category - must be exported
3. **SkyPayNetworkReceiver**: Broadcast receiver with intent filter - must be exported

**Modified AndroidManifest.xml entries:**
```xml
<activity android:configChanges="keyboardHidden|orientation" 
          android:exported="true" 
          android:label="@string/app_name" 
          android:name=".PetKing5" 
          android:screenOrientation="landscape">
    <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.LAUNCHER"/>
    </intent-filter>
</activity>

<activity android:exported="true" android:name="soars.Choose">
    <intent-filter>
        <category android:name="android.intent.category.LAUNCHER"/>
    </intent-filter>
</activity>

<receiver android:exported="true" android:name="com.skymobi.pay.sdk.SkyPayNetworkReceiver">
    <intent-filter android:priority="2147483647">
        <action android:name="android.net.conn.CONNECTIVITY_CHANGE"/>
    </intent-filter>
</receiver>
```

---

### 3. APK Zipalign Requirement (Android 11+)

**Problem:** Android 11+ (API level 30+) requires APKs to have `resources.arsc` stored uncompressed and aligned on a 4-byte boundary.

**Error:**
```
INSTALL_PARSE_FAILED_NOT_APK: 
Targeting R+ (version 30 and above) requires the resources.arsc of installed APKs 
to be stored uncompressed and aligned on a 4-byte boundary
```

**Solution:** Use `zipalign` tool from Android SDK build-tools to align the APK before signing.

---

### 4. APK Signature Scheme Requirement (Android 7.0+)

**Problem:** Android 7.0+ (API level 24+) requires APK Signature Scheme v2 or higher. The old `jarsigner` tool only creates v1 signatures.

**Error:**
```
INSTALL_PARSE_FAILED_NO_CERTIFICATES: 
Scanning Failed.: No signature found in package of version 2 or newer
```

**Solution:** Use `apksigner` (from Android SDK build-tools) instead of `jarsigner` to create v2/v3 signatures.

---

### 5. Oppo Device ICP Filing Error

**Problem:** Oppo devices (and some other Chinese manufacturers) may block installation of unsigned or improperly signed APKs with "ICP filing not found" error.

**Solution:** Properly sign the APK with v2/v3 signatures using `apksigner`. This resolves the installation block on Oppo devices.

---

## Prerequisites

### Required Tools

1. **Android SDK Build-Tools** (includes `zipalign` and `apksigner`)
2. **Java JDK** (for `keytool` and `jarsigner`)
3. **ADB** (Android Debug Bridge) for installation

### Installing Android SDK Build-Tools

**Via Command Line:**
```bash
# Accept licenses first
~/Library/Android/sdk/cmdline-tools/bin/sdkmanager \
  --sdk_root=/Users/vfa/Library/Android/sdk --licenses

# Install build-tools
~/Library/Android/sdk/cmdline-tools/bin/sdkmanager \
  --sdk_root=/Users/vfa/Library/Android/sdk "build-tools;34.0.0"
```

**Note:** Use absolute path (`/Users/vfa/Library/Android/sdk`) instead of `~` to ensure licenses are stored correctly.

---

## Solution Implementation

### Step 1: Create Debug Keystore

A debug keystore is needed to sign the APK. If you don't have one:

```bash
keytool -genkey -v -keystore debug.keystore \
  -storepass android \
  -alias androiddebugkey \
  -keypass android \
  -keyalg RSA -keysize 2048 \
  -validity 10000 \
  -dname "CN=Android Debug,O=Android,C=US"
```

**Credentials:**
- Keystore password: `android`
- Key alias: `androiddebugkey`
- Key password: `android`

**Security Note:** This is a debug keystore. Never use this for production releases. Add `*.keystore` to `.gitignore`.

### Step 2: Zipalign and Sign APK

Use the provided `sign_apk.sh` script:

```bash
./sign_apk.sh
```

The script:
1. Finds `zipalign` and `apksigner` from Android SDK build-tools
2. Aligns the APK (4-byte boundary alignment)
3. Signs the APK with v2/v3 signatures using `apksigner`
4. Outputs the signed APK ready for installation

### Manual Signing Process

If you prefer to do it manually:

```bash
# Step 1: Zipalign
zipalign -v -p 4 original_petking_5/dist/original_petking_5.apk \
  original_petking_5/dist/original_petking_5.apk.aligned

# Step 2: Sign with apksigner
apksigner sign \
  --ks debug.keystore \
  --ks-key-alias androiddebugkey \
  --ks-pass pass:android \
  --key-pass pass:android \
  --out original_petking_5/dist/original_petking_5.apk \
  original_petking_5/dist/original_petking_5.apk.aligned

# Clean up
rm original_petking_5/dist/original_petking_5.apk.aligned
```

---

## Complete Build and Sign Workflow

### 1. Modify AndroidManifest.xml

Ensure the manifest includes:
- `<uses-sdk>` element with targetSdkVersion="35"
- `android:exported` attributes on all components with intent filters

### 2. Rebuild APK with apktool

```bash
apktool b original_petking_5 --force
```

**Note:** Do NOT use `--use-aapt2` flag with apktool 2.12.1 (it's not a valid option - apktool uses aapt2 by default).

### 3. Sign the APK

```bash
./sign_apk.sh
```

### 4. Install on Device

```bash
adb install -r original_petking_5/dist/original_petking_5.apk
```

---

## Script: `sign_apk.sh`

The signing script automates the zipalign and signing process. Key features:

- **Auto-detects build-tools**: Finds the latest installed version automatically
- **Zipalign**: Ensures 4-byte boundary alignment for Android 11+
- **apksigner**: Creates v2/v3 signatures for Android 7.0+
- **Error handling**: Checks for required tools and validates each step

**Location:** `/Users/vfa/CodeProjects/PetKing5/sign_apk.sh`

---

## Troubleshooting

### Build-Tools Not Found

**Error:** `zipalign or apksigner not found`

**Solution:** Install Android SDK build-tools (see Prerequisites section).

### License Not Accepted

**Error:** `Skipping following packages as the license is not accepted`

**Solution:** Accept licenses using:
```bash
~/Library/Android/sdk/cmdline-tools/bin/sdkmanager \
  --sdk_root=/Users/vfa/Library/Android/sdk --licenses
```

Type `y` when prompted for each license.

### APK Still Won't Install

1. **Check device settings**: Enable "Install from unknown sources" or "Install via USB"
2. **Verify signature**: Use `apksigner verify` to check if APK is properly signed
3. **Check device logs**: Use `adb logcat` to see detailed error messages
4. **Uninstall previous version**: Some devices require uninstalling the old app first

### Verify APK Signature

To verify the APK is properly signed:

```bash
apksigner verify --verbose original_petking_5/dist/original_petking_5.apk
```

You should see:
```
Verifies
Verified using v1 scheme (JAR signing): true
Verified using v2 scheme (APK Signature Scheme v2): true
Verified using v3 scheme (APK Signature Scheme v3): true
```

---

## Summary of Changes

### Files Modified

1. **`original_petking_5/AndroidManifest.xml`**
   - Added `<uses-sdk>` element with targetSdkVersion="35"
   - Added `android:exported="true"` to activities and receivers with intent filters

2. **`.gitignore`**
   - Added `*.keystore` and `*.jks` to prevent committing keystore files

### Files Created

1. **`debug.keystore`**
   - Debug signing keystore (DO NOT commit to git)

2. **`sign_apk.sh`**
   - Automated script for zipaligning and signing APKs

3. **`docs/android_15_apk_build_and_sign.md`**
   - This documentation file

---

## References

- [Android Developer Guide: Sign Your App](https://developer.android.com/studio/publish/app-signing)
- [Android APK Signature Scheme v2](https://source.android.com/security/apksigning/v2)
- [Android 12 Behavior Changes: Components with intent filters](https://developer.android.com/about/versions/12/behavior-changes-12#exported)
- [Android 11 Behavior Changes: APK alignment](https://developer.android.com/about/versions/11/behavior-changes-11#minimum-signature-scheme)

---

## Date Created

January 1, 2025

## Last Updated

January 1, 2025






