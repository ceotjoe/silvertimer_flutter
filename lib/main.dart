// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silvertimer_flutter/app.dart';
import 'package:silvertimer_flutter/features/settings/data/settings_repository.dart';
import 'package:silvertimer_flutter/features/timer/data/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();

  // Initialize notification service (sets up plugin + checks exact-alarm capability).
  final notificationService = NotificationService();
  await notificationService.initialize();

  runApp(
    ProviderScope(
      overrides: [
        // Provide SharedPreferences instance to SettingsRepository
        settingsRepositoryProvider.overrideWithValue(
          SettingsRepository(prefs),
        ),
        // Provide initialized NotificationService
        notificationServiceProvider.overrideWithValue(notificationService),
      ],
      child: const SilverTimerApp(),
    ),
  );

  // Request notification + exact-alarm permissions after the first frame so the
  // system dialogs appear on top of the fully rendered UI.
  // On Android 13+ this shows the POST_NOTIFICATIONS dialog.
  // On Android 12+ this opens "Alarms & Reminders" settings if not yet granted.
  // On iOS this shows the standard notification permission prompt.
  WidgetsBinding.instance.addPostFrameCallback((_) {
    notificationService.requestPermission();
  });
}
