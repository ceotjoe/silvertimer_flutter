# Changelog

All notable changes to SilverTimer are documented here.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Versioning follows [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Added
- `SECURITY.md` — vulnerability reporting policy using GitHub Private Vulnerability Reporting

### Fixed
- iOS screenshot/deploy CI: `bundle exec fastlane` injects `RUBYOPT`, `BUNDLE_GEMFILE`,
  `GEM_HOME`, and `GEM_PATH` into the environment; Flutter's internal `pod --version`
  check inherits them and fails with "CocoaPods installed but broken". Fixed by using
  `env -u` to fully unset all four bundler vars for the `flutter build ios` subprocess
  so the system-installed CocoaPods loads from the default Ruby gem path unimpeded.
  Screenshots workflow now installs activesupport 7.x before cocoapods to prevent
  gem install from pulling in the incompatible activesupport 8.x.

## [2.1.0] - 2026-03-18

### Added
- Fastlane integration for Android and iOS CI/CD pipelines — replaces raw
  shell scripts with `upload_to_play_store` and `upload_to_testflight` for
  richer error output and more reliable codesigning

### Changed
- CI codesigning switched to manual style (`CODE_SIGN_STYLE = Manual`) in
  Xcode project; certificate and provisioning profile injected via GitHub
  Secrets at build time
- CocoaPods added to Gemfile so `pod` is available in the Ruby 3.2
  environment used by Fastlane — fixes "CocoaPods broken" error in CI

### Fixed
- `build.gradle.kts` unresolved `java.util` / `java.io` references and
  deprecated `jvmTarget` DSL corrected
- Android versionCode aligned to 35 to match existing Play Store history
- Provisioning profile UUID extraction now uses a temp file instead of
  piping to PlistBuddy (pipe seek not supported)
- Fastfile `sh()` commands prefixed with `cd ..` to run from project root
- AAB upload path corrected to absolute `ROOT`-based path

## [2.0.1] - 2026-03-18

### Added
- Android and iOS CI/CD workflows deploying AAB to Play Store internal track
  and IPA to TestFlight on every push to `main`
- `ios/ExportOptions.plist` for App Store IPA export

### Changed
- Android `applicationId` changed to `com.it_web_service.silvertimer` to match
  existing Play Store listing
- iOS and macOS bundle identifier changed to `com.ITWebService.SilverTimer` to
  match existing App Store listing
- Android `MainActivity.kt` moved to new package `com.it_web_service.silvertimer`
- Settings screen: unit labels (PPM / mA) moved to the left of their input fields
  for cleaner alignment; both fields now display integer values only
- Settings screen: theme selector centred
- Settings screen: version number now reads dynamically from `package_info_plus`
  instead of being hardcoded
- Typical current range hint updated from "0.5–3 mA" to "5–40 mA" across all
  four locales (EN, DE, FR, ES)
- Default first-launch values updated: Water Volume 500 ml, Target Concentration
  25 PPM
- Fixed: settings values (PPM, mA) were not persisted when navigating away without
  dismissing the keyboard — now saved in `dispose()`
- Fixed: `build.gradle.kts` imports and deprecated `jvmTarget` DSL corrected for
  compatibility with current Kotlin Gradle plugin
- CLAUDE.md: versioning and documentation rules strengthened; absolute script path
  added

## [2.0.0] - 2026-03-18

### Added
- Info tab (4th navigation tab) with About screen: app name, live version number,
  app icon, author credit ("by Jörg Holzapfel"), and link to hosted help page
- Multilingual help page at `/silvertimer_flutter/help/` with automatic browser
  language detection redirecting to EN, DE, FR, or ES sub-pages; manual language
  switcher on every page; shared CSS (`help.css`)
- `package_info_plus` integration — version number on Info screen always reflects
  the actual installed build
- `url_launcher` integration — help link opens in the system browser

### Changed
- App display name corrected to "SilverTimer" on all platforms (was
  "silvertimer_flutter" on Android, "Silvertimer Flutter" on iOS,
  "silvertimer_flutter" on macOS)
- Alarm-clock notifications upgraded: separate high-priority alarm channel with
  `AudioAttributesUsage.alarm`, `AndroidScheduleMode.alarmClock` (bypasses Doze),
  `InterruptionLevel.timeSensitive` on iOS/macOS (bypasses Focus/DND), looping
  in-app alarm sound via `audioplayers`, full-screen intent on lock screen
- Version bump tooling added: `scripts/bump_version.sh`, GitHub Actions
  `bump-version.yml` workflow, auto-tagging step in `deploy-web.yml`
- `CHANGELOG.md` introduced

## [1.0.0] - 2026-03-18

### Added
- Faraday's Law calculator: enter water volume (mL or L), electrode current (mA),
  and target PPM concentration to compute the required electrolysis run time
- Circular countdown timer with wall-clock anchoring — stays accurate when the app
  is backgrounded, screen is locked, or device is restarted
- Electrode cleaning reminders: configurable interval (5–30 min), scheduled as
  OS notifications so they fire even when the app is backgrounded or killed
- Alarm-clock completion notification using `AlarmManager.setAlarmClock()` on
  Android (bypasses Doze mode) and `InterruptionLevel.timeSensitive` on iOS/macOS
  (bypasses Focus/DND); looping in-app alarm sound via `audioplayers`
- Session history persisted with Drift/SQLite; every completed run is auto-saved
- Settings screen: light/dark/system theme, default PPM, current (mA), volume unit,
  notification toggle, cleaning alarm enable/interval
- Full localisation in English, German, French, and Spanish (`flutter gen-l10n`)
- Info screen showing live app version (`package_info_plus`), app icon, author
  credit, and link to the hosted help page
- Multilingual help page hosted on GitHub Pages (`/help/`) with automatic browser
  language detection (EN, DE, FR, ES) and a manual language switcher
- iOS, Android, macOS, and Web (PWA) build targets
- Custom SilverTimer app icon across all platforms
- GitHub Actions workflow deploying Flutter web to GitHub Pages on every push
  to `main`

[Unreleased]: https://github.com/ceotjoe/silvertimer_flutter/compare/v2.0.1...HEAD
[2.0.1]: https://github.com/ceotjoe/silvertimer_flutter/compare/v2.0.0...v2.0.1
[2.0.0]: https://github.com/ceotjoe/silvertimer_flutter/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/ceotjoe/silvertimer_flutter/releases/tag/v1.0.0
