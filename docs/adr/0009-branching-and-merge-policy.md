# 9. Short-lived branches, squash merges, required CI

- Status: accepted (supersedes the long-lived `dev` branch)
- Date: 2026-10-24

## Context
Work used to flow `dev → main` with merge commits, which left both branches diverging after squash merges and duplicated CI and
CodeQL runs. Tideline and FoxGrid use short-lived branches and squash merges.

## Decision
- No long-lived `dev`. Work happens on short-lived branches cut from `main` and merged by pull request.
- Only squash merges are allowed; branches are deleted on merge; the PR title becomes the Conventional Commit message.
- A ruleset on `main` blocks deletion and force-pushes and requires a pull request with one approval (repository admins can bypass) and
  the `Analyze & test` check from `ci.yml`.
- CI (`ci.yml`) runs format, `flutter analyze --fatal-infos --fatal-warnings`, the generated-code check and the tests; CodeQL runs on pull
  requests into `main` and weekly.

## Consequences
- A linear history on `main` and one workflow for every kind of change.
- A required check blocks red Dependabot PRs until they are fixed.
