# Changelog

All notable changes to SilverTimer are documented here.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Versioning follows [Semantic Versioning](https://semver.org/).

## [Unreleased]

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

[Unreleased]: https://github.com/ceotjoe/silvertimer_flutter/compare/v2.0.0...HEAD
[2.0.0]: https://github.com/ceotjoe/silvertimer_flutter/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/ceotjoe/silvertimer_flutter/releases/tag/v1.0.0
