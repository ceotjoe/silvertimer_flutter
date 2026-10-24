# 3. Wall-clock-anchored timer with pre-scheduled OS notifications

- Status: accepted
- Date: 2026-10-24 (decided February 2026, "Fix background notifications")

## Context
An electrolysis run takes minutes to hours, and users lock the phone or switch apps meanwhile. Mobile OSes suspend Dart timers in the
background, so a ticker-based countdown drifts or stops, yet the user must be told reliably when the run is done and when the electrodes
need cleaning.

## Decision
- `TimerController` (`keepAlive: true`) moves through `idle → paused → running → completed`. While running it stores `startedAt` (wall
  clock). Elapsed time is always `DateTime.now().difference(startedAt)`; the one-second ticker only repaints the UI, and
  `onAppResumed()` recomputes everything and fires any alarms that came due in the background.
- On `start()` the completion notification and every electrode-cleaning alarm are scheduled as OS notifications
  (`flutter_local_notifications` with exact alarms and `timezone`). `pause()` and `reset()` cancel them; the next `start()` rebuilds them.
- The completion alarm plays looping audio with an iOS background audio session; Android additionally runs a foreground service
  (`TimerForegroundService.kt`, `AndroidTimerService`) that shows a lock-screen countdown with pause/resume actions.
- Completed sessions are saved to history automatically.

## Consequences
- Correct after backgrounding or a suspended process, with no dependence on a running Dart isolate.
- Platform-specific code and permissions (exact alarms, notifications, background audio) must be maintained; web has no background
  guarantees.
- Tests can drive the controller by controlling the clock instead of waiting.
