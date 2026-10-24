# 8. Tag-triggered release workflow with fastlane

- Status: accepted (supersedes the earlier bump / auto-tag / three deploy workflows)
- Date: 2026-10-24

## Context
Releases were spread over five workflows (`bump-version`, `create-release-tag`, `deploy-web`, `deploy-ios`, `deploy-android`). The
auto-tag step pushed a tag with `GITHUB_TOKEN`, which does not trigger other workflows, so the deploys were in practice started by
hand. There was no dry run and no approval step.

## Decision
One workflow, `.github/workflows/release.yml`, started by pushing a `vX.Y.Z` tag. It checks the tag against `pubspec.yaml` and the
CHANGELOG section, then builds and publishes web (GitHub Pages), Android (Play Store internal track) and iOS (TestFlight) through
fastlane, and finally creates the GitHub release from the CHANGELOG. *Run workflow* with *publish* off is a dry run (fastlane skips the
uploads). Store jobs use the `production` environment on publishing runs, so a required reviewer there gates each release. The version
is bumped with `tool/bump_version.sh` on a release branch, merged by PR, then tagged by hand. Details: [../release.md](../release.md).

## Consequences
- One place to read and change the release process, a safe way to test it, and an optional approval gate.
- Tagging is a deliberate manual step.
- The Flutter and Ruby versions are pinned (`FLUTTER_VERSION`, `.ruby-version`) and must be bumped by hand.
