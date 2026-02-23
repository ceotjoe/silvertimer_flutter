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
