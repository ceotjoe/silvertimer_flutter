## What and why

<!-- What does this change, and why? Link related issues: "Closes #…" -->

## Definition of Done

<!-- Tick what applies; explain anything you skipped. -->

- [ ] CI checks pass locally: `tool/check_format.sh`, `flutter analyze --fatal-infos --fatal-warnings`, `flutter test`
- [ ] Generated code is up to date (`dart run build_runner build --delete-conflicting-outputs`, `flutter gen-l10n`); generated files not edited by hand
- [ ] No hard-coded user-facing strings; added to all four ARB files (`lib/l10n/app_{en,de,es,fr}.arb`)
- [ ] New hand-written `.dart` files start with the copyright / SPDX header
- [ ] `CHANGELOG.md` (Unreleased) and, if visible to users or contributors, `README.md` updated
- [ ] ADR written in `docs/adr/` if a significant decision was made
- [ ] Commits follow Conventional Commits; the PR title works as the squash commit title

## How it was tested

<!-- Devices, simulators, OS versions, screenshots. -->
