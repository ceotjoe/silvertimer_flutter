# Releasing SilverTimer

Releases follow [Semantic Versioning](https://semver.org). The version lives in one place: `version: X.Y.Z+N` in
`pubspec.yaml`. Android (`versionCode`/`versionName`) and iOS/macOS (`CFBundleVersion`/`CFBundleShortVersionString`) inherit it
at build time, and the Info screen reads it at runtime via `package_info_plus`.

```
version: MAJOR.MINOR.PATCH+BUILD
         └─────────────┘ └─────┘
            semver          build number (monotonically increasing,
                            never reset — required by App Store / Play Store)
```

| Bump | When to use |
|------|-------------|
| `patch` | Bug fixes, copy changes, dependency updates — nothing new for the user |
| `minor` | New user-visible feature, backward compatible |
| `major` | Breaking data change (e.g. incompatible DB migration) or major milestone |

## Releasing

1. Create a branch from an up-to-date `main` and run the bump script. It updates `pubspec.yaml`, pauses so you can move the
   `[Unreleased]` entries in `CHANGELOG.md` to a new `## [X.Y.Z] - YYYY-MM-DD` section, and commits both.

   ```bash
   git checkout main && git pull
   git checkout -b release/vX.Y.Z
   tool/bump_version.sh minor   # patch | minor | major | 1.2.3
   ```

2. Push the branch, open a PR into `main` titled `chore: release vX.Y.Z` and squash-merge it once CI is green.
3. Tag the merge commit. The tag **must** be `v` plus the `pubspec.yaml` version, and `CHANGELOG.md` must have a matching
   `## [X.Y.Z]` heading, or the run fails before building anything.

   ```bash
   git checkout main && git pull
   git tag -a vX.Y.Z -m "Release vX.Y.Z"
   git push origin vX.Y.Z
   ```

   The tag has to be pushed by you: a tag pushed by a workflow with the default `GITHUB_TOKEN` does not start other workflows.

4. `.github/workflows/release.yml` runs on the tag:

   | Job | Does |
   |---|---|
   | `meta` | Checks tag = pubspec version and that the CHANGELOG section exists |
   | `web` | Builds Flutter web and deploys it to GitHub Pages (`gh-pages` branch) |
   | `android` | Builds the signed AAB and uploads it to the Play Store **internal** track (`fastlane android deploy`) |
   | `ios` | Builds the signed IPA and uploads it to TestFlight (`fastlane ios deploy`) |
   | `github-release` | After all three succeed, creates the GitHub release with the CHANGELOG section as notes |

   Promoting the Play Store and TestFlight builds to production stays a manual step in the store consoles.

## Dry run and re-running a release

*Actions → Release → Run workflow* has a **publish** checkbox, off by default:

- **Off (dry run):** builds web, the Android AAB and the iOS IPA with real signing and publishes nothing: no Pages deploy, no store
  upload (`DRY_RUN=true` for fastlane), no GitHub release, and no environment approval. Works from any branch. Do this after
  changing the release tooling, before the next real tag.
- **On:** repeats the release of an existing tag, e.g. after a store upload failed. Choose the tag under *Use workflow from →
  Tags*; the run fails fast if the ref is not a tag matching `pubspec.yaml`. An existing GitHub release is updated, not duplicated.

## Secrets and the `production` environment

All credentials are **repository secrets** (Settings → Secrets and variables → Actions):

| Secret | Used for |
|---|---|
| `KEYSTORE_BASE64`, `KEYSTORE_PASSWORD`, `KEY_ALIAS`, `KEY_PASSWORD` | Android upload keystore (the `.jks` base64-encoded) |
| `PLAY_STORE_JSON_KEY` | Google Play service account JSON |
| `APPLE_TEAM_ID` | Apple developer team |
| `IOS_DISTRIBUTION_CERT_BASE64`, `IOS_DISTRIBUTION_CERT_PASSWORD` | Apple Distribution certificate (`.p12`) |
| `IOS_PROVISIONING_PROFILE_BASE64` | App Store provisioning profile for `com.ITWebService.SilverTimer` |
| `APPSTORE_API_KEY_ID`, `APPSTORE_ISSUER_ID`, `APPSTORE_API_KEY_BASE64` | App Store Connect API key for the TestFlight upload |

Encode a file with `base64 -i file | pbcopy` (macOS). Never paste a secret into chat or commit it.

On publishing runs the `android` and `ios` jobs declare `environment: production` (GitHub creates it on first use). To make each
release wait for your approval before anything reaches a store, add yourself as a required reviewer under
**Settings → Environments → production**. Dry runs use no environment and never wait.

Fastlane needs Ruby ≥ 3.3 (a gem in `Gemfile.lock` requires it); the version is pinned in `.ruby-version`, which the workflow reads.

## Maintenance

- **Flutter version:** pinned as `FLUTTER_VERSION` in `ci.yml`, `release.yml`, `codeql.yml` and `screenshots.yml`. Dependabot
  does not track it; bump all four together.
- **Actions:** pinned to commit SHAs; Dependabot updates them.
- **Screenshots** for the store listings: `tool/take_screenshots.sh` locally, or *Actions → Generate Screenshots*.
