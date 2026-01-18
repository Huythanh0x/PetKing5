package com.petking.reverse.core

import com.petking.reverse.core.models.SmaliClass
import com.petking.reverse.core.models.SmaliMethod
import java.io.File

/**
 * Parses smali files and extracts method/class information
 */
class SmaliParser {
    
    fun parseClass(file: File): SmaliClass {
        val lines = file.readLines()
        val className = extractClassName(lines) ?: ""
        val sourceFile = extractSourceFile(lines)
        val superClass = extractSuperClass(lines)
        val methods = extractMethods(lines, className)
        val fields = extractFields(lines)
        
        return SmaliClass(
            className = className,
            sourceFile = sourceFile,
            superClass = superClass,
            methods = methods,
            fields = fields,
            allLines = lines
        )
    }
    
    private fun extractClassName(lines: List<String>): String? {
        return lines.firstOrNull { it.startsWith(".class ") }
            ?.substringAfter(".class ")
            ?.substringBefore(" ")
            ?.substringAfter("L")
            ?.substringBefore(";")
            ?.replace("/", ".")
    }
    
    private fun extractSourceFile(lines: List<String>): String? {
        return lines.firstOrNull { it.startsWith(".source ") }
            ?.substringAfter(".source ")
            ?.removeSurrounding("\"")
    }
    
    private fun extractSuperClass(lines: List<String>): String? {
        return lines.firstOrNull { it.startsWith(".super ") }
            ?.substringAfter(".super ")
            ?.substringBefore(" ")
            ?.substringAfter("L")
            ?.substringBefore(";")
            ?.replace("/", ".")
    }
    
    private fun extractMethods(lines: List<String>, className: String): List<SmaliMethod> {
        val methods = mutableListOf<SmaliMethod>()
        var i = 0
        
        while (i < lines.size) {
            if (lines[i].matches(Regex("\\.method .+"))) {
                val methodStart = i
                val methodLine = lines[i]
                
                // Extract method name and descriptor
                val methodParts = methodLine.split(" ", limit = 3)
                val methodName = methodParts.getOrNull(2)
                    ?.substringBefore("(") ?: ""
                val descriptor = methodParts.getOrNull(2)
                    ?.substringAfter("(")?.let { "($it" } ?: ""
                
                // Extract access flags
                val accessFlags = methodLine
                    .substringAfter(".method ")
                    .substringBefore(" ")
                    .split(" ")
                    .filter { it.isNotEmpty() }
                    .toSet()
                
                // Find locals declaration
                var locals = -1
                var localsLine = methodStart + 1
                while (localsLine < lines.size && !lines[localsLine].startsWith(".end method")) {
                    if (lines[localsLine].startsWith(".locals ")) {
                        locals = lines[localsLine].substringAfter(".locals ").trim().toIntOrNull() ?: -1
                        break
                    }
                    localsLine++
                }
                
                // Find method end
                var methodEnd = methodStart
                while (methodEnd < lines.size && !lines[methodEnd].startsWith(".end method")) {
                    methodEnd++
                }
                methodEnd++ // Include .end method line
                
                val methodLines = lines.subList(methodStart, methodEnd)
                
                methods.add(
                    SmaliMethod(
                        className = className,
                        methodName = methodName,
                        descriptor = descriptor,
                        accessFlags = accessFlags,
                        locals = locals,
                        lines = methodLines
                    )
                )
                
                i = methodEnd
            } else {
                i++
            }
        }
        
        return methods
    }
    
    private fun extractFields(lines: List<String>): List<String> {
        return lines.filter { it.startsWith(".field ") }
    }
}
