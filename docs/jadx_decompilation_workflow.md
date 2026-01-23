# Jadx Decompilation Workflow

## Overview

This document outlines the workflow for decompiling the APK using Jadx and converting it to a buildable Gradle project, making it easier to maintain and modify than working with smali code.

## Tools Needed

1. **Jadx** - Primary decompiler
   ```bash
   # Install Jadx
   brew install jadx  # macOS
   # Or download from: https://github.com/skylot/jadx/releases
   ```

2. **Alternative Decompilers** (for comparison/fixing):
   - **CFR**: `brew install cfr-decompiler` or download from https://www.benf.org/other/cfr/
   - **Procyon**: Available via Maven or download from GitHub
   - **Fernflower**: Included in IntelliJ IDEA, can extract standalone

3. **Android Studio** - For building the Gradle project

## Workflow Steps

### Step 1: Backup Current State

Before switching, document the fixes we've made in smali:

1. **Region.Op.REPLACE fix** in `Graphics.setClip()`:
   - Changed from `Region.Op.REPLACE` to `Region.Op.INTERSECT`
   - Location: `javax/microedition/lcdui/Graphics.java` line ~407

2. **AndroidManifest.xml changes**:
   - Added `uses-sdk` with `minSdkVersion="21"` and `targetSdkVersion="35"`
   - Added `android:exported="true"` to activities/receivers with intent filters

3. **apktool.yml changes**:
   - Updated `minSdkVersion: 21` and `targetSdkVersion: 35`

### Step 2: Decompile with Jadx

```bash
# Basic decompilation to Java source
jadx -d petking5_gradle --show-bad-code original_petking_5.apk

# Or with more options:
jadx -d petking5_gradle \
     --show-bad-code \
     --no-imports \
     --deobf \
     --threads-count 4 \
     --no-res \
     original_petking_5.apk

# For Gradle project output:
jadx-gui original_petking_5.apk
# Then: File > Save as Gradle project
```

### Step 3: Compare Decompilers

Use multiple decompilers to get the best code quality:

```bash
# Jadx
jadx -d output_jadx original_petking_5.apk

# CFR
cfr original_petking_5.apk --outputdir output_cfr

# Procyon (if available)
java -jar procyon-decompiler.jar -jar original_petking_5.apk -o output_procyon
```

Compare the outputs for problematic classes and choose the best decompilation.

### Step 4: Create Gradle Project Structure

If Jadx doesn't create a full Gradle project, you'll need to:

1. **Create standard Android project structure:**
   ```
   petking5_gradle/
   ├── app/
   │   ├── build.gradle
   │   ├── src/
   │   │   └── main/
   │   │       ├── AndroidManifest.xml
   │   │       ├── java/
   │   │       │   └── [your decompiled source]
   │   │       ├── res/
   │   │       └── assets/
   │   └── proguard-rules.pro
   ├── build.gradle (project level)
   ├── settings.gradle
   └── gradle.properties
   ```

2. **Set up build.gradle** with appropriate SDK versions:
   ```gradle
   android {
       compileSdkVersion 35
       buildToolsVersion "34.0.0"
       
       defaultConfig {
           applicationId "com.PetKing5_480x800"
           minSdkVersion 21
           targetSdkVersion 35
           versionCode 1
           versionName "1.0"
       }
       
       compileOptions {
           sourceCompatibility JavaVersion.VERSION_1_8
           targetCompatibility JavaVersion.VERSION_1_8
       }
   }
   ```

### Step 5: Fix Decompilation Errors

Common issues and fixes:

1. **Missing imports**: Add proper import statements
2. **Invalid syntax**: Fix syntax errors (wrong variable names, etc.)
3. **Obfuscated names**: Rename classes/methods to meaningful names
4. **Missing resources**: Ensure resources from APK are copied to `res/`
5. **Native libraries**: Copy `.so` files to `src/main/jniLibs/`

### Step 6: Apply Previous Fixes

Re-apply the fixes we made in smali:

1. **Graphics.setClip() fix:**
   ```java
   // In javax.microedition.lcdui.Graphics.java
   public void setClip(int x, int y, int width, int height) {
       this.clipx = x;
       this.clipy = y;
       this.clipw = width;
       this.cliph = height;
       if (width >= 0 && height >= 0) {
           // REPLACE is deprecated in Android 9+, use INTERSECT instead
           this.canvas.clipRect(x, y, x + width, y + height, Region.Op.INTERSECT);
       }
   }
   ```

2. **AndroidManifest.xml**: Ensure all previous changes are applied

### Step 7: Build and Test

```bash
# In Android Studio, or via command line:
./gradlew assembleDebug

# Sign and install
./gradlew installDebug
# Or manually sign with apksigner
```

## Challenges and Solutions

### Challenge 1: Code Won't Compile

**Solution:**
- Use `--show-bad-code` flag in Jadx to see what couldn't be decompiled
- Compare with other decompilers
- Manually fix syntax errors
- For obfuscated code, may need to keep some smali patches

### Challenge 2: Missing Dependencies

**Solution:**
- Identify missing libraries from the original APK
- Add them to `build.gradle` dependencies
- Check `lib/` folder for native libraries

### Challenge 3: Resource Issues

**Solution:**
- Copy all resources from apktool output (`original_petking_5/res/`)
- Ensure `R.java` is properly generated
- Fix any resource ID references

### Challenge 4: Alignment Issue

Once we have Java source, fixing the alignment issue will be easier:

```java
// In Canvas or MainCanvas, override onMeasure or add translation:
@Override
protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
    // Calculate proper dimensions for centering
    // Then use canvas.translate() in onDraw to center the content
}
```

## Recommended Approach

1. **Start with Jadx GUI** to get a feel for the code quality
2. **Export as Gradle project** if available
3. **Fix critical compilation errors** first (the ones that prevent building)
4. **Apply our previous fixes** (Region.Op, manifest)
5. **Incremental testing**: Build and test after each major fix
6. **Document changes** as you go

## Advantages Over Smali

1. ✅ Easier to read and understand
2. ✅ Better IDE support (autocomplete, refactoring, debugging)
3. ✅ Easier to add new features (localization, new IAP system)
4. ✅ Can use modern Android development tools
5. ✅ Easier code review and collaboration

## When to Use Smali

- For very small, targeted patches
- When decompiled Java won't compile
- For testing quick changes without full rebuild

## Next Steps

1. Run Jadx on the APK
2. Assess code quality
3. Set up Gradle project structure
4. Fix compilation errors
5. Apply previous fixes
6. Test and iterate

---

## Date Created

January 1, 2025






