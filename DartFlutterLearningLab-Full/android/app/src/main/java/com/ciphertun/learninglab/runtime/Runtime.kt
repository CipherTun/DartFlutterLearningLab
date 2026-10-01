package com.ciphertun.learninglab.runtime

sealed interface RuntimeResult { data class Success(val output: String): RuntimeResult; data class Failure(val message: String): RuntimeResult; data object RuntimeUnavailable: RuntimeResult }
interface DartRuntime { fun status(): String; fun execute(source: String): RuntimeResult }
interface FlutterRuntime { fun status(): String; fun load(source: String): RuntimeResult; fun hotReload(source: String): RuntimeResult }
class RuntimeRegistry { val dart: DartRuntime = EmbeddedDartRuntime(); val flutter: FlutterRuntime = EmbeddedFlutterRuntime() }
private class EmbeddedDartRuntime: DartRuntime { override fun status() = "Dart bridge ready; pinned ARM32 runtime artifact not bundled yet."; override fun execute(source: String) = RuntimeResult.RuntimeUnavailable }
private class EmbeddedFlutterRuntime: FlutterRuntime { override fun status() = "FlutterEngine bridge ready; pinned ARM32 engine artifact not bundled yet."; override fun load(source: String) = RuntimeResult.RuntimeUnavailable; override fun hotReload(source: String) = RuntimeResult.RuntimeUnavailable }
