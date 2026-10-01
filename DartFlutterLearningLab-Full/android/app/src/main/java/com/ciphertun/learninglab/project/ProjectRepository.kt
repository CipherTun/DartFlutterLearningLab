package com.ciphertun.learninglab.project

import android.content.Context
import java.io.File

class ProjectRepository(private val context: Context) {
    private val root get() = File(context.filesDir, "learning-lab/projects").apply { mkdirs() }
    fun projectDirectory(id: String) = File(root, id).apply { mkdirs() }
    fun writeFile(projectId: String, path: String, content: String) { val f = File(projectDirectory(projectId), path); f.parentFile?.mkdirs(); f.writeText(content) }
    fun readFile(projectId: String, path: String): String? { val f = File(projectDirectory(projectId), path); return if (f.exists()) f.readText() else null }
}
