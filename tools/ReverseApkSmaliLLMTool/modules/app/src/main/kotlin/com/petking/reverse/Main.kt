package com.petking.reverse

import com.petking.reverse.cli.main as cliMain

/**
 * ReverseApkSmaliLLMTool
 * 
 * A tool to reverse engineer APK files by comparing original smali
 * with compiled smali from Java, using LLM to suggest fixes for mismatches.
 */
fun main(args: Array<String>) {
    // Use CLI if arguments provided, otherwise start GUI (when implemented)
    if (args.isNotEmpty()) {
        cliMain(args)
    } else {
        println("ReverseApkSmaliLLMTool")
        println("Use CLI mode: java -jar app.jar <command> <args>")
        println("Commands: disassemble, compare, diff")
        println("\nFor GUI mode: java -jar app.jar (not yet implemented)")
    }
}

