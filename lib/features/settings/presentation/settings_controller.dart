import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculator_input.dart';
import 'package:silvertimer_flutter/features/settings/data/settings_repository.dart';
import 'package:silvertimer_flutter/features/settings/domain/models/app_settings.dart';

part 'settings_controller.g.dart';

@riverpod
class SettingsController extends _$SettingsController {
  @override
  AppSettings build() {
    return ref.watch(settingsRepositoryProvider).load();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await ref.read(settingsRepositoryProvider).saveThemeMode(mode);
    state = state.copyWith(themeMode: mode);
  }

  Future<void> setDefaultVolumeUnit(VolumeUnit unit) async {
    await ref.read(settingsRepositoryProvider).saveDefaultVolumeUnit(unit);
    state = state.copyWith(defaultVolumeUnit: unit);
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    await ref.read(settingsRepositoryProvider).saveNotificationsEnabled(enabled);
    state = state.copyWith(notificationsEnabled: enabled);
  }

  Future<void> setDefaultPpm(double ppm) async {
    await ref.read(settingsRepositoryProvider).saveDefaultPpm(ppm);
    state = state.copyWith(defaultPpm: ppm);
  }
}

/// Derived provider — consumed directly by MaterialApp for live theme switching.
@riverpod
ThemeMode themeMode(Ref ref) {
  return ref.watch(settingsControllerProvider).themeMode;
}
