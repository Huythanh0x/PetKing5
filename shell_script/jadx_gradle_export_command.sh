rm -rf decompiled_gradle
jadx -v -d decompiled_gradle --export-gradle --show-bad-code --comments-level warn --escape-unicode --respect-bytecode-access-modifiers original_petking_5.apk
# -> wont' create gralde script