package com.petking.reverse.jadx

import com.petking.reverse.utils.DependencyChecker
import com.petking.reverse.utils.ValidationResult
import java.io.File

/**
 * Wrapper for Jadx operations
 * Uses DependencyChecker from utils module for validation
 */
class JadxWrapper {
    
    /**
     * Decompile APK to Java/Gradle project using jadx
     * Note: Dependencies should be checked via DependencyChecker before calling this
     * 
     * @param overwriteExisting If true, clears existing directory before decompiling
     */
    fun decompileToGradle(
        apkFile: File, 
        outputDir: File, 
        exportGradle: Boolean = true,
        overwriteExisting: Boolean = false
    ): JadxResult {
        // Check if output directory exists and has content
        if (outputDir.exists() && outputDir.isDirectory) {
            val hasContent = outputDir.listFiles()?.isNotEmpty() == true
            if (hasContent && !overwriteExisting) {
                return JadxResult.Error(
                    "Output directory already exists and is not empty: ${outputDir.absolutePath}\n" +
                    "Files found: ${outputDir.listFiles()?.size ?: 0}\n" +
                    "To overwrite, set overwriteExisting=true or manually remove the directory first."
                )
            }
            
            // Clear existing directory if overwrite is requested
            if (hasContent && overwriteExisting) {
                try {
                    outputDir.deleteRecursively()
                    outputDir.mkdirs()
                } catch (e: Exception) {
                    return JadxResult.Error(
                        "Failed to clear existing output directory: ${outputDir.absolutePath}\n" +
                        "Error: ${e.message}\n" +
                        "Please manually remove the directory and try again."
                    )
                }
            }
        }
        
        // Validate/create output directory
        val dirValidation = DependencyChecker.validateDirectory(outputDir, createIfNotExists = true)
        if (dirValidation is ValidationResult.Error) {
            return JadxResult.Error(dirValidation.message)
        }
        
        // Execute jadx
        try {
            val command = mutableListOf("jadx", "-d", outputDir.absolutePath)
            if (exportGradle) {
                command.add("--export-gradle")
            }
            command.add(apkFile.absolutePath)
            
            val processBuilder = ProcessBuilder(command)
            processBuilder.redirectErrorStream(true)
            
            val process = processBuilder.start()
            val output = process.inputStream.bufferedReader().readText()
            val exitCode = process.waitFor()
            
            if (exitCode == 0) {
                val javaDir = File(outputDir, "app/src/main/java")
                val gradleBuildFile = File(outputDir, "build.gradle")
                return JadxResult.Success(
                    outputDir = outputDir,
                    javaDirectory = if (javaDir.exists()) javaDir else null,
                    gradleProject = gradleBuildFile.exists(),
                    output = output
                )
            } else {
                // Parse jadx output for better error messages
                val errorDetails = parseJadxError(output)
                return JadxResult.Error(
                    "jadx decompilation failed (exit code: $exitCode)\n" +
                    "Output directory: ${outputDir.absolutePath}\n" +
                    "$errorDetails\n" +
                    "Full jadx output:\n$output"
                )
            }
        } catch (e: Exception) {
            return JadxResult.Error(
                "Failed to execute jadx command\n" +
                "Output directory: ${outputDir.absolutePath}\n" +
                "Error: ${e.message}\n" +
                "Stack trace: ${e.stackTrace.take(5).joinToString("\n")}"
            )
        }
    }
    
    /**
     * Parse jadx output to extract meaningful error information
     */
    private fun parseJadxError(output: String): String {
        val lines = output.lines()
        val errorLines = lines.filter { 
            it.contains("ERROR", ignoreCase = true) || 
            it.contains("error", ignoreCase = true) ||
            it.contains("failed", ignoreCase = true)
        }
        
        if (errorLines.isNotEmpty()) {
            return "Errors detected:\n  - ${errorLines.take(5).joinToString("\n  - ")}"
        }
        
        // Check for common patterns
        if (output.contains("finished with errors")) {
            val errorCountMatch = Regex("finished with errors, count: (\\d+)").find(output)
            val errorCount = errorCountMatch?.groupValues?.get(1) ?: "unknown"
            return "Jadx finished with $errorCount error(s). This may indicate decompilation issues."
        }
        
        return "No specific error details found in jadx output."
    }
    
    /**
     * Build APK from jadx-exported Gradle project
     * Executes gradlew assembleDebug and locates the output APK
     * 
     * @param gradleProjectDir Directory containing the Gradle project (with build.gradle)
     * @param outputApk Optional target location for the APK. If null, uses the default build output location
     * @return Result containing the APK file location or error
     */
    fun buildApkFromGradle(
        gradleProjectDir: File,
        outputApk: File? = null
    ): GradleBuildResult {
        // Validate gradle project directory
        val projectValidation = DependencyChecker.validateDirectory(gradleProjectDir)
        if (projectValidation is ValidationResult.Error) {
            return GradleBuildResult.Error(projectValidation.message)
        }
        
        val gradlewFile = File(gradleProjectDir, if (System.getProperty("os.name").lowercase().contains("win")) "gradlew.bat" else "gradlew")
        val buildGradleFile = File(gradleProjectDir, "build.gradle")
        
        if (!buildGradleFile.exists()) {
            return GradleBuildResult.Error("build.gradle not found in: ${gradleProjectDir.absolutePath}")
        }
        
        // Ensure local.properties exists with Android SDK path
        val localProperties = File(gradleProjectDir, "local.properties")
        if (!localProperties.exists()) {
            val androidSdkPath = System.getenv("ANDROID_SDK_ROOT") 
                ?: System.getenv("ANDROID_HOME")
                ?: File(System.getProperty("user.home"), "Library/Android/sdk").absolutePath
            
            val sdkDir = File(androidSdkPath)
            if (sdkDir.exists() && sdkDir.isDirectory) {
                localProperties.writeText("sdk.dir=$androidSdkPath\n")
            } else {
                return GradleBuildResult.Error(
                    "Android SDK not found. Tried:\n" +
                    "  - ANDROID_SDK_ROOT: ${System.getenv("ANDROID_SDK_ROOT") ?: "not set"}\n" +
                    "  - ANDROID_HOME: ${System.getenv("ANDROID_HOME") ?: "not set"}\n" +
                    "  - Default: $androidSdkPath\n" +
                    "Please set ANDROID_SDK_ROOT environment variable or create local.properties with sdk.dir path."
                )
            }
        }
        
        // Make gradlew executable if it exists
        if (gradlewFile.exists() && !gradlewFile.canExecute()) {
            gradlewFile.setExecutable(true)
        }
        
        // If gradlew doesn't exist, try to copy from parent jadx export or generate it
        if (!gradlewFile.exists()) {
            // First, try to find gradlew in common locations (parent directories)
            var parentGradlew: File? = null
            var parentGradleDir: File? = null
            
            // Try parent directory
            val parent1 = File(gradleProjectDir.parentFile, "jadx_gradle_export/gradlew")
            if (parent1.exists()) {
                parentGradlew = parent1
                parentGradleDir = File(gradleProjectDir.parentFile, "jadx_gradle_export/gradle")
            } else {
                // Try going up two levels (tools/ReverseApkSmaliLLMTool -> tools -> root)
                val rootGradlew = File(gradleProjectDir.parentFile?.parentFile?.parentFile, "jadx_gradle_export/gradlew")
                if (rootGradlew.exists()) {
                    parentGradlew = rootGradlew
                    parentGradleDir = File(gradleProjectDir.parentFile?.parentFile?.parentFile, "jadx_gradle_export/gradle")
                }
            }
            
            if (parentGradlew != null && parentGradlew.exists() && parentGradleDir != null && parentGradleDir.exists()) {
                // Copy gradlew and gradle wrapper directory from parent
                try {
                    parentGradlew.copyTo(gradlewFile, overwrite = false)
                    gradlewFile.setExecutable(true)
                    
                    // Copy gradle wrapper directory
                    val targetGradleDir = File(gradleProjectDir, "gradle")
                    if (!targetGradleDir.exists()) {
                        parentGradleDir.copyRecursively(targetGradleDir, overwrite = false)
                    }
                } catch (e: Exception) {
                    // Continue to try generating if copy fails
                }
            }
            
            // If still doesn't exist, try to generate it
            if (!gradlewFile.exists()) {
                val wrapperDir = File(gradleProjectDir, "gradle/wrapper")
                val wrapperJar = File(wrapperDir, "gradle-wrapper.jar")
                val wrapperProps = File(wrapperDir, "gradle-wrapper.properties")
                
                if (!wrapperDir.exists() || !wrapperJar.exists() || !wrapperProps.exists()) {
                    // Try to generate gradle wrapper using system gradle
                    try {
                        val initProcess = ProcessBuilder("gradle", "wrapper")
                            .directory(gradleProjectDir)
                            .redirectErrorStream(true)
                            .start()
                        val initOutput = initProcess.inputStream.bufferedReader().readText()
                        val initExitCode = initProcess.waitFor()
                        
                        if (initExitCode != 0 || !gradlewFile.exists()) {
                            return GradleBuildResult.Error(
                                "Gradle wrapper not found and cannot be generated.\n" +
                                "Project directory: ${gradleProjectDir.absolutePath}\n" +
                                "Missing files: gradlew, gradle/wrapper/gradle-wrapper.jar, gradle/wrapper/gradle-wrapper.properties\n" +
                                "Tried copying from parent directory and generating with system gradle.\n" +
                                "Please ensure jadx export includes gradle wrapper files, or install gradle to generate it.\n" +
                                "Wrapper generation attempt output:\n$initOutput"
                            )
                        }
                    } catch (e: Exception) {
                        return GradleBuildResult.Error(
                            "Gradle wrapper (gradlew) not found in project.\n" +
                            "Project directory: ${gradleProjectDir.absolutePath}\n" +
                            "jadx --export-gradle should include gradlew, but it's missing.\n" +
                            "Tried copying from parent directory and generating with system gradle.\n" +
                            "Cannot generate wrapper: ${e.message}\n" +
                            "Please ensure jadx export includes gradle wrapper files, or manually add them."
                        )
                    }
                }
            }
        }
        
        try {
            // Build APK using gradlew (should exist now)
            val gradleCommand = listOf(gradlewFile.absolutePath, "assembleDebug")
            
            val processBuilder = ProcessBuilder(gradleCommand)
            processBuilder.directory(gradleProjectDir)
            processBuilder.redirectErrorStream(true)
            
            val process = processBuilder.start()
            val output = process.inputStream.bufferedReader().readText()
            val exitCode = process.waitFor()
            
            if (exitCode != 0) {
                return GradleBuildResult.Error(
                    "Gradle build failed (exit code: $exitCode)\n" +
                    "Project directory: ${gradleProjectDir.absolutePath}\n" +
                    "Full output:\n$output"
                )
            }
            
            // Find the built APK (usually in app/build/outputs/apk/debug/app-debug.apk)
            val debugApk = File(gradleProjectDir, "app/build/outputs/apk/debug/app-debug.apk")
            val releaseApk = File(gradleProjectDir, "app/build/outputs/apk/release/app-release.apk")
            
            val builtApk = when {
                debugApk.exists() -> debugApk
                releaseApk.exists() -> releaseApk
                else -> {
                    // Try to find any APK in outputs
                    val outputsDir = File(gradleProjectDir, "app/build/outputs/apk")
                    if (outputsDir.exists()) {
                        outputsDir.walkTopDown()
                            .filter { it.isFile && it.name.endsWith(".apk") }
                            .firstOrNull()
                    } else {
                        null
                    }
                }
            }
            
            if (builtApk == null || !builtApk.exists()) {
                return GradleBuildResult.Error(
                    "APK not found after build. Expected locations:\n" +
                    "  - ${debugApk.absolutePath}\n" +
                    "  - ${releaseApk.absolutePath}\n" +
                    "Build output:\n$output"
                )
            }
            
            // Copy to output location if specified
            val finalApk = if (outputApk != null && outputApk.absolutePath != builtApk.absolutePath) {
                val outputDirValidation = DependencyChecker.validateDirectory(outputApk.parentFile, createIfNotExists = true)
                if (outputDirValidation is ValidationResult.Error) {
                    return GradleBuildResult.Error("Cannot create output directory: ${outputDirValidation.message}")
                }
                builtApk.copyTo(outputApk, overwrite = true)
                outputApk
            } else {
                builtApk
            }
            
            return GradleBuildResult.Success(
                apkFile = finalApk,
                buildOutput = output
            )
            
        } catch (e: Exception) {
            return GradleBuildResult.Error(
                "Failed to build Gradle project: ${e.message}\n" +
                "Project directory: ${gradleProjectDir.absolutePath}\n" +
                "Stack trace: ${e.stackTrace.take(5).joinToString("\n")}"
            )
        }
    }
}

/**
 * Result of jadx operation
 */
sealed class JadxResult {
    data class Success(
        val outputDir: File,
        val javaDirectory: File?,
        val gradleProject: Boolean,
        val output: String
    ) : JadxResult()
    
    data class Error(val message: String) : JadxResult()
}

/**
 * Result of Gradle build operation
 */
sealed class GradleBuildResult {
    data class Success(
        val apkFile: File,
        val buildOutput: String
    ) : GradleBuildResult()
    
    data class Error(val message: String) : GradleBuildResult()
}
