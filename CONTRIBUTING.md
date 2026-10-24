# Contributing to SilverTimer

Thanks for helping. Bug reports, translations, documentation and code are all welcome.

## Ground rules

- Read [CLAUDE.md](CLAUDE.md): it holds the project's architecture, code generation and documentation rules.
- Be kind. See the [Code of Conduct](CODE_OF_CONDUCT.md).
- Security issues go through [SECURITY.md](SECURITY.md), never through public issues.

## Getting started

Requirements:

- Flutter **3.47** (stable), which includes Dart 3.13.
- Xcode (iOS/macOS) and/or Android Studio.

Then:

```bash
flutter pub get
flutter analyze --fatal-infos --fatal-warnings   # must report no issues
tool/check_format.sh                              # hand-written Dart must be formatted
flutter test
flutter run
```

Generated files (`*.g.dart`, `*.freezed.dart`, `lib/l10n/generated/`) are committed but never edited by hand. After changing an
annotated class or an ARB file, regenerate them:

```bash
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

CI fails if the committed generated files differ from what these commands produce.

## Workflow

1. Ask in [Discussions](https://github.com/ceotjoe/silvertimer_flutter/discussions) or open an issue first for anything bigger than a small fix, so we can agree on the approach.
2. Branch from an up-to-date `main` (`feat/…`, `fix/…`, `docs/…`). There is no long-lived `dev` branch.
3. Use [Conventional Commits](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `ci:`,
   `chore:`). Pull requests are **squash-merged**, so the PR title becomes the commit message.
4. Keep pull requests small and focused. A PR is ready when it meets the checklist in the
   [pull request template](.github/pull_request_template.md):
   - format, analyze and tests pass, and generated code is up to date;
   - no hard-coded user-facing strings: add them to all four ARB files in `lib/l10n/`;
   - new hand-written `.dart` files start with the copyright / SPDX header (see CLAUDE.md);
   - `CHANGELOG.md` (under *Unreleased*) and, if users or contributors see the change, `README.md` are updated;
   - a short ADR in [docs/adr/](docs/adr/) if you made a significant design decision.
5. Never edit the version in `pubspec.yaml` by hand. Releases are described in [docs/release.md](docs/release.md).

## Translations

The app ships English, German, Spanish and French. Strings live in `lib/l10n/app_<locale>.arb`; `app_en.arb` is the template. To
fix or add a translation, edit the ARB file and run `flutter gen-l10n`, or just open a
[translation issue](https://github.com/ceotjoe/silvertimer_flutter/issues/new?template=translation.yml) and describe the change.

## Licence

SilverTimer is licensed under the [GNU GPL v3 or later](LICENSE). By contributing you agree that your contributions are licensed
under the same terms.
