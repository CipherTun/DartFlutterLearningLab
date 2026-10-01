# Dart + Flutter Learning Lab — Full Source

Real multi-runtime Android learning application architecture.

- Flutter + Dart: primary learning workspace, lessons, editor, exercises and Flutter preview.
- Jetpack Compose + Material 3: native Android host/integration surfaces.
- Kotlin: lifecycle, storage and runtime bridges.
- Go: local project/build/tooling service.
- ARM32 (`armeabi-v7a`) is a first-class runtime target.
- Offline-first project storage.

The runtime bridge is intentionally explicit: it never fabricates Dart output or Flutter rendering. The pinned ARM32 Dart VM/compiler and Flutter engine are added as the next runtime stage.
