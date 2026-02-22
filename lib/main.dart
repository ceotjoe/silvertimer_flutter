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

  // Initialize notification service
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
}
