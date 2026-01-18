package com.petking.reverse

import com.petking.reverse.cli.main as cliMain

/**
 * ReverseApkSmaliLLMTool - GUI Entry Point
 * 
 * For now, this is a stub that wraps the CLI.
 * Future: Full GUI implementation
 */
fun main(args: Array<String>) {
    // For now, just delegate to CLI
    // Future: Launch GUI window
    if (args.isEmpty()) {
        println("ReverseApkSmaliLLMTool GUI (stub)")
        println("GUI not yet implemented, using CLI mode...")
        println("Use: java -jar app.jar <command> <args>")
    } else {
        cliMain(args)
    }
}
