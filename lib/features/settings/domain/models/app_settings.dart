import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculator_input.dart';

part 'app_settings.freezed.dart';

@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(VolumeUnit.ml) VolumeUnit defaultVolumeUnit,
    @Default(true) bool notificationsEnabled,
    @Default(10.0) double defaultPpm,
    @Default(10.0) double defaultCurrentMa,
    @Default(true) bool cleaningAlarmsEnabled,
    @Default(10) int cleaningIntervalMinutes,
  }) = _AppSettings;
}
