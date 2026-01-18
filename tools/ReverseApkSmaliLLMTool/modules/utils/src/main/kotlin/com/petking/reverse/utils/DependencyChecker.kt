package com.petking.reverse.utils

import java.io.File

/**
 * Utility module for checking dependencies and validating inputs
 * Centralized validation to quick-fail before running any command
 */
object DependencyChecker {
    
    /**
     * Check if apktool command is available in PATH
     */
    fun isApktoolAvailable(): Boolean {
        return try {
            val process = ProcessBuilder("apktool", "--version").start()
            val exitCode = process.waitFor()
            exitCode == 0
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Check if jadx command is available in PATH
     */
    fun isJadxAvailable(): Boolean {
        return try {
            val process = ProcessBuilder("jadx", "--version").start()
            val exitCode = process.waitFor()
            exitCode == 0
        } catch (e: Exception) {
            false
        }
    }
    
    /**
     * Validate that a file exists and is readable
     */
    fun validateFile(file: File, expectedExtension: String? = null): ValidationResult {
        return when {
            !file.exists() -> ValidationResult.Error("File does not exist: ${file.absolutePath}")
            !file.canRead() -> ValidationResult.Error("File is not readable: ${file.absolutePath}")
            expectedExtension != null && !file.name.endsWith(expectedExtension) -> 
                ValidationResult.Error("File does not have expected extension .$expectedExtension: ${file.absolutePath}")
            else -> ValidationResult.Success
        }
    }
    
    /**
     * Validate that a directory exists and is writable
     */
    fun validateDirectory(dir: File, createIfNotExists: Boolean = false): ValidationResult {
        return when {
            dir.exists() && !dir.isDirectory -> 
                ValidationResult.Error("Path exists but is not a directory: ${dir.absolutePath}")
            !dir.exists() && !createIfNotExists -> 
                ValidationResult.Error("Directory does not exist: ${dir.absolutePath}")
            !dir.exists() && createIfNotExists -> {
                dir.mkdirs()
                if (dir.exists()) ValidationResult.Success 
                else ValidationResult.Error("Failed to create directory: ${dir.absolutePath}")
            }
            dir.exists() && !dir.canWrite() -> 
                ValidationResult.Error("Directory is not writable: ${dir.absolutePath}")
            else -> ValidationResult.Success
        }
    }
    
    /**
     * Check all dependencies required for the tool
     * Returns list of missing dependencies
     */
    fun checkAllDependencies(): List<String> {
        val missing = mutableListOf<String>()
        
        if (!isApktoolAvailable()) {
            missing.add("apktool")
        }
        
        if (!isJadxAvailable()) {
            missing.add("jadx")
        }
        
        return missing
    }
    
    /**
     * Validate APK file exists and is readable
     */
    fun validateApkFile(apkFile: File): ValidationResult {
        return validateFile(apkFile, "apk")
    }
}

/**
 * Result of validation operation
 */
sealed class ValidationResult {
    object Success : ValidationResult()
    data class Error(val message: String) : ValidationResult()
}

