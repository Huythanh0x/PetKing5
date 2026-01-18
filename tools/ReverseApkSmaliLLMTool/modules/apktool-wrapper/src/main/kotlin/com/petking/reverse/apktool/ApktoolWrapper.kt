package com.petking.reverse.apktool

import com.petking.reverse.utils.DependencyChecker
import com.petking.reverse.utils.ValidationResult
import java.io.File

/**
 * Wrapper for apktool operations
 * Uses DependencyChecker from utils module for validation
 */
class ApktoolWrapper {
    
    /**
     * Disassemble APK to smali using apktool
     * Note: Dependencies should be checked via DependencyChecker before calling this
     */
    fun disassemble(apkFile: File, outputDir: File, force: Boolean = true): ApktoolResult {
        // Validate/create output directory
        val dirValidation = DependencyChecker.validateDirectory(outputDir, createIfNotExists = true)
        if (dirValidation is ValidationResult.Error) {
            return ApktoolResult.Error(dirValidation.message)
        }
        
        // Execute apktool
        try {
            val command = mutableListOf("apktool", "d", apkFile.absolutePath, "-o", outputDir.absolutePath)
            if (force) {
                command.add("-f")
            }
            
            val processBuilder = ProcessBuilder(command)
            processBuilder.redirectErrorStream(true)
            
            val process = processBuilder.start()
            val output = process.inputStream.bufferedReader().readText()
            val exitCode = process.waitFor()
            
            if (exitCode == 0) {
                val smaliDir = File(outputDir, "smali")
                return ApktoolResult.Success(
                    outputDir = outputDir,
                    smaliDirectory = if (smaliDir.exists()) smaliDir else null,
                    output = output
                )
            } else {
                return ApktoolResult.Error("apktool failed with exit code $exitCode:\n$output")
            }
        } catch (e: Exception) {
            return ApktoolResult.Error("Failed to execute apktool: ${e.message}")
        }
    }
    
    /**
     * Reassemble smali back to APK
     * Note: Dependencies should be checked via DependencyChecker before calling this
     */
    fun reassemble(smaliDir: File, outputApk: File, force: Boolean = true): ApktoolResult {
        val dirValidation = DependencyChecker.validateDirectory(smaliDir)
        if (dirValidation is ValidationResult.Error) {
            return ApktoolResult.Error(dirValidation.message)
        }
        
        val outputDirValidation = DependencyChecker.validateDirectory(outputApk.parentFile, createIfNotExists = true)
        if (outputDirValidation is ValidationResult.Error) {
            return ApktoolResult.Error(outputDirValidation.message)
        }
        
        try {
            val command = mutableListOf("apktool", "b", smaliDir.absolutePath, "-o", outputApk.absolutePath)
            if (force) {
                command.add("-f")
            }
            
            val processBuilder = ProcessBuilder(command)
            processBuilder.redirectErrorStream(true)
            
            val process = processBuilder.start()
            val output = process.inputStream.bufferedReader().readText()
            val exitCode = process.waitFor()
            
            if (exitCode == 0 && outputApk.exists()) {
                return ApktoolResult.Success(
                    outputDir = outputApk.parentFile,
                    smaliDirectory = null,
                    output = output
                )
            } else {
                return ApktoolResult.Error("apktool build failed with exit code $exitCode:\n$output")
            }
        } catch (e: Exception) {
            return ApktoolResult.Error("Failed to execute apktool: ${e.message}")
        }
    }
}

/**
 * Result of apktool operation
 */
sealed class ApktoolResult {
    data class Success(
        val outputDir: File,
        val smaliDirectory: File?,
        val output: String
    ) : ApktoolResult()
    
    data class Error(val message: String) : ApktoolResult()
}
