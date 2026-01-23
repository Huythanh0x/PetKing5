# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.

# Keep all classes to avoid issues with decompiled code
-keep class * {
    *;
}

# Keep all native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep all classes in the main package
-keep class com.PetKing5_480x800.** { *; }
-keep class main.** { *; }
-keep class dm.** { *; }
-keep class javax.microedition.** { *; }






