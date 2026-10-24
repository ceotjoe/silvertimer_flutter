# SilverTimer documentation

| Topic | Document |
|---|---|
| Releasing: version bump, tag, dry run, secrets | [release.md](release.md) |
| Architecture decisions (why things are the way they are) | [adr/](adr/) |
| Contributing: workflow, checks, translations | [../CONTRIBUTING.md](../CONTRIBUTING.md) |
| Working rules for the repo and for Claude Code | [../CLAUDE.md](../CLAUDE.md) |
| Security policy | [../SECURITY.md](../SECURITY.md) |
| Change history | [../CHANGELOG.md](../CHANGELOG.md) |

## Architecture decision records

Significant decisions are recorded as short ADRs, one per file, numbered and never rewritten (a changed decision gets a new ADR that
supersedes the old one). Copy [adr/0000-template.md](adr/0000-template.md) for a new one. ADRs 0002 to 0010 were written retroactively
for decisions that were already in place.

| # | Decision |
|---|---|
| [0001](adr/0001-record-architecture-decisions.md) | Record architecture decisions |
| [0002](adr/0002-state-management-and-navigation.md) | Riverpod with code generation, go_router, freezed |
| [0003](adr/0003-wall-clock-anchored-timer.md) | Wall-clock-anchored timer with pre-scheduled OS notifications |
| [0004](adr/0004-persistence-drift-and-shared-preferences.md) | Drift/SQLite for history and devices, SharedPreferences for settings |
| [0005](adr/0005-pure-calculation-logic.md) | Calculation logic is a pure, stateless class |
| [0006](adr/0006-swift-package-manager-only.md) | Swift Package Manager only, no CocoaPods |
| [0007](adr/0007-gpl-3-or-later.md) | License: GPL-3.0-or-later |
| [0008](adr/0008-release-automation.md) | Tag-triggered release workflow with fastlane |
| [0009](adr/0009-branching-and-merge-policy.md) | Short-lived branches, squash merges, required CI |
| [0010](adr/0010-supply-chain-pinning.md) | Pin actions and toolchains; Dependabot for updates |
