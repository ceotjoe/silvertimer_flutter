import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculation_result.dart';
import 'package:silvertimer_flutter/features/history/domain/models/session_record.dart';
import 'package:silvertimer_flutter/features/history/presentation/history_controller.dart';
import 'package:silvertimer_flutter/features/settings/presentation/settings_controller.dart';
import 'package:silvertimer_flutter/features/timer/data/notification_service.dart';
import 'package:silvertimer_flutter/features/timer/domain/models/timer_state.dart';

part 'timer_controller.g.dart';

@Riverpod(keepAlive: true)
class TimerController extends _$TimerController {
  StreamSubscription<int>? _tickerSub;
  CalculationResult? _lastResult;

  // --- Electrode cleaning alarm state ---
  /// Sorted list of elapsed Durations at which cleaning alarms fire.
  /// Computed once on start() from interval setting and total duration.
  final List<Duration> _cleaningAlarmSchedule = [];

  /// Elapsed Durations at which alarms have already fired (subset of schedule).
  final List<Duration> _cleaningAlarmsFiredAt = [];

  /// Index into _cleaningAlarmSchedule pointing to the next alarm to fire.
  int _nextCleaningIndex = 0;
  // --------------------------------------

  @override
  TimerState build() => const TimerState.idle();

  /// Public read-only view of the full cleaning alarm schedule (for providers).
  List<Duration> get cleaningAlarmSchedule =>
      List.unmodifiable(_cleaningAlarmSchedule);

  /// Public read-only view of alarms that have already fired (for providers).
  List<Duration> get cleaningAlarmsFiredAt =>
      List.unmodifiable(_cleaningAlarmsFiredAt);

  /// Load a calculation result and prepare the timer.
  void loadCalculation(CalculationResult result) {
    _cancelTicker();
    _lastResult = result;
    state = TimerState.paused(
      totalDuration: result.calculatedDuration,
      elapsed: Duration.zero,
    );
  }

  /// Start or resume the timer.
  void start() {
    final current = state;
    if (current is! TimerPaused) return;

    final total = current.totalDuration;
    final alreadyElapsed = current.elapsed;
    final startedAt = DateTime.now().subtract(alreadyElapsed);

    state = TimerState.running(
      totalDuration: total,
      elapsed: alreadyElapsed,
      startedAt: startedAt,
    );

    // Schedule the OS-level completion fallback notification
    final completesAt = startedAt.add(total);
    ref.read(notificationServiceProvider).scheduleCompletionNotification(completesAt);

    // Build cleaning alarm schedule and pre-schedule all OS notifications
    _buildCleaningSchedule(
      total: total,
      alreadyElapsed: alreadyElapsed,
      startedAt: startedAt,
    );

    // Start the 1-second ticker
    _tickerSub = Stream.periodic(
      const Duration(seconds: 1),
      (tick) => tick,
    ).listen((_) => _onTick());
  }

  /// Pause the timer.
  void pause() {
    final current = state;
    if (current is! TimerRunning) return;

    _cancelTicker();
    // cancelAll() cancels both the completion and all cleaning alarm notifications.
    // They are rescheduled on the next start() call.
    ref.read(notificationServiceProvider).cancelAll();

    state = TimerState.paused(
      totalDuration: current.totalDuration,
      elapsed: current.elapsed,
    );
  }

  /// Reset the timer back to idle.
  void reset() {
    _cancelTicker();
    ref.read(notificationServiceProvider).cancelAll();
    _lastResult = null;
    _cleaningAlarmSchedule.clear();
    _cleaningAlarmsFiredAt.clear();
    _nextCleaningIndex = 0;
    // Also reset the alarm counter so a new session starts from 0
    ref.read(_cleaningAlarmCountProvider.notifier).state = 0;
    state = const TimerState.idle();
  }

  /// Called when the app goes to background. No action needed — startedAt
  /// on TimerRunning already anchors to the wall clock.
  void onAppPaused() {}

  /// Called when the app resumes from background. Recalculates elapsed from
  /// the wall clock to recover from ticker throttling.
  void onAppResumed() {
    final current = state;
    if (current is! TimerRunning) return;

    final realElapsed = DateTime.now().difference(current.startedAt);
    if (realElapsed >= current.totalDuration) {
      _complete(current.totalDuration);
    } else {
      // Silently mark any cleaning alarms that fired while backgrounded.
      // The OS-scheduled notifications already delivered them; we just update
      // the fired list so the ring markers reflect reality.
      while (_nextCleaningIndex < _cleaningAlarmSchedule.length &&
          _cleaningAlarmSchedule[_nextCleaningIndex] <= realElapsed) {
        _cleaningAlarmsFiredAt.add(_cleaningAlarmSchedule[_nextCleaningIndex]);
        _nextCleaningIndex++;
      }

      state = TimerRunning(
        totalDuration: current.totalDuration,
        elapsed: realElapsed,
        startedAt: current.startedAt,
      );
    }
  }

  void _onTick() {
    final current = state;
    if (current is! TimerRunning) return;

    final realElapsed = DateTime.now().difference(current.startedAt);

    if (realElapsed >= current.totalDuration) {
      _complete(current.totalDuration);
    } else {
      _checkCleaningAlarm(realElapsed);

      state = TimerRunning(
        totalDuration: current.totalDuration,
        elapsed: realElapsed,
        startedAt: current.startedAt,
      );
    }
  }

