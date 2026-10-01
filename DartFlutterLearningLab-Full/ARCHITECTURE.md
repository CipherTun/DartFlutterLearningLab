# Architecture

Flutter/Dart owns the main learning experience. Kotlin/Jetpack Compose/Material 3 owns Android-native host and integration surfaces. Kotlin bridges lifecycle, storage and runtime services. Go provides local tooling and future packaging/build orchestration. The runtime is an explicit dependency so missing engines cannot be silently simulated.
