package com.petking.reverse.core

import com.petking.reverse.core.models.DiffAnalysisResult
import com.petking.reverse.core.models.DiffType
import com.petking.reverse.core.models.SmaliClass
import com.petking.reverse.core.models.SmaliDiff
import java.io.File

/**
 * Analyzes differences between original and compiled smali files
 * Identifies logical mismatches vs cosmetic differences
 */
class DiffAnalyzer {
    
    /**
     * Compare two smali files and return analysis result
     */
    fun analyzeDiff(originalFile: File, compiledFile: File): DiffAnalysisResult {
        val parser = SmaliParser()
        val original = parser.parseClass(originalFile)
        val compiled = parser.parseClass(compiledFile)
        
        return analyzeClassDiff(original, compiled)
    }
    
    /**
     * Compare two parsed smali classes
     */
    fun analyzeClassDiff(original: SmaliClass, compiled: SmaliClass): DiffAnalysisResult {
        val methodDiffs = mutableListOf<SmaliDiff>()
        
        val originalMethods = original.methods.associateBy { it.fullName }
        val compiledMethods = compiled.methods.associateBy { it.fullName }
        
        // Find methods in original but not in compiled
        originalMethods.forEach { (fullName, method) ->
            if (!compiledMethods.containsKey(fullName)) {
                methodDiffs.add(
                    SmaliDiff(
                        className = original.className,
                        methodName = method.methodName,
                        diffType = DiffType.METHOD_REMOVED,
                        originalLines = method.lines,
                        compiledLines = emptyList(),
                        lineNumbers = null to null
                    )
                )
            }
        }
        
        // Find methods in compiled but not in original
        compiledMethods.forEach { (fullName, method) ->
            if (!originalMethods.containsKey(fullName)) {
                methodDiffs.add(
                    SmaliDiff(
                        className = compiled.className,
                        methodName = method.methodName,
                        diffType = DiffType.METHOD_ADDED,
                        originalLines = emptyList(),
                        compiledLines = method.lines,
                        lineNumbers = null to null
                    )
                )
            }
        }
        
        // Compare methods that exist in both
        originalMethods.forEach { (fullName, originalMethod) ->
            val compiledMethod = compiledMethods[fullName]
            if (compiledMethod != null) {
                val methodDiff = compareMethods(originalMethod, compiledMethod)
                if (methodDiff != null) {
                    methodDiffs.add(methodDiff)
                }
            }
        }
        
        val logicalMismatches = methodDiffs.count { 
            it.diffType == DiffType.LOGICAL_MISMATCH 
        }
        val cosmeticDifferences = methodDiffs.count { 
            it.diffType == DiffType.COSMETIC_DIFFERENCE 
        }
        
        return DiffAnalysisResult(
            className = original.className,
            methodDiffs = methodDiffs,
            totalDifferences = methodDiffs.size,
            logicalMismatches = logicalMismatches,
            cosmeticDifferences = cosmeticDifferences
        )
    }
    
    /**
     * Compare two methods and return diff if they differ
     */
    private fun compareMethods(original: com.petking.reverse.core.models.SmaliMethod, 
                              compiled: com.petking.reverse.core.models.SmaliMethod): SmaliDiff? {
        // Normalize lines for comparison (remove comments, line numbers)
        val originalNormalized = normalizeMethodLines(original.lines)
        val compiledNormalized = normalizeMethodLines(compiled.lines)
        
        // Check if methods are identical
        if (originalNormalized == compiledNormalized) {
            return null
        }
        
        // Try to determine if it's a logical mismatch or cosmetic
        val diffType = determineDiffType(originalNormalized, compiledNormalized)
        
        return SmaliDiff(
            className = original.className,
            methodName = original.methodName,
            diffType = diffType,
            originalLines = original.lines,
            compiledLines = compiled.lines,
            lineNumbers = null to null
        )
    }
    
    /**
     * Normalize method lines for comparison (remove comments, line numbers, etc.)
     */
    private fun normalizeMethodLines(lines: List<String>): List<String> {
        return lines
            .filterNot { it.trim().startsWith("#") } // Remove comments
            .filterNot { it.matches(Regex("\\.line \\d+")) } // Remove .line directives
            .filterNot { it.matches(Regex("\\.prologue")) } // Remove .prologue
            .filterNot { it.matches(Regex("\\.local .+")) } // Remove .local
            .filter { it.trim().isNotEmpty() }
    }
    
    /**
     * Determine if the difference is logical or cosmetic
     */
    private fun determineDiffType(original: List<String>, compiled: List<String>): DiffType {
        // Simple heuristic: if instruction patterns are similar but registers differ,
        // it's likely a logical mismatch (same logic, different bytecode)
        
        val originalOps = extractOperations(original)
        val compiledOps = extractOperations(compiled)
        
        if (originalOps == compiledOps) {
            return DiffType.COSMETIC_DIFFERENCE
        }
        
        // Check for register reallocation patterns (common logical mismatch)
        if (hasRegisterReallocation(original, compiled)) {
            return DiffType.LOGICAL_MISMATCH
        }
        
        // Check for redundant load patterns
        if (hasRedundantLoadPattern(original, compiled)) {
            return DiffType.LOGICAL_MISMATCH
        }
        
        // Default to METHOD_MODIFIED if we can't determine
        return DiffType.METHOD_MODIFIED
    }
    
    /**
     * Extract operation names (ignore registers/arguments)
     */
    private fun extractOperations(lines: List<String>): List<String> {
        return lines
            .map { line ->
                when {
                    line.contains("invoke-") -> "invoke"
                    line.contains("iget-") -> "iget"
                    line.contains("iput-") -> "iput"
                    line.contains("const/") -> "const"
                    line.contains("move-") -> "move"
                    line.contains("if-") -> "if"
                    line.contains("goto") -> "goto"
                    line.contains("return") -> "return"
                    else -> line.trim().takeWhile { !it.isWhitespace() && it != ':' }
                }
            }
            .filter { it.isNotEmpty() }
    }
    
    /**
     * Check if differences are due to register reallocation
     */
    private fun hasRegisterReallocation(original: List<String>, compiled: List<String>): Boolean {
        // Simple check: same operations but different register names
        val originalOps = extractOperations(original)
        val compiledOps = extractOperations(compiled)
        
        if (originalOps == compiledOps && original.size == compiled.size) {
            // Same operations, likely register reallocation
            return true
        }
        
        return false
    }
    
    /**
     * Check for redundant field load patterns
     */
    private fun hasRedundantLoadPattern(original: List<String>, compiled: List<String>): Boolean {
        // Check if original has redundant iget patterns that compiled doesn't
        val originalIgets = original.count { it.contains("iget-") }
        val compiledIgets = compiled.count { it.contains("iget-") }
        
        // If original has significantly more iget operations, might be redundant loads
        return originalIgets > compiledIgets * 1.5
    }
}
