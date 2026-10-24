# CLAUDE.md — standing rules for SilverTimer

SilverTimer is a colloidal silver electrolysis timer calculator, a GPL-3.0-or-later Flutter app by Jörg Holzapfel. It uses Faraday's
Law of Electrolysis to compute how long to run electrolysis for a given water volume, electrode current (mA) and target PPM
concentration. The timer screen shows a circular countdown with electrode cleaning reminders.
Targets: iOS, iPadOS, Android, web (PWA) and macOS.

These rules apply to every session. If something here conflicts with what you find in the docs, the code or on a platform, **tell
the maintainer instead of guessing**. Decisions and their reasons are in `docs/adr/`; this file only holds the rules.

## Workflow
- Work in small, reviewable steps. Say what was done and verified, what was not, and what comes next.
- Branch from an up-to-date `main` (`feat/…`, `fix/…`, `docs/…`, `ci/…`, `release/vX.Y.Z`). There is no long-lived `dev` branch (ADR 0009).
- `main` is protected: never push to it and never tell the user to `git push origin main`. Open a Pull Request; PRs are **squash-merged**
  (the only merge method), so the PR title is the commit message. Required check: `Analyze & test`.
- Commits follow Conventional Commits (`feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `ci:`, `chore:`, `build:`). Only commit, push or open
  PRs when asked.
- Every significant decision gets an ADR in `docs/adr/NNNN-title.md` (copy `0000-template.md`).
- Releases: see Versioning below and `docs/release.md`.

## Architecture rules
- Feature-first: `lib/features/<feature>/{data,domain,presentation}`; shared infrastructure in `lib/core/` and `lib/shared/`.
- State: Riverpod with `@riverpod` / `@Riverpod(keepAlive:)` (`riverpod_generator`). Navigation: `go_router` with a `ShellRoute` for the three
  tabs (Calculator → Timer → History) inside `AppScaffold`; Settings and Devices are pushed routes; `/timer` redirects to `/calculator` until
  a calculation result exists. Models: `freezed` + `json_serializable`. (ADR 0002)
- `SilverCalculator` (`lib/core/utils/silver_calculator.dart`) stays a pure, stateless class without Flutter dependencies; the formula
  lives only there and is unit-tested. (ADR 0005)
- Persistence: history and devices in Drift/SQLite, settings in `SharedPreferences` (keys in `AppConstants`). Every schema change needs an
  `onUpgrade` migration and a migration test against a real older database file. Sessions keep a snapshot of the device used. (ADR 0004)
- iOS/macOS use Swift Package Manager only. Before adding a Flutter package check that it has a `Package.swift` (in its `ios/` or `darwin/`
  directory); never add a CocoaPods-only package (e.g. `alarm`, `flutter_fgbg`). (ADR 0006)
- Platform guards use `universal_platform`; `kIsWeb` / `TargetPlatform.macOS` gate the phone-width `AppWidthConstraint` on web and macOS.

### Timer
`TimerController` (`keepAlive: true`) transitions `idle → paused → running → completed`. While running it anchors to `startedAt` (wall clock):
elapsed time is always `DateTime.now().difference(startedAt)`, and ticker drift and backgrounding are handled in `onAppResumed()`. The
completion notification and the electrode cleaning alarms are pre-scheduled as OS notifications on `start()`, cancelled on `pause()` /
`reset()` and rebuilt on the next `start()`. Never make correctness depend on a running Dart timer. (ADR 0003)

### Code generation
Generated files (`*.g.dart`, `*.freezed.dart`, `lib/l10n/generated/`) are committed but must **never be edited by hand**. After changing an
annotated class, a Drift table or an ARB file, regenerate with `dart run build_runner build --delete-conflicting-outputs` and
`flutter gen-l10n`; CI fails if the committed files are stale. Tools: `@riverpod` → `riverpod_generator`, `@freezed` → `freezed`,
`@JsonSerializable` → `json_serializable`, `@DriftDatabase` / tables → `drift_dev`.

### Android
`android/app/build.gradle.kts` needs `isCoreLibraryDesugaringEnabled = true` and the
`coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:…")` dependency (already configured) for `flutter_local_notifications`.

## i18n rules
- No hard-coded user-facing strings. Everything goes in `lib/l10n/app_<locale>.arb`; ship English, German, Spanish and French together
  (`app_en.arb` is the template).
- Notification texts go through `NotificationStrings`; the in-app help page under `web/help/` is localised EN, DE, FR, ES as well.

## Code style and headers
- `dart format` with page width 100 (`tool/check_format.sh` checks all hand-written files); `analysis_options.yaml` is the lint source of truth.
  Use prettier for non-Dart files (Markdown, YAML, JSON) before committing.
- Every new hand-written `.dart` file starts with this header, then a blank line before the first import:

```dart
// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later
```

Generated files are exempt.

## Versioning
**Never edit the `pubspec.yaml` version by hand.** Use the bump script on a release branch; it updates version and build number
(the build number always increases, never resets) and pauses so the `CHANGELOG.md` section can be moved from `[Unreleased]` in the same commit:

```bash
tool/bump_version.sh patch   # or minor | major | 1.2.3
```

After the release PR is merged, push the tag `vX.Y.Z`; `.github/workflows/release.yml` builds and publishes web, Android and iOS and creates
the GitHub release. Run its dry run (publish off) after changing release tooling. Process, secrets and the pinned Flutter/Ruby versions:
`docs/release.md`, ADR 0008.

## Documentation
After every feature, fix or release, in the same commit as the code change:
- `CHANGELOG.md`: entry under `## [Unreleased]` (or the version heading), Keep a Changelog style (Added / Changed / Fixed / Removed / Security).
- `README.md`: update when setup, features, screenshots or usage change.

| Topic | Document |
|---|---|
| Index of all docs | `docs/README.md` |
| Release process, secrets, dry run | `docs/release.md` |
| Why things are the way they are | `docs/adr/` |
| Workflow for contributors | `CONTRIBUTING.md` |
| Security policy | `SECURITY.md` |

## Security and supply chain
- No secrets, keystores or signing material in the repo (`android/key.properties`, `*.jks`, `fastlane/.env` stay untracked); CI gets them from
  repository secrets.
- GitHub Actions are pinned to full commit SHAs and Flutter/Ruby to exact versions (ADR 0010). When bumping Flutter, update `FLUTTER_VERSION`
  in `ci.yml`, `release.yml`, `codeql.yml` and `screenshots.yml` together, and `.ruby-version` for Ruby.
- Dependabot PRs cannot regenerate code: if one fails the generated-code check, regenerate and push the result.

## Definition of Done (every change)
1. `tool/check_format.sh` is clean, `flutter analyze --fatal-infos --fatal-warnings` reports nothing, `flutter test` passes.
2. Generated code is up to date (`tool/check_generated.sh` on a clean tree).
3. No hard-coded strings; all four ARB files updated.
4. New `.dart` files carry the GPL header.
5. `CHANGELOG.md` updated, and `README.md` if user- or contributor-visible.
6. An ADR is written if a significant decision was made.

## Useful commands
```bash
flutter pub get                                      # resolve dependencies
flutter run                                          # run on a connected device/emulator (flutter devices lists them)
flutter test                                         # all tests
flutter test test/core/silver_calculator_test.dart   # a single test file
flutter analyze --fatal-infos --fatal-warnings       # lint, as CI runs it
tool/check_format.sh                                 # formatting of hand-written Dart
tool/check_generated.sh                              # regenerate and fail on a diff (needs a clean working tree)
dart run build_runner build --delete-conflicting-outputs   # regenerate code (watch: replace build with watch)
flutter gen-l10n                                     # regenerate localizations
tool/bump_version.sh patch|minor|major|X.Y.Z         # version bump for a release branch
tool/take_screenshots.sh [ios|android|both]          # store screenshots (see fastlane/)
```
