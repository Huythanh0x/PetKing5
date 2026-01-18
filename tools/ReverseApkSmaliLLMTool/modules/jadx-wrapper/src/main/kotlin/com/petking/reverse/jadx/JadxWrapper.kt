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
     */
    fun decompileToGradle(apkFile: File, outputDir: File, exportGradle: Boolean = true): JadxResult {
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
                return JadxResult.Error("jadx failed with exit code $exitCode:\n$output")
            }
        } catch (e: Exception) {
            return JadxResult.Error("Failed to execute jadx: ${e.message}")
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
