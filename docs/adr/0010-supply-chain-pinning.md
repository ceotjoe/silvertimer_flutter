# 10. Pin actions and toolchains; Dependabot for updates

- Status: accepted
- Date: 2026-10-24

## Context
Workflows used moving tags (`@v4`) and `subosito/flutter-action` on the `stable` channel, so a moved tag or a new Flutter release could
change CI and release builds without any change in this repository. Dependency alerts were fixed by hand.

## Decision
- Every GitHub Action is pinned to a full commit SHA with the version in a comment, and the repository setting that requires SHA
  pinning is on. Flutter is installed by the local composite action `.github/actions/setup-flutter` at a pinned release.
- `.github/dependabot.yml` updates pub (minor and patch grouped), GitHub Actions (including the local action), Gradle and Bundler;
  Dependabot security updates are enabled.
- `pubspec.lock` is committed and CI resolves with `--enforce-lockfile`.

## Consequences
- Reproducible CI; updates arrive as reviewable PRs.
- `FLUTTER_VERSION` appears in several workflows and is not covered by Dependabot; it is bumped by hand together with `.ruby-version`
  when needed.
