package com.ciphertun.learninglab.project

data class LabProject(val id: String, val name: String, val root: String, val language: Language, val files: List<LabFile>)
enum class Language { DART, FLUTTER, MIXED }
data class LabFile(val path: String, val content: String, val modifiedAt: Long)
