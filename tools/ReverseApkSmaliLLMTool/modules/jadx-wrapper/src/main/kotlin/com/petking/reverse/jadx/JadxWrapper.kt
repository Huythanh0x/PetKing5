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
