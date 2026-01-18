package com.petking.reverse.core.models

/**
 * Represents differences between original and compiled smali
 */
data class SmaliDiff(
    val className: String,
    val methodName: String? = null, // null = class-level diff
    val diffType: DiffType,
    val originalLines: List<String>,
    val compiledLines: List<String>,
    val lineNumbers: Pair<IntRange?, IntRange?> // (original range, compiled range)
)

enum class DiffType {
    METHOD_ADDED,           // Method exists in compiled but not original
    METHOD_REMOVED,         // Method exists in original but not compiled
    METHOD_MODIFIED,        // Method exists in both but differs
    LINE_ADDED,             // Line added in compiled
    LINE_REMOVED,           // Line removed in compiled
    LINE_MODIFIED,          // Line modified
    LOGICAL_MISMATCH,       // Same logic, different bytecode patterns
    COSMETIC_DIFFERENCE     // Comments, spacing, etc.
}

/**
 * Result of comparing two smali files
 */
data class DiffAnalysisResult(
    val className: String,
    val methodDiffs: List<SmaliDiff>,
    val totalDifferences: Int,
    val logicalMismatches: Int,
    val cosmeticDifferences: Int
)

