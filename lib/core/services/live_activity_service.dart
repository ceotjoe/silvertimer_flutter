// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:io';

import 'package:live_activities/live_activities.dart';
import 'package:silvertimer_flutter/features/timer/domain/models/timer_state.dart';

/// Wraps the `live_activities` package to show the SilverTimer countdown
/// as an iOS Live Activity on the Lock Screen, Dynamic Island, and StandBy.
///
/// Requires iOS 16.1+. On older iOS versions or non-iOS platforms all calls
/// are no-ops. Callers never need to guard with [Platform.isIOS].
///
/// ## Xcode setup required before this works
/// 1. Runner target → Signing & Capabilities → App Groups →
///    add `group.com.it-web-service.silvertimer`
/// 2. File → New Target → Widget Extension → "SilverTimerWidget"
///    (uncheck "Include Configuration Intent")
/// 3. Add the same App Group to the SilverTimerWidget target.
/// 4. Set SilverTimerWidget deployment target to iOS 16.1.
/// 5. Run `pod install` in the `ios/` directory.
class LiveActivityService {
  static const _appGroupId = 'group.com.it-web-service.silvertimer';

  final _plugin = LiveActivities();
  String? _activityId;
  bool _initialized = false;

  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    if (!Platform.isIOS) return;
    await _plugin.init(appGroupId: _appGroupId);
    _initialized = true;
  }

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  /// Start a new Live Activity when the timer begins.
  Future<void> startActivity({
    required TimerRunning state,
    required double targetPpm,
    Duration? nextCleaningIn,
  }) async {
    if (!Platform.isIOS) return;
    await _ensureInitialized();

    // End any stale activity from a previous session.
    await endActivity();

    final data = _buildData(
      endTimestamp: state.startedAt.add(state.totalDuration),
      remainingSeconds: (state.totalDuration - state.elapsed).inSeconds.toDouble(),
      totalDuration: state.totalDuration.inSeconds.toDouble(),
      isPaused: false,
      isCompleted: false,
      nextCleaningIn: nextCleaningIn?.inSeconds.toDouble(),
      targetPpm: targetPpm,
    );

    _activityId = await _plugin.createActivity(data);
  }

  /// Update the Live Activity whenever the timer state changes.
  ///
  /// Called on every cleaning alarm tick (where [nextCleaningIn] changes),
  /// on pause, and on resume. Does NOT need to be called every second —
  /// the SwiftUI widget uses a `.timer` interval text that counts down
  /// automatically on the iOS side.
  Future<void> updateActivity({
    required TimerState timerState,
    required double targetPpm,
    Duration? nextCleaningIn,
  }) async {
    if (!Platform.isIOS) return;
    final id = _activityId;
    if (id == null) return;

    late Map<String, dynamic> data;

    switch (timerState) {
      case TimerRunning(:final startedAt, :final totalDuration, :final elapsed):
        data = _buildData(
          endTimestamp: startedAt.add(totalDuration),
          remainingSeconds: (totalDuration - elapsed).inSeconds.toDouble(),
          totalDuration: totalDuration.inSeconds.toDouble(),
          isPaused: false,
          isCompleted: false,
          nextCleaningIn: nextCleaningIn?.inSeconds.toDouble(),
          targetPpm: targetPpm,
        );
      case TimerPaused(:final totalDuration, :final elapsed):
        data = _buildData(
          endTimestamp: null,
          remainingSeconds: (totalDuration - elapsed).inSeconds.toDouble(),
          totalDuration: totalDuration.inSeconds.toDouble(),
          isPaused: true,
          isCompleted: false,
          nextCleaningIn: nextCleaningIn?.inSeconds.toDouble(),
          targetPpm: targetPpm,
        );
      case TimerCompleted(:final totalDuration):
        data = _buildData(
          endTimestamp: null,
          remainingSeconds: 0,
          totalDuration: totalDuration.inSeconds.toDouble(),
          isPaused: false,
          isCompleted: true,
          nextCleaningIn: null,
          targetPpm: targetPpm,
        );
        await _plugin.updateActivity(id, data);
        // End the activity after a short moment so the completion state
        // is visible briefly on the lock screen.
        await Future.delayed(const Duration(seconds: 4));
        await endActivity();
        return;
      case TimerIdle():
        await endActivity();
        return;
    }

    await _plugin.updateActivity(id, data);
  }

  /// End the Live Activity (called on reset or after completion).
  Future<void> endActivity() async {
    if (!Platform.isIOS) return;
    final id = _activityId;
    if (id == null) return;
    _activityId = null;
    try {
      await _plugin.endActivity(id);
    } catch (_) {
      // Activity may already be ended by the system.
    }
  }

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

  /// Builds the data map sent to the Widget Extension via shared UserDefaults.
  ///
  /// Key names MUST match the keys read in the SwiftUI widget:
  /// `ios/SilverTimerWidget/SilverTimerLiveActivityView.swift`
  Map<String, dynamic> _buildData({
    required DateTime? endTimestamp,
    required double remainingSeconds,
    required double totalDuration,
    required bool isPaused,
    required bool isCompleted,
    required double? nextCleaningIn,
    required double targetPpm,
  }) {
    return {
      // Unix timestamp (seconds) when timer ends — used by SwiftUI .timer style.
      // null when paused.
      'endTimestamp': endTimestamp != null
          ? endTimestamp.millisecondsSinceEpoch / 1000.0
          : null,
      // Remaining seconds, used for the paused static display and progress bar.
      'remainingSeconds': remainingSeconds,
      // Total session duration in seconds, used for the progress arc.
      'totalDuration': totalDuration,
      'isPaused': isPaused,
      'isCompleted': isCompleted,
      // Seconds until next electrode cleaning alarm; null when none scheduled.
      'nextCleaningIn': nextCleaningIn,
      'targetPpm': targetPpm,
    };
  }
}
