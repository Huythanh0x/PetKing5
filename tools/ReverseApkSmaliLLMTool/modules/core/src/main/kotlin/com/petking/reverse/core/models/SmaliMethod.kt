package com.petking.reverse.core.models

/**
 * Represents a method in a smali file
 */
data class SmaliMethod(
    val className: String,
    val methodName: String,
    val descriptor: String,
    val accessFlags: Set<String>,
    val locals: Int,
    val lines: List<String>
) {
    val fullName: String get() = "$className->$methodName$descriptor"
}

