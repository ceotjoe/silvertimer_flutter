// Drift web worker entry point.
// Compiled to drift_worker.dart.js by the CI workflow:
//   dart compile js web/drift_worker.dart -o web/drift_worker.dart.js
//
// This worker runs SQLite (via WASM) in a background thread so that
// database operations don't block the main UI thread.
import 'package:drift/wasm.dart';

void main() {
  WasmDatabase.workerMainForOpen();
}
