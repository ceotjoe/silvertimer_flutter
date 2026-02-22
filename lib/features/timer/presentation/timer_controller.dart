import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculation_result.dart';
import 'package:silvertimer_flutter/features/history/domain/models/session_record.dart';
import 'package:silvertimer_flutter/features/history/presentation/history_controller.dart';
import 'package:silvertimer_flutter/features/timer/data/notification_service.dart';
import 'package:silvertimer_flutter/features/timer/domain/models/timer_state.dart';

part 'timer_controller.g.dart';

@riverpod
class TimerController extends _$TimerController {
  StreamSubscription<int>? _tickerSub;
  CalculationResult? _lastResult;

  @override
  TimerState build() => const TimerState.idle();

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

    // Schedule the OS-level fallback notification
    final completesAt = startedAt.add(total);
    ref.read(notificationServiceProvider).scheduleCompletionNotification(completesAt);

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
    // Cancel the scheduled fallback notification since we're pausing
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
    state = const TimerState.idle();
  }

  /// Called when the app resumes from background. Recalculates elapsed
  /// from the wall-clock difference to recover from ticker throttling.
  void onAppPaused() {
    // startedAt on TimerRunning already captures the wall clock;
    // onAppResumed will reconcile elapsed on wake.
  }

  void onAppResumed() {
    final current = state;
    if (current is! TimerRunning) return;

    final realElapsed = DateTime.now().difference(current.startedAt);
    if (realElapsed >= current.totalDuration) {
      _complete(current.totalDuration);
    } else {
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
      state = TimerRunning(
        totalDuration: current.totalDuration,
        elapsed: realElapsed,
        startedAt: current.startedAt,
      );
    }
  }

  void _complete(Duration total) {
    _cancelTicker();

    // Fire immediate in-app notification
    ref.read(notificationServiceProvider).showCompletionNotification();

    // Save session to history
    final result = _lastResult;
    if (result != null) {
      ref.read(historyControllerProvider.notifier).addSession(
            SessionRecord(
              id: 0, // auto-assigned by DB
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
}
