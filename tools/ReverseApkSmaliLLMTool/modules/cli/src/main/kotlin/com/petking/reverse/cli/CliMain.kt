package com.petking.reverse.cli

import com.petking.reverse.apktool.ApktoolResult
import com.petking.reverse.apktool.ApktoolWrapper
import com.petking.reverse.core.DiffAnalyzer
import com.petking.reverse.jadx.JadxResult
import com.petking.reverse.jadx.JadxWrapper
import com.petking.reverse.utils.DependencyChecker
import com.petking.reverse.utils.ValidationResult
import java.io.File

/**
 * CLI interface for testing diff comparison
 */
fun main(args: Array<String>) {
    if (args.isEmpty()) {
        printUsage()
        return
    }
    
    when (args[0]) {
        "disassemble" -> handleDisassemble(args)
        "reassemble" -> handleReassemble(args)
        "decompile" -> handleDecompile(args)
        "compare" -> handleCompare(args)
        "diff" -> handleDiff(args)
        "check-deps" -> handleCheckDeps()
        else -> printUsage()
    }
}

fun printUsage() {
    println("ReverseApkSmaliLLMTool CLI")
    println("Usage:")
    println("  check-deps                            - Check if apktool and jadx are available")
    println("  decompile <apk_file> <output_dir>     - Decompile APK to Java/Gradle using jadx")
    println("  decompile <apk_file> <output_dir> --overwrite - Decompile and overwrite existing output")
    println("  disassemble <apk_file> <output_dir>   - Disassemble APK to smali using apktool")
    println("  compare <smali1> <smali2>             - Compare two smali files")
    println("  diff <original_apk> <compiled_apk>    - Disassemble both APKs and compare")
}

fun handleCheckDeps() {
    println("Checking dependencies...")
    val missing = DependencyChecker.checkAllDependencies()
    
    if (missing.isEmpty()) {
        println("✅ All dependencies are available:")
        println("  - apktool: ✅")
        println("  - jadx: ✅")
    } else {
        println("❌ Missing dependencies:")
        missing.forEach { dep ->
            println("  - $dep: ❌")
        }
        println("\nPlease install missing dependencies and ensure they're in PATH")
    }
}

fun handleDecompile(args: Array<String>) {
    if (args.size < 3) {
        println("Error: decompile requires <apk_file> <output_dir>")
        println("Optional: add '--overwrite' flag to overwrite existing output directory")
        return
    }
    
    val apkFile = File(args[1])
    val outputDir = File(args[2])
    val overwriteExisting = args.contains("--overwrite")
    
    // Quick fail: check dependencies first
    if (!DependencyChecker.isJadxAvailable()) {
        println("❌ Error: jadx not found. Run 'check-deps' to verify dependencies.")
        return
    }
    
    // Quick fail: validate APK file
    when (val validation = DependencyChecker.validateApkFile(apkFile)) {
        is ValidationResult.Error -> {
            println("❌ Error: ${validation.message}")
            return
        }
        is ValidationResult.Success -> {
            // Continue
        }
    }
    
    val wrapper = JadxWrapper()
    if (overwriteExisting) {
        println("Decompiling ${apkFile.name} to ${outputDir.absolutePath} (overwriting existing)...")
    } else {
        println("Decompiling ${apkFile.name} to ${outputDir.absolutePath}...")
    }
    
    when (val result = wrapper.decompileToGradle(apkFile, outputDir, overwriteExisting = overwriteExisting)) {
        is JadxResult.Success -> {
            println("✅ Decompilation complete!")
            println("Output directory: ${result.outputDir.absolutePath}")
            result.javaDirectory?.let {
                println("Java files are in: ${it.absolutePath}")
            }
            println("Gradle project: ${if (result.gradleProject) "Yes" else "No"}")
        }
        is JadxResult.Error -> {
            println("❌ Decompilation failed:\n${result.message}")
        }
    }
}

