// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_record.freezed.dart';
part 'session_record.g.dart';

@freezed
abstract class SessionRecord with _$SessionRecord {
  const factory SessionRecord({
    required int id,
    required double volumeLiters,
    required double currentMilliamps,
    required double targetPpm,
    required int durationSeconds,
    required DateTime completedAt,
    @Default(false) bool completed,
  }) = _SessionRecord;

  factory SessionRecord.fromJson(Map<String, dynamic> json) =>
      _$SessionRecordFromJson(json);
}
