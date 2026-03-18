# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This App Does

SilverTimer is a colloidal silver electrolysis timer calculator. It uses Faraday's Law of Electrolysis to compute how long to run electrolysis given water volume, electrode current (mA), and a target PPM concentration. The timer screen shows a circular countdown with electrode cleaning reminders.

## Commands

```bash
# Run on a connected device/emulator
flutter run

# List available devices
flutter devices

# Run all tests
flutter test

# Run a single test file
flutter test test/core/silver_calculator_test.dart

# Lint
flutter analyze

# Regenerate code (freezed, riverpod_generator, drift, json_serializable)
dart run build_runner build --delete-conflicting-outputs

# Watch mode for code generation
dart run build_runner watch --delete-conflicting-outputs
```

## Architecture

The app follows a feature-first structure under `lib/features/`, with shared infrastructure in `lib/core/`.

**State management:** Riverpod with `@riverpod` / `@Riverpod(keepAlive:)` annotations. All controllers use `riverpod_generator` — run `build_runner` after modifying any annotated class.

**Navigation:** `go_router` with a `ShellRoute` wrapping the three main tabs (Calculator → Timer → History) inside `AppScaffold`. Settings is a full-screen push route at `/settings`. The `/timer` route has a redirect guard: it bounces to `/calculator` if no calculation result exists yet.

**Features:**

| Feature | Key files | Notes |
|---|---|---|
| Calculator | `calculator_controller.dart`, `silver_calculator.dart` | Reads inputs, calls `SilverCalculator.calculate()`, stores `lastResult` |
| Timer | `timer_controller.dart`, `timer_state.dart` | `keepAlive: true`; tracks `idle/paused/running/completed` states; wall-clock anchored (survives background) |
| History | `history_database.dart`, `history_repository.dart` | Drift/SQLite; auto-saves completed sessions |
| Settings | `settings_repository.dart`, `app_settings.freezed.dart` | Persisted via `SharedPreferences`; keys in `AppConstants` |
| Notifications | `notification_service.dart` | `flutter_local_notifications`; scheduled OS notifications for completion + electrode cleaning alarms |

**Data models** use `freezed` + `json_serializable`. Always regenerate after editing `.dart` files that have `part '*.freezed.dart'` or `part '*.g.dart'`.

**Core domain logic** lives in `lib/core/utils/silver_calculator.dart` — a pure, stateless class with no Flutter dependencies, making it easy to unit test.

## Code Generation

Many files are generated — never edit `*.g.dart` or `*.freezed.dart` by hand. Key annotations and which tool handles them:

- `@riverpod` / `@Riverpod` → `riverpod_generator`
- `@freezed` → `freezed`
- `@JsonSerializable` → `json_serializable`
- `@DriftDatabase` / table classes → `drift_dev`

## Android-Specific Notes

`android/app/build.gradle.kts` requires `isCoreLibraryDesugaringEnabled = true` and the `coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")` dependency (already configured) for `flutter_local_notifications`.

## Timer State Machine

`TimerController` (`keepAlive: true`) transitions: `idle → paused → running → completed`. The running state anchors to `startedAt` (wall clock) so elapsed time is always recalculated via `DateTime.now().difference(startedAt)` — ticker drift and backgrounding are handled in `onAppResumed()`.

Electrode cleaning alarms are pre-scheduled as OS notifications on `start()` and cancelled on `pause()` / `reset()`, then rebuilt on the next `start()`.

## Branching

The `main` branch on origin is **protected** — direct pushes are not allowed.
All changes must go through a Pull Request from `dev` (or a feature branch) into `main`.
Never instruct the user to `git push origin main` directly; always create a PR instead.

## Versioning

**Never edit `pubspec.yaml` version manually.** Always use the version bump script:

```bash
# Bump patch (e.g. 2.0.0 → 2.0.1)
bash /Volumes/Crucial_X9/Development/silvertimer_flutter/scripts/bump_version.sh patch

# Bump minor (e.g. 2.0.0 → 2.1.0)
bash /Volumes/Crucial_X9/Development/silvertimer_flutter/scripts/bump_version.sh minor

# Bump major (e.g. 2.0.0 → 3.0.0)
bash /Volumes/Crucial_X9/Development/silvertimer_flutter/scripts/bump_version.sh major
```

The script updates `pubspec.yaml` (version + build number) and must be run before every release commit.

## Documentation

**After every feature, fix, or release — without exception:**

- **CHANGELOG.md** — add an entry under the appropriate version heading (`## [x.y.z]`) describing what changed. Follow the Keep a Changelog format (Added / Changed / Fixed / Removed).
- **README.md** — update whenever the change affects setup steps, features, screenshots, or usage instructions visible to contributors or users.

Both files must be updated in the same commit as the code change — never leave them stale.

## Coding style

Use prettier before commiting changes.