# 11. Flutter 3.50 and the extracted Material/Cupertino packages

- Status: accepted
- Date: 2026-11-16

## Context
CI pinned Flutter 3.47.7 while developer machines moved to 3.50.0. Dependabot resolves `pubspec.lock` against its own SDK, so Dart
group PRs failed `flutter pub get --enforce-lockfile` (for example `test_api` 0.7.14 vs 0.7.12). Since Flutter 3.47, `package:flutter/material.dart`
and `package:flutter/cupertino.dart` are deprecated in favour of `package:material_ui` and `package:cupertino_ui` (publisher flutter.dev), and
`flutter analyze --fatal-infos` fails on the deprecations. Both packages depend only on Dart/Flutter packages, so no iOS/macOS
Swift Package Manager manifest is needed (ADR 0006).

## Decision
- Pin Flutter 3.50.0 in `ci.yml`, `release.yml`, `codeql.yml` and `screenshots.yml` (ADR 0010).
- Add `material_ui` and `cupertino_ui` and migrate imports with `dart fix --apply --code=migrate_design_widgets`; the Material and Cupertino
  localization delegates come from the new packages.

## Consequences
- Local, CI and release builds use the same SDK, so Dart lockfile PRs should resolve consistently.
- Two new direct dependencies, maintained by the Flutter team.
- The Flutter version still has to be bumped by hand in four workflows.
