# 4. Drift/SQLite for history and devices, SharedPreferences for settings

- Status: accepted
- Date: 2026-10-24

## Context
The app stores a growing list of sessions and a small library of electrolysis devices (relational, queried, needs migrations), plus a
handful of user settings and the last-used calculator values.

## Decision
- History and devices: `drift` on SQLite (`drift_flutter`, `sqlite3_flutter_libs`) in one database, `schemaVersion` bumped with an
  `onUpgrade` migration per change. The v1 → v2 migration (adds `Devices`, seeds three generic devices, keeps existing session rows)
  is tested against a real v1 database file. Sessions keep a snapshot of the device used (name, current, auto polarity), so history stays
  correct after a device is edited or deleted.
- Web: Drift runs on the SQLite WASM build with a compiled worker (`web/drift_worker.dart` → `drift_worker.dart.js`, built in CI and
  gitignored; `sqlite3.wasm` is committed).
- Settings: `shared_preferences` behind `SettingsRepository`, keys in `AppConstants`, exposed as a freezed `AppSettings`.

## Consequences
- Real migrations and queries for data that outlives releases; every schema change needs a migration and a migration test.
- Two storage mechanisms to know about; the rule of thumb is "rows go in Drift, scalar preferences in SharedPreferences".
- The web build has an extra compile step (see the Release workflow).
