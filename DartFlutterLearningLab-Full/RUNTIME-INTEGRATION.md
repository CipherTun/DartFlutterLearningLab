# Runtime Integration Contract

Dart execution must be: source -> real Dart compiler/kernel pipeline -> real Dart VM -> real stdout/stderr/result.

Flutter execution must be: source -> real Flutter engine -> real rendered widget tree, with load/restart/hot-reload and VM-service/debug plumbing.

Primary ABI: `armeabi-v7a`.

Do not add fake output, fake engine libraries or placeholder `.so` files. The runtime artifacts must be pinned to the selected Flutter/Dart release.

Compose remains the Android-native host/integration surface. Flutter remains the primary learning application. Go remains the local tooling/build/project layer.