fun handleDisassemble(args: Array<String>) {
    if (args.size < 3) {
        println("Error: disassemble requires <apk_file> <output_dir>")
        return
    }
    
    val apkFile = File(args[1])
    val outputDir = File(args[2])
    
    // Quick fail: check dependencies first
    if (!DependencyChecker.isApktoolAvailable()) {
        println("❌ Error: apktool not found. Run 'check-deps' to verify dependencies.")
        return
    }
    
    // Quick fail: validate APK file
    when (val validation = DependencyChecker.validateApkFile(apkFile)) {
        is ValidationResult.Error -> {
            println("❌ Error: ${validation.message}")
            return
        }
        is ValidationResult.Success -> {
            // Continue
        }
    }
    
    val wrapper = ApktoolWrapper()
    println("Disassembling ${apkFile.name} to ${outputDir.absolutePath}...")
    
    when (val result = wrapper.disassemble(apkFile, outputDir)) {
        is ApktoolResult.Success -> {
            println("✅ Disassembly complete!")
            println("Output directory: ${result.outputDir.absolutePath}")
            result.smaliDirectory?.let {
                println("Smali files are in: ${it.absolutePath}")
            }
        }
        is ApktoolResult.Error -> {
            println("❌ Disassembly failed: ${result.message}")
        }
    }
}

fun handleReassemble(args: Array<String>) {
    if (args.size < 3) {
        println("Error: reassemble requires <smali_dir> <output_apk>")
        return
    }
    
    val smaliDir = File(args[1])
    val outputApk = File(args[2])
    
    // Quick fail: check dependencies first
    if (!DependencyChecker.isApktoolAvailable()) {
        println("❌ Error: apktool not found. Run 'check-deps' to verify dependencies.")
        return
    }
    
    // Quick fail: validate smali directory
    when (val validation = DependencyChecker.validateDirectory(smaliDir)) {
        is ValidationResult.Error -> {
            println("❌ Error: ${validation.message}")
            return
        }
        is ValidationResult.Success -> {
            // Continue
        }
    }
    
    val wrapper = ApktoolWrapper()
    println("Reassembling ${smaliDir.name} to ${outputApk.name}...")
    
    when (val result = wrapper.reassemble(smaliDir, outputApk)) {
        is ApktoolResult.Success -> {
            println("✅ Reassembly complete!")
            println("Output APK: ${outputApk.absolutePath}")
            println("APK size: ${outputApk.length() / 1024} KB")
        }
        is ApktoolResult.Error -> {
            println("❌ Reassembly failed: ${result.message}")
        }
    }
}

fun handleCompare(args: Array<String>) {
    if (args.size < 3) {
        println("Error: compare requires <smali1> <smali2>")
        return
    }
    
    val smali1 = File(args[1])
    val smali2 = File(args[2])
    
    // Quick fail: validate files
    val validation1 = DependencyChecker.validateFile(smali1)
    val validation2 = DependencyChecker.validateFile(smali2)
    
    if (validation1 is ValidationResult.Error) {
        println("Error: ${validation1.message}")
        return
    }
    
    if (validation2 is ValidationResult.Error) {
        println("Error: ${validation2.message}")
        return
    }
    
    println("Comparing ${smali1.name} vs ${smali2.name}...")
    
    val analyzer = DiffAnalyzer()
    val result = analyzer.analyzeDiff(smali1, smali2)
    
    println("\n=== Comparison Result ===")
    println("Class: ${result.className}")
    println("Total differences: ${result.totalDifferences}")
    println("Logical mismatches: ${result.logicalMismatches}")
    println("Cosmetic differences: ${result.cosmeticDifferences}")
    println("\nMethod differences: ${result.methodDiffs.size}")
    
    result.methodDiffs.take(10).forEach { diff ->
        println("  - ${diff.methodName ?: "class-level"}: ${diff.diffType}")
    }
    
    if (result.methodDiffs.size > 10) {
        println("  ... and ${result.methodDiffs.size - 10} more")
    }
}

