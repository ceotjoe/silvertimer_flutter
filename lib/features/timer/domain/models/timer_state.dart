// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_state.freezed.dart';

@freezed
sealed class TimerState with _$TimerState {
  const factory TimerState.idle() = TimerIdle;

  const factory TimerState.running({
    required Duration totalDuration,
    required Duration elapsed,
    required DateTime startedAt,
  }) = TimerRunning;

  const factory TimerState.paused({
    required Duration totalDuration,
    required Duration elapsed,
  }) = TimerPaused;

  const factory TimerState.completed({
    required Duration totalDuration,
  }) = TimerCompleted;
}
