# 2. Riverpod with code generation, go_router, freezed

- Status: accepted
- Date: 2026-10-24 (in place since the first commits, February 2026)

## Context
A small multi-platform app (iOS, Android, web, macOS) with a few long-lived controllers (timer, calculator, settings, history) and
immutable models. Several of them must outlive their screens, notably the running timer.

## Decision
- State: `flutter_riverpod` with `@riverpod` / `@Riverpod(keepAlive: true)` annotations (`riverpod_generator`). Controllers that must
  survive navigation use `keepAlive`.
- Navigation: `go_router` with a `ShellRoute` for the three tabs (Calculator, Timer, History) inside `AppScaffold`; Settings and Devices
  are pushed routes. `/timer` redirects to `/calculator` while there is no calculation result.
- Models: `freezed` plus `json_serializable`.
- Structure: feature-first under `lib/features/`, shared infrastructure in `lib/core/` and `lib/shared/`.
- Generated files (`*.g.dart`, `*.freezed.dart`, `lib/l10n/generated/`) are committed, never edited by hand, and CI fails if they
  are stale (`tool/check_generated.sh`).

## Consequences
- Less boilerplate and compile-time checked providers; in return every annotated change needs a `build_runner` run.
- Dependabot cannot update the generators on its own: it changes `pubspec.*` but cannot regenerate, so such PRs need the generated
  files refreshed (this happened with freezed 4).
- Committing generated code keeps builds free of a codegen step but adds diff noise when generator versions change.
