package com.petking.reverse.cli

import com.petking.reverse.core.DiffAnalyzer
import com.petking.reverse.core.SmaliParser
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
        "compare" -> handleCompare(args)
        "diff" -> handleDiff(args)
        else -> printUsage()
    }
}

fun printUsage() {
    println("ReverseApkSmaliLLMTool CLI")
    println("Usage:")
    println("  disassemble <apk_file> <output_dir>     - Disassemble APK to smali using apktool")
    println("  compare <smali1> <smali2>               - Compare two smali files")
    println("  diff <original_apk> <compiled_apk>      - Disassemble both APKs and compare")
}

fun handleDisassemble(args: Array<String>) {
    if (args.size < 3) {
        println("Error: disassemble requires <apk_file> <output_dir>")
        return
    }
    
    val apkFile = File(args[1])
    val outputDir = File(args[2])
    
    if (!apkFile.exists()) {
        println("Error: APK file not found: ${apkFile.absolutePath}")
        return
    }
    
    println("Disassembling ${apkFile.name} to ${outputDir.absolutePath}...")
    
    val processBuilder = ProcessBuilder(
        "apktool", "d", apkFile.absolutePath, "-o", outputDir.absolutePath, "-f"
    )
    processBuilder.redirectErrorStream(true)
    
    val process = processBuilder.start()
    val output = process.inputStream.bufferedReader().readText()
    process.waitFor()
    
    if (process.exitValue() == 0) {
        println("✅ Disassembly complete!")
        println("Smali files are in: ${outputDir.absolutePath}/smali")
    } else {
        println("❌ Disassembly failed:")
        println(output)
    }
}

fun handleCompare(args: Array<String>) {
    if (args.size < 3) {
        println("Error: compare requires <smali1> <smali2>")
        return
    }
    
    val smali1 = File(args[1])
    val smali2 = File(args[2])
    
    if (!smali1.exists() || !smali2.exists()) {
        println("Error: One or both smali files not found")
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
    
    if (!originalApk.exists() || !compiledApk.exists()) {
        println("Error: One or both APK files not found")
        return
    }
    
    val tempDir = File(System.getProperty("java.io.tmpdir"), "smali_diff_${System.currentTimeMillis()}")
    tempDir.mkdirs()
    
    val originalSmaliDir = File(tempDir, "original")
    val compiledSmaliDir = File(tempDir, "compiled")
    
    try {
        println("Step 1: Disassembling original APK...")
        disassembleApk(originalApk, originalSmaliDir)
        
        println("\nStep 2: Disassembling compiled APK...")
        disassembleApk(compiledApk, compiledSmaliDir)
        
        println("\nStep 3: Finding matching smali files...")
        val smaliFiles = findMatchingSmaliFiles(originalSmaliDir, compiledSmaliDir)
        
        println("Found ${smaliFiles.size} matching smali files to compare")
        
        var totalDiffs = 0
        smaliFiles.take(5).forEach { (original, compiled) ->
            println("\nComparing: ${original.name}")
            val analyzer = DiffAnalyzer()
            val result = analyzer.analyzeDiff(original, compiled)
            totalDiffs += result.totalDifferences
            println("  Differences: ${result.totalDifferences} (logical: ${result.logicalMismatches}, cosmetic: ${result.cosmeticDifferences})")
        }
        
        println("\n=== Summary ===")
        println("Total differences found: $totalDiffs")
        
    } finally {
        // Cleanup temp directory
        tempDir.deleteRecursively()
    }
}

fun disassembleApk(apkFile: File, outputDir: File) {
    val processBuilder = ProcessBuilder(
        "apktool", "d", apkFile.absolutePath, "-o", outputDir.absolutePath, "-f"
    )
    processBuilder.redirectErrorStream(true)
    
    val process = processBuilder.start()
    process.waitFor()
    
    if (process.exitValue() != 0) {
        throw RuntimeException("Failed to disassemble ${apkFile.name}")
    }
}

fun findMatchingSmaliFiles(dir1: File, dir2: File): List<Pair<File, File>> {
    val smali1Dir = File(dir1, "smali")
    val smali2Dir = File(dir2, "smali")
    
    if (!smali1Dir.exists() || !smali2Dir.exists()) {
        return emptyList()
    }
    
    val matches = mutableListOf<Pair<File, File>>()
    
    fun findFiles(dir: File, relativePath: String = ""): List<File> {
        val files = mutableListOf<File>()
        dir.listFiles()?.forEach { file ->
            val path = if (relativePath.isEmpty()) file.name else "$relativePath/${file.name}"
            if (file.isDirectory) {
                files.addAll(findFiles(file, path))
            } else if (file.name.endsWith(".smali")) {
                files.add(file)
            }
        }
        return files
    }
    
    val files1 = findFiles(smali1Dir)
    
    files1.forEach { file1 ->
        val relativePath = file1.relativeTo(smali1Dir).path
        val file2 = File(smali2Dir, relativePath)
        if (file2.exists()) {
            matches.add(file1 to file2)
        }
    }
    
    return matches
}

