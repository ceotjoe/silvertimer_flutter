import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silvertimer_flutter/core/constants/app_constants.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculator_input.dart';
import 'package:silvertimer_flutter/features/settings/domain/models/app_settings.dart';

part 'settings_repository.g.dart';

class SettingsRepository {
  const SettingsRepository(this._prefs);

  final SharedPreferences _prefs;

  AppSettings load() {
    final themeIndex = _prefs.getInt(AppConstants.prefThemeMode) ?? 0;
    final volumeUnitIndex = _prefs.getInt(AppConstants.prefDefaultVolumeUnit) ?? 0;
    final notificationsEnabled =
        _prefs.getBool(AppConstants.prefNotificationsEnabled) ?? true;
    final defaultPpm = _prefs.getDouble(AppConstants.prefDefaultPpm) ?? 10.0;

    return AppSettings(
      themeMode: ThemeMode.values[themeIndex.clamp(0, ThemeMode.values.length - 1)],
      defaultVolumeUnit: VolumeUnit.values[volumeUnitIndex.clamp(0, VolumeUnit.values.length - 1)],
      notificationsEnabled: notificationsEnabled,
      defaultPpm: defaultPpm,
    );
  }

  Future<void> saveThemeMode(ThemeMode mode) async {
    await _prefs.setInt(AppConstants.prefThemeMode, mode.index);
  }

  Future<void> saveDefaultVolumeUnit(VolumeUnit unit) async {
    await _prefs.setInt(AppConstants.prefDefaultVolumeUnit, unit.index);
  }

  Future<void> saveNotificationsEnabled(bool enabled) async {
    await _prefs.setBool(AppConstants.prefNotificationsEnabled, enabled);
  }

  Future<void> saveDefaultPpm(double ppm) async {
    await _prefs.setDouble(AppConstants.prefDefaultPpm, ppm);
  }
}

@riverpod
SettingsRepository settingsRepository(Ref ref) {
  throw UnimplementedError('settingsRepository must be overridden in ProviderScope');
}
