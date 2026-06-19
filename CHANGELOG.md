# Changelog

All notable changes to SilverTimer are documented here.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Versioning follows [Semantic Versioning](https://semver.org/).

## [Unreleased]

## [2.1.4] - 2026-06-19

### Fixed
- Android edge-to-edge display now works correctly on all devices (resolves Play Store warning): updated launch/normal theme parents to `Theme.AppCompat` and added explicit `WindowCompat.setDecorFitsSystemWindows` call in `MainActivity`
- Black screen on startup on Android 14 (API 34): `WindowCompat.setDecorFitsSystemWindows` was called after `super.onCreate()`, causing a window re-layout after Flutter attached its view; moved to before `super.onCreate()`

## [2.1.3] - 2026-06-16

### Fixed
- `CupertinoNavigationBar` now respects dark mode via `_CupertinoAdaptiveNavigationBar` wrapper that reads `Theme.of(context).colorScheme`
- Hardcoded colours in timer screen causing low contrast in dark mode: progress ring background uses `surfaceContainerHighest`, cleaning countdown uses `colorScheme.tertiary`, tick marks use theme-aware light/dark colours
- Completion dialog icon and MaterialBanner icon now use `colorScheme.primary` instead of hardcoded white
- iOS timer screenshot was missing because `find.widgetWithIcon(FilledButton)` does not match `CupertinoButton`; fixed with `Key('start_timer_button')` + `find.byKey()`
- Tap crosshair visible in screenshots; `_decayCrosshair()` pumps 8 frames before each capture
- `timeDilation` reset to `1.0` at end of test body to satisfy `_verifyInvariants` assertion
- `TimerController._onTick` guards `ref.mounted` before state writes, preventing `UnmountedRefException` after provider disposal
- frameit `_framed.png` files now replace originals; PNG alpha removed with correct dark background colour via ImageMagick

## [2.1.2] - 2026-06-15

### Fixed
- `SettingsController` async setters now guard state writes with `ref.mounted` check, preventing `UnmountedRefException` after provider disposal (visible during screenshot test teardown)
- Notification permission dialog suppressed during screenshot captures via `--dart-define=SCREENSHOT_MODE=true`

### Changed
- Screenshot lane updated to current hardware: iPhone 17 Pro Max, iPad Pro 13-inch (M5), Pixel 10 Pro; iPhone 14 Plus and Android tablet device removed
- Android locale switching replaced with rootless per-app locale API (`cmd locale set-app-locales`) — works on Play Store system images
- Added `scripts/take_screenshots.sh` as a single local entry point for both iOS and Android screenshot generation
- Generated screenshot images excluded from version control (`.gitignore`); `Framefile.json` and `title.strings` retained

## [2.1.1] - 2026-06-15

### Fixed
- Alarm could not be dismissed when the timer completed while the user was on a different tab: `WidgetsBindingObserver` moved from `TimerScreen` to `AppScaffold` so `onAppResumed()` fires regardless of the active tab
- Added a global `MaterialBanner` in `AppScaffold` that appears on timer completion and provides a "Done" button visible from any tab, stopping the looping alarm without requiring navigation to the Timer tab
- Completion dialog changed to `barrierDismissible: true` so it can be dismissed even if its navigator context becomes stale after a tab switch

### Added
- Liquid Glass support (Steps 1 & 2): platform detection helper and frosted glass navigation bar for iOS and macOS
- `GlassNavigationBar` widget: `BackdropFilter` blur + semi-transparent surface, animated icon/label switching, dark mode aware
- `AppScaffold` now renders a full-bleed body with the glass bar floating on top on Apple platforms; Material `NavigationBar` unchanged on Android/web
- Liquid Glass Step 3: `adaptiveAppBar` factory returns `CupertinoNavigationBar` on iOS/macOS and Material `AppBar` on all other platforms; applied to all five screens
- Liquid Glass Step 4: `GlassCard` widget with `BackdropFilter` blur and semi-transparent tint on iOS/macOS; falls back to Material `Card` elsewhere; applied to `ResultCard`
- Liquid Glass Step 5: `AdaptiveFilledButton` and `AdaptiveOutlinedButton` render `CupertinoButton` on iOS/macOS; `AdaptiveTextFormField` and `AdaptiveTextField` render Cupertino-styled filled inputs on iOS/macOS; applied to calculator, timer, and settings screens
- Liquid Glass Step 6: `AppCupertinoColors` with `CupertinoDynamicColor` constants replace all hardcoded brightness checks in glass widgets; colors now resolve automatically for light/dark mode via the system semantic color system

### Changed
- macOS window opens in portrait mode (390×844) with iPhone-sized min/max constraints for a phone-like experience
- Removed CocoaPods integration from macOS and iOS; all plugins now use Swift Package Manager (faster builds)
- Fixed Dependabot security alerts: bumped jwt (→3.2.0) and addressable (→2.9.0) in Gemfile.lock; activesupport alerts resolved by CocoaPods removal

### Changed
- Bumped 25 transitive and direct dependencies to latest compatible versions (Tier 1 patch/minor upgrades): audioplayers 6.7.1, cupertino_icons 1.0.9, shared_preferences 2.5.5, and assorted transitive packages
- Upgraded all Tier 2 major dependencies: drift 2.34, drift_flutter 0.3, freezed 3.x, json_annotation 4.12, json_serializable 6.14, flutter_riverpod 3.x, riverpod_annotation/generator 4.x, go_router 17.x, flutter_local_notifications 22.x, timezone 0.11, package_info_plus 10.x, build_runner 2.15, sqlite3_flutter_libs 0.6
- Migrated notification_service.dart to flutter_local_notifications v22 named-parameter API (show/zonedSchedule/initialize); removed deprecated UILocalNotificationDateInterpretation
- Replaced StateProvider with NotifierProvider in timer_controller.dart (StateProvider removed in Riverpod v3)
- Removed redundant flutter_riverpod imports in files that already import riverpod_annotation
- Removed explicit kotlin-android Gradle plugin from app/build.gradle.kts; Kotlin is now provided by the Flutter Gradle Plugin (built-in Kotlin migration)

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

[Unreleased]: https://github.com/ceotjoe/silvertimer_flutter/compare/v2.1.4...HEAD
[2.1.4]: https://github.com/ceotjoe/silvertimer_flutter/compare/v2.1.3...v2.1.4
[2.1.3]: https://github.com/ceotjoe/silvertimer_flutter/compare/v2.1.2...v2.1.3
[2.1.2]: https://github.com/ceotjoe/silvertimer_flutter/compare/v2.1.1...v2.1.2
[2.1.1]: https://github.com/ceotjoe/silvertimer_flutter/compare/v2.1.0...v2.1.1
[2.0.1]: https://github.com/ceotjoe/silvertimer_flutter/compare/v2.0.0...v2.0.1
[2.0.0]: https://github.com/ceotjoe/silvertimer_flutter/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/ceotjoe/silvertimer_flutter/releases/tag/v1.0.0
