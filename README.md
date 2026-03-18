# SilverTimer

A Flutter app for calculating and timing colloidal silver electrolysis sessions. Enter your water volume, electrode current, and target PPM concentration — the app computes the required electrolysis time using Faraday's Law and guides you through the session with a live countdown, electrode cleaning reminders, and push notifications.

Supports **Android**, **iOS**, and **Web**.

---

## Features

### Calculator
- Enter water volume in **mL or liters**
- Set electrode current in **milliamps** (0–5,000 mA)
- Choose target concentration in **PPM**
- Quick-select common PPM presets
- Remembers your last-used values between sessions

### Timer
- Circular countdown display with elapsed/remaining time
- Start, pause, and resume support — timer is wall-clock anchored so it stays accurate if the app is backgrounded
- Electrode cleaning alarm markers displayed on the ring at each scheduled interval
- Session automatically saved to history on completion

### History
- Persistent log of all completed sessions (SQLite via Drift)
- Shows volume, current, PPM, duration, and completion time

### Notifications
- Push notification when electrolysis completes (works when the app is backgrounded)
- Scheduled electrode cleaning reminders at configurable intervals (5, 10, 15, 20, or 30 minutes)
- All notifications managed via OS scheduler — fire reliably even if the app is killed

### Settings
- Light / Dark / System theme
- Default volume unit, PPM, and current
- Enable/disable notifications and cleaning alarms
- Configure cleaning alarm interval

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) ≥ 3.11
- For Android: Android SDK, `minSdk` 21 (Android 5.0)
- For iOS: Xcode ≥ 15, CocoaPods

### Install dependencies

```bash
flutter pub get
```

### Run

```bash
# List connected devices/emulators
flutter devices

# Run on a specific device
flutter run -d <device-id>

# Run on the first available device
flutter run
```

### Build

```bash
# Android APK
flutter build apk

# Android App Bundle (for Play Store)
flutter build appbundle

# iOS (requires macOS + Xcode)
flutter build ios

# Web
flutter build web
```

---

## Science

The required electrolysis time is derived from **Faraday's Law of Electrolysis**:

```
time (s) = (PPM × Volume (L) × F) / (M_Ag × I (A) × 1000)
```

| Symbol | Value | Description |
|--------|-------|-------------|
| F | 96,485 C/mol | Faraday constant |
| M_Ag | 107.87 g/mol | Molar mass of silver |
| I | user input | Electrode current in amperes |
| PPM | user input | Target concentration in mg/L |

---

## Development

### Code generation

Several packages require generated code. After modifying any file annotated with `@freezed`, `@riverpod`, `@JsonSerializable`, or a Drift table class, regenerate:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Never manually edit `*.g.dart` or `*.freezed.dart` files.

### Tests

```bash
# Run all tests
flutter test

# Run a single file
flutter test test/core/silver_calculator_test.dart
```

### Lint

```bash
flutter analyze
```

---

## Project Structure

```
lib/
├── main.dart                        # App entry point; initialises SharedPreferences & NotificationService
├── app.dart                         # MaterialApp.router with theme + go_router wiring
├── core/
│   ├── constants/                   # AppConstants (SharedPreferences keys, notification IDs), PhysicsConstants
│   ├── routing/                     # go_router setup; /timer route has a guard requiring a calculation result
│   ├── theme/                       # AppTheme (light/dark), AppColors
│   ├── extensions/                  # DurationExtensions
│   └── utils/
│       └── silver_calculator.dart   # Pure calculation service (Faraday's Law)
├── features/
│   ├── calculator/                  # Input form, PPM presets, result card
│   ├── timer/                       # Countdown controller, circular timer widget, notification service
│   ├── history/                     # Drift/SQLite session log
│   └── settings/                   # SharedPreferences-backed settings with freezed model
└── shared/
    └── widgets/
        └── app_scaffold.dart        # Bottom navigation shell (Calculator / Timer / History)
```

### Key Technology Choices

| Concern | Package |
|---------|---------|
| State management | `flutter_riverpod` + `riverpod_annotation` |
| Navigation | `go_router` |
| Immutable models | `freezed` |
| Persistence (history) | `drift` (SQLite) |
| Persistence (settings) | `shared_preferences` |
| Notifications | `flutter_local_notifications` + `timezone` |
| Animations | `flutter_animate`, `percent_indicator` |

---

## Android Permissions

| Permission | Reason |
|------------|--------|
| `POST_NOTIFICATIONS` | Timer completion and cleaning alarm notifications (Android 13+) |
| `SCHEDULE_EXACT_ALARM` / `USE_EXACT_ALARM` | Precise notification scheduling |
| `RECEIVE_BOOT_COMPLETED` | Reschedule exact alarms after device reboot |
| `WAKE_LOCK` | Wake screen when the completion alarm fires |
| `USE_FULL_SCREEN_INTENT` | Show alarm on the lock screen (Android 14+) |

---

## Releasing a New Version

Version is defined in one place: `version: X.Y.Z+N` in **`pubspec.yaml`**.
All platforms (Android `versionCode`/`versionName`, iOS/macOS `CFBundleVersion`/`CFBundleShortVersionString`) inherit it automatically at build time. The Info screen reads it at runtime via `package_info_plus`.

### Version format

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

### Day-to-day release workflow

```
  dev branch                          main branch
  ──────────────────────────────────  ────────────────────────────────
  1. Write features / fixes
  2. Update CHANGELOG.md
     (move [Unreleased] → [X.Y.Z])
  3. Bump version (choose one):
     a) Local script:
        ./scripts/bump_version.sh minor
        git push origin dev
     b) GitHub Actions:
        Actions → "Bump Version"
        → Run workflow (on dev)
  4. Open PR: dev → main ──────────► 5. Merge PR
                                       6. deploy-web.yml triggers:
                                          • builds Flutter web
                                          • deploys to GitHub Pages
                                          • creates annotated tag vX.Y.Z
```

### Option A — Local script

```bash
git checkout dev && git pull origin dev

# Choose bump type: patch | minor | major | 1.2.3
./scripts/bump_version.sh minor

# Script pauses — update CHANGELOG.md, then press Enter
# Script commits pubspec.yaml + CHANGELOG.md together

git push origin dev
# Open PR: dev → main
```

### Option B — GitHub Actions (no local checkout needed)

1. Go to **Actions → Bump Version → Run workflow**
2. Select branch `dev`, choose `patch / minor / major` (or enter a custom version)
3. The workflow commits the version bump to `dev` automatically
4. Update `CHANGELOG.md` on `dev` manually (edit on GitHub or via a local push)
5. Open PR: **dev → main**

### After merge

The `deploy-web.yml` workflow fires automatically (because `pubspec.yaml` is in the path filter). It:

1. Builds the Flutter web app
2. Deploys to GitHub Pages
3. Creates and pushes annotated tag `vX.Y.Z` on `main`

The tag is idempotent — if it already exists the step skips silently.

### Creating a GitHub Release (optional)

```bash
gh release create vX.Y.Z --title "SilverTimer X.Y.Z" --notes-file CHANGELOG.md
```

Or use the GitHub UI: **Releases → Draft a new release → select the tag**.

---
