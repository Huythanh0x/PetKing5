package com.petking.reverse.core.models

/**
 * Represents a complete smali class file
 */
data class SmaliClass(
    val className: String,
    val sourceFile: String?,
    val superClass: String?,
    val methods: List<SmaliMethod> = emptyList(),
    val fields: List<String> = emptyList(),
    val allLines: List<String> = emptyList()
)