fun handleDiff(args: Array<String>) {
    if (args.size < 3) {
        println("Error: diff requires <original_apk> <compiled_apk>")
        return
    }
    
    val originalApk = File(args[1])
    val compiledApk = File(args[2])
    
    // Quick fail: check dependencies
    if (!DependencyChecker.isApktoolAvailable()) {
        println("❌ Error: apktool not found. Run 'check-deps' to verify dependencies.")
        return
    }
    
    // Quick fail: validate APK files
    val validation1 = DependencyChecker.validateApkFile(originalApk)
    val validation2 = DependencyChecker.validateApkFile(compiledApk)
    
    if (validation1 is ValidationResult.Error) {
        println("Error: ${validation1.message}")
        return
    }
    
    if (validation2 is ValidationResult.Error) {
        println("Error: ${validation2.message}")
        return
    }
    
    val wrapper = ApktoolWrapper()
    
    val tempDir = File(System.getProperty("java.io.tmpdir"), "smali_diff_${System.currentTimeMillis()}")
    tempDir.mkdirs()
    
    val originalSmaliDir = File(tempDir, "original")
    val compiledSmaliDir = File(tempDir, "compiled")
    
    try {
        println("Step 1: Disassembling original APK...")
        when (val result1 = wrapper.disassemble(originalApk, originalSmaliDir)) {
            is ApktoolResult.Error -> {
                println("❌ Failed: ${result1.message}")
                return
            }
            is ApktoolResult.Success -> println("✅ Original APK disassembled")
        }
        
        println("\nStep 2: Disassembling compiled APK...")
        when (val result2 = wrapper.disassemble(compiledApk, compiledSmaliDir)) {
            is ApktoolResult.Error -> {
                println("❌ Failed: ${result2.message}")
                return
            }
            is ApktoolResult.Success -> println("✅ Compiled APK disassembled")
        }
        
        println("\nStep 3: Finding matching smali files...")
        val smaliFiles = findMatchingSmaliFiles(
            originalSmaliDir.resolve("smali"),
            compiledSmaliDir.resolve("smali")
        )
        
        println("Found ${smaliFiles.size} matching smali files to compare")
        
        var totalDiffs = 0
        var totalLogical = 0
        var totalCosmetic = 0
        
        smaliFiles.take(5).forEach { (original, compiled) ->
            println("\nComparing: ${original.name}")
            val analyzer = DiffAnalyzer()
            val result = analyzer.analyzeDiff(original, compiled)
            totalDiffs += result.totalDifferences
            totalLogical += result.logicalMismatches
            totalCosmetic += result.cosmeticDifferences
            println("  Differences: ${result.totalDifferences} (logical: ${result.logicalMismatches}, cosmetic: ${result.cosmeticDifferences})")
        }
        
        println("\n=== Summary ===")
        println("Files compared: ${smaliFiles.size}")
        println("Total differences found: $totalDiffs")
        println("  - Logical mismatches: $totalLogical")
        println("  - Cosmetic differences: $totalCosmetic")
        
    } finally {
        // Optional: uncomment to clean up temp directory
        // tempDir.deleteRecursively()
        println("\nTemp files kept at: ${tempDir.absolutePath}")
    }
}

fun findMatchingSmaliFiles(dir1: File, dir2: File): List<Pair<File, File>> {
    if (!dir1.exists() || !dir2.exists()) {
        return emptyList()
    }
    
    val matches = mutableListOf<Pair<File, File>>()
    
    fun findFiles(dir: File): List<File> {
        val files = mutableListOf<File>()
        dir.listFiles()?.forEach { file ->
            if (file.isDirectory) {
                files.addAll(findFiles(file))
            } else if (file.name.endsWith(".smali")) {
                files.add(file)
            }
        }
        return files
    }
    
    val files1 = findFiles(dir1)
    
    files1.forEach { file1 ->
        val relativePath = file1.relativeTo(dir1).path
        val file2 = File(dir2, relativePath)
        if (file2.exists()) {
            matches.add(file1 to file2)
        }
    }
    
    return matches
}