  void _complete(Duration total) {
    _cancelTicker();

    // Fire immediate in-app completion notification
    ref.read(notificationServiceProvider).showCompletionNotification();

    // Save session to history
    final result = _lastResult;
    if (result != null) {
      ref.read(historyControllerProvider.notifier).addSession(
            SessionRecord(
              id: 0,
              volumeLiters: result.input.volumeInLiters,
              currentMilliamps: result.input.currentMilliamps,
              targetPpm: result.input.targetPpm,
              durationSeconds: total.inSeconds,
              completedAt: DateTime.now(),
              completed: true,
            ),
          );
    }

    state = TimerState.completed(totalDuration: total);
  }

  void _cancelTicker() {
    _tickerSub?.cancel();
    _tickerSub = null;
  }

  /// Builds the cleaning alarm schedule and pre-schedules all future OS notifications.
  void _buildCleaningSchedule({
    required Duration total,
    required Duration alreadyElapsed,
    required DateTime startedAt,
  }) {
    _cleaningAlarmSchedule.clear();
    _nextCleaningIndex = 0;

    final settings = ref.read(settingsControllerProvider);
    final enabled = settings.cleaningAlarmsEnabled &&
        settings.notificationsEnabled &&
        settings.cleaningIntervalMinutes > 0;

    if (!enabled) return;

    final interval = Duration(minutes: settings.cleaningIntervalMinutes);
    final notificationService = ref.read(notificationServiceProvider);

    // Build schedule: alarm at every multiple of interval strictly within total
    var alarmAt = interval;
    var alarmNumber = 1;
    while (alarmAt < total) {
      _cleaningAlarmSchedule.add(alarmAt);

      // Only pre-schedule OS notification for alarms that haven't fired yet
      if (alarmAt > alreadyElapsed) {
        final fireAt = startedAt.add(alarmAt);
        notificationService.scheduleCleaningNotification(fireAt, alarmNumber);
      }

      alarmAt += interval;
      alarmNumber++;
    }

    // Resume after pause: skip past alarms already fired in this session
    _nextCleaningIndex = _cleaningAlarmsFiredAt.length;
  }

  /// Checks whether the next cleaning alarm has been reached and fires it.
  void _checkCleaningAlarm(Duration elapsed) {
    if (_nextCleaningIndex >= _cleaningAlarmSchedule.length) return;

    final nextAlarmAt = _cleaningAlarmSchedule[_nextCleaningIndex];
    if (elapsed < nextAlarmAt) return;

    final alarmNumber = _nextCleaningIndex + 1; // 1-based
    _cleaningAlarmsFiredAt.add(nextAlarmAt);
    _nextCleaningIndex++;

    // Fire immediate in-app notification (plays sound even when app is in foreground)
    ref.read(notificationServiceProvider).showCleaningAlarmNotification(alarmNumber);

    // Signal the TimerScreen SnackBar by setting the current alarm number
    ref.read(_cleaningAlarmCountProvider.notifier).state = alarmNumber;
  }
}

// ---------------------------------------------------------------------------
// Supporting providers
// ---------------------------------------------------------------------------

/// Private counter — set to the 1-based alarm number each time one fires.
/// Kept alive to match the TimerController lifetime.
final _cleaningAlarmCountProvider = StateProvider<int>(
  (ref) => 0,
  name: '_cleaningAlarmCount',
);

/// Public provider: the 1-based number of the most recently fired cleaning alarm
/// (0 = no alarm fired yet). TimerScreen listens to this to show the SnackBar.
@riverpod
int cleaningAlarmCount(Ref ref) {
  return ref.watch(_cleaningAlarmCountProvider);
}

/// Public provider: time remaining until the next electrode cleaning alarm,
/// or `null` when there is no schedule or all alarms have already fired.
/// Rebuilds every second because it watches timerControllerProvider.
@riverpod
Duration? nextCleaningIn(Ref ref) {
  final timerState = ref.watch(timerControllerProvider);

  final elapsed = switch (timerState) {
    TimerRunning(:final elapsed) => elapsed,
    TimerPaused(:final elapsed) => elapsed,
    _ => null,
  };

  if (elapsed == null) return null;

  final ctrl = ref.watch(timerControllerProvider.notifier);
  final schedule = ctrl.cleaningAlarmSchedule;
  final firedCount = ctrl.cleaningAlarmsFiredAt.length;

  if (firedCount >= schedule.length) return null; // all alarms done

  final nextAlarmAt = schedule[firedCount];
  final remaining = nextAlarmAt - elapsed;
  return remaining.isNegative ? Duration.zero : remaining;
}

/// Public provider: normalized (0.0–1.0) ring positions for all cleaning alarm marks.
/// Returns `(pending: [...], passed: [...])` for the CircularTimer painter.
/// Rebuilds every second because it watches timerControllerProvider.
@riverpod
({List<double> pending, List<double> passed}) cleaningMarkers(Ref ref) {
  final timerState = ref.watch(timerControllerProvider);

  final total = switch (timerState) {
    TimerRunning(:final totalDuration) => totalDuration,
    TimerPaused(:final totalDuration) => totalDuration,
    TimerCompleted(:final totalDuration) => totalDuration,
    TimerIdle() => null,
  };

  if (total == null || total.inSeconds == 0) {
    return (pending: const [], passed: const []);
  }

  final ctrl = ref.watch(timerControllerProvider.notifier);
  double toPos(Duration d) => (d.inSeconds / total.inSeconds).clamp(0.0, 1.0);

  final firedCount = ctrl.cleaningAlarmsFiredAt.length;
  final allPositions = ctrl.cleaningAlarmSchedule.map(toPos).toList();

  return (
    passed: allPositions.sublist(0, firedCount),
    pending: allPositions.sublist(firedCount),
  );
}
