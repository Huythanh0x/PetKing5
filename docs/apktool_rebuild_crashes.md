# APK Rebuild Crashes - Troubleshooting Guide

## Problem

After rebuilding the APK with apktool, the app crashes immediately on launch, even when no changes are made to the code or manifest.

## Common Causes and Solutions

### 1. Signature Verification (Most Common)

**Problem:** Many Android apps check their APK signature at runtime as a security measure. When you rebuild and sign with a different key, the app detects the signature mismatch and crashes.

**Symptoms:**
- App crashes immediately on launch
- No visible error messages
- Works fine with original APK

**Solutions:**

#### Option A: Use `--copy-original` Flag (Recommended First Try)

Rebuild with the `--copy-original` flag to preserve the original AndroidManifest.xml and META-INF:

```bash
apktool b original_petking_5 --copy-original --force
```

Then you still need to sign it (but it preserves original metadata):

```bash
./sign_apk.sh
```

#### Option B: Disable Signature Verification in Code

If the app has signature verification logic, you need to modify it:

1. Search for signature verification code in smali files:
```bash
grep -r "getPackageManager\|getPackageInfo\|PackageManager.GET_SIGNATURES" original_petking_5/smali/
```

2. Look for checks like:
   - Signature comparisons
   - Certificate checks
   - Package info verification

3. Modify the smali code to bypass verification (requires knowledge of smali syntax)

#### Option C: Use Original Signing Key

If you have access to the original signing key, use it instead of the debug keystore:

```bash
apksigner sign \
  --ks original.keystore \
  --ks-key-alias original_alias \
  --ks-pass pass:original_password \
  --key-pass pass:original_key_password \
  --out signed.apk \
  unsigned.apk
```

### 2. Resource Compilation Issues

**Problem:** Apktool may not perfectly recompile resources, especially with complex APKs.

**Solution:** Try using a newer version of apktool or check for resource errors:

```bash
# Check apktool version
apktool --version

# Rebuild with verbose output
apktool b original_petking_5 --force -v
```

### 3. Missing Native Libraries

**Problem:** Native libraries (`.so` files) might not be preserved correctly during rebuild.

**Check if the original APK has native libraries:**

```bash
unzip -l original_petking_5.apk | grep "\.so\|lib/"
```

**Solution:** Ensure native libraries are preserved in the `lib/` directory during decompile/rebuild. Apktool should handle this automatically, but verify:

```bash
ls -la original_petking_5/lib/ 2>/dev/null || echo "No lib directory found"
```

### 4. Missing Assets or Files

**Problem:** Some files might not be included in the rebuilt APK.

**Solution:** Compare file lists:

```bash
# Original APK
unzip -l original_petking_5.apk > /tmp/original_files.txt

# Rebuilt APK  
unzip -l original_petking_5/dist/original_petking_5.apk > /tmp/rebuilt_files.txt

# Compare
diff /tmp/original_files.txt /tmp/rebuilt_files.txt
```

### 5. AndroidManifest.xml Issues

**Problem:** Changes to AndroidManifest.xml might cause issues even if syntax is correct.

**Solution:** For testing, try rebuilding WITHOUT any manifest changes first:

1. Revert all AndroidManifest.xml changes
2. Rebuild: `apktool b original_petking_5 --copy-original --force`
3. Sign: `./sign_apk.sh`
4. Test if it works

If it works without changes, add changes incrementally.

### 6. ProGuard/Obfuscation Issues

**Problem:** If the original APK was obfuscated, decompiling/recompiling can cause issues.

**Solution:** This is harder to fix. You may need to:
- Use a different decompiler (JADX instead of apktool for Java code)
- Manually fix smali code issues
- Consider if the changes can be made at runtime instead (using Frida/Xposed)

---

## Debugging Steps

### Step 1: Get Crash Logs

```bash
# Clear logcat
adb logcat -c

# Launch the app, then immediately get logs
adb logcat -d | grep -A 30 -i "androidruntime\|fatal\|exception"
```

Look for:
- `FATAL EXCEPTION`
- `RuntimeException`
- `SecurityException` (signature verification)
- `ClassNotFoundException`
- `NoSuchMethodError`

### Step 2: Check for Signature Verification

Search the smali code for signature checks:

```bash
cd original_petking_5
grep -r "getPackageInfo\|GET_SIGNATURES\|signatures\[0\]" smali/
```

### Step 3: Compare Original vs Rebuilt APK

```bash
# Extract both APKs
mkdir -p /tmp/apk_compare/{original,rebuilt}

# Original
unzip -q original_petking_5.apk -d /tmp/apk_compare/original/

# Rebuilt (unsigned)
unzip -q original_petking_5/dist/original_petking_5.apk -d /tmp/apk_compare/rebuilt/

# Compare key files
diff -r /tmp/apk_compare/original/META-INF /tmp/apk_compare/rebuilt/META-INF
diff /tmp/apk_compare/original/AndroidManifest.xml /tmp/apk_compare/rebuilt/AndroidManifest.xml
```

### Step 4: Test Minimal Rebuild

Try the absolute minimum rebuild to isolate the issue:

```bash
# 1. Decompile
apktool d original_petking_5.apk -o test_rebuild -f

# 2. Rebuild WITHOUT any changes
apktool b test_rebuild --copy-original

# 3. Sign
./sign_apk.sh  # (modify script to use test_rebuild/dist/test_rebuild.apk)

# 4. Test
adb install -r test_rebuild/dist/test_rebuild.apk
```

If this crashes, the problem is with apktool rebuild itself, not your changes.

---

## Recommended Workflow

1. **First, try `--copy-original` flag:**
   ```bash
   apktool b original_petking_5 --copy-original --force
   ./sign_apk.sh
   ```

2. **If that doesn't work, check logs:**
   ```bash
   adb logcat -c && adb logcat | grep -i "petking"
   # Launch app, capture crash logs
   ```

3. **Search for signature verification:**
   ```bash
   grep -r "getPackageInfo\|signatures" original_petking_5/smali/
   ```

4. **If signature verification found, you'll need to:**
   - Either bypass it in smali code
   - Or find the original signing key
   - Or use runtime patching (Frida/Xposed)

---

## Alternative Approaches

If rebuilding continues to cause crashes:

### Option 1: Use JADX Instead

JADX decompiles to Java source code (instead of smali), which might be easier to modify:

```bash
jadx -d output_dir original_petking_5.apk
# Modify Java code
# Rebuild with Android Studio or Gradle
```

### Option 2: Runtime Patching

Use Frida or Xposed to patch the app at runtime instead of modifying the APK:

- **Frida:** JavaScript-based runtime instrumentation
- **Xposed:** Framework for modifying app behavior at runtime

### Option 3: Use Original APK with Minimal Changes

If you only need to change the manifest (like targetSdkVersion), consider:
- Using tools like `aapt2` or `AndroidManifest.xml` patching tools
- Or modify only the specific manifest entries without full rebuild

---

## Additional Resources

- [Apktool Documentation](https://ibotpeaches.github.io/Apktool/)
- [Android Signature Verification Bypass](https://reverseengineering.stackexchange.com/questions/tagged/signature-verification)
- [Smali Documentation](https://github.com/JesusFreke/smali/wiki)

---

## Date Created

January 1, 2025

## Last Updated

January 1, 2025






