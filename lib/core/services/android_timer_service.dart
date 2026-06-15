// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:silvertimer_flutter/features/timer/domain/models/timer_state.dart';

/// Manages the Android Foreground Service that shows a persistent countdown
/// notification on the lock screen while the timer is running.
///
/// The Foreground Service runs in Kotlin (`TimerForegroundService.kt`) and
/// auto-updates the notification's chronometer every second using Android's
/// built-in `setUsesChronometer` + `setChronometerCountDown`. Flutter only
/// needs to signal start / pause / stop and changes to the next-cleaning time.
///
/// Notification action buttons (Pause / Resume) send events back via
/// [actionEvents]; the caller must subscribe and call the appropriate
/// [TimerController] methods.
///
/// All methods are no-ops on non-Android platforms.
class AndroidTimerService {
  static const _kMethodChannel =
      MethodChannel('com.it_web_service.silvertimer/timer_service');
  static const _kEventChannel =
      EventChannel('com.it_web_service.silvertimer/timer_events');

  StreamSubscription<dynamic>? _eventSub;
  final StreamController<String> _actionController =
      StreamController<String>.broadcast();

  /// Stream of action strings emitted when the user taps a notification button.
  /// Values: `'pause'` or `'resume'`.
  Stream<String> get actionEvents => _actionController.stream;

  // ---------------------------------------------------------------------------
  // Lifecycle: call this once when the service is first created.
  // ---------------------------------------------------------------------------

  /// Start listening for action events from the native notification buttons.
  void init() {
    if (!Platform.isAndroid) return;
    _eventSub = _kEventChannel.receiveBroadcastStream().listen(
      (event) {
        if (event is String) _actionController.add(event);
      },
      onError: (_) {},
    );
  }

  void dispose() {
    _eventSub?.cancel();
    _actionController.close();
  }

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  /// Start the Foreground Service when the timer begins running.
  ///
  /// [state] must be [TimerRunning]. The native service calculates remaining
  /// time itself from [TimerRunning.startedAt] and [TimerRunning.totalDuration]
  /// so it does not need to be updated every second.
  Future<void> startTimer({
    required TimerRunning state,
    required double targetPpm,
    Duration? nextCleaningIn,
  }) async {
    if (!Platform.isAndroid) return;
    final endAtMs =
        state.startedAt.add(state.totalDuration).millisecondsSinceEpoch;
    await _kMethodChannel.invokeMethod<void>('startTimer', {
      'startedAtMs': state.startedAt.millisecondsSinceEpoch,
      'totalDurationMs': state.totalDuration.inMilliseconds,
      'endAtMs': endAtMs,
      'targetPpm': targetPpm,
      // Absolute epoch ms of next cleaning alarm (or null).
      'nextCleaningAtMs': nextCleaningIn != null
          ? DateTime.now().add(nextCleaningIn).millisecondsSinceEpoch
          : null,
    });
  }

  /// Pause the Foreground Service notification (shows static remaining time).
  Future<void> pauseTimer({
    required Duration remaining,
    required double targetPpm,
  }) async {
    if (!Platform.isAndroid) return;
    await _kMethodChannel.invokeMethod<void>('pauseTimer', {
      'remainingMs': remaining.inMilliseconds,
      'targetPpm': targetPpm,
    });
  }

  /// Resume (same payload as start — the chronometer end-time is recalculated).
  Future<void> resumeTimer({
    required TimerRunning state,
    required double targetPpm,
    Duration? nextCleaningIn,
  }) async {
    await startTimer(
      state: state,
      targetPpm: targetPpm,
      nextCleaningIn: nextCleaningIn,
    );
  }

  /// Update the notification when the next cleaning alarm schedule changes
  /// (e.g. a cleaning alarm just fired and the next one is different).
  Future<void> updateNextCleaning({
    required TimerRunning state,
    required double targetPpm,
    required Duration? nextCleaningIn,
  }) async {
    if (!Platform.isAndroid) return;
    final endAtMs =
        state.startedAt.add(state.totalDuration).millisecondsSinceEpoch;
    await _kMethodChannel.invokeMethod<void>('updateTimer', {
      'endAtMs': endAtMs,
      'targetPpm': targetPpm,
      'nextCleaningAtMs': nextCleaningIn != null
          ? DateTime.now().add(nextCleaningIn).millisecondsSinceEpoch
          : null,
    });
  }

  /// Stop and dismiss the Foreground Service notification (reset or completed).
  Future<void> stopTimer() async {
    if (!Platform.isAndroid) return;
    try {
      await _kMethodChannel.invokeMethod<void>('stopTimer');
    } catch (_) {
      // Service may already be stopped.
    }
  }
}
