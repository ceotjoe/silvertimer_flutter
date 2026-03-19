// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

/// Application-wide constants.
class AppConstants {
  AppConstants._();

  /// Notification channel ID for Android — general (cleaning reminders).
  static const String notificationChannelId = 'silvertimer_channel';

  /// Notification channel name for Android — general.
  static const String notificationChannelName = 'SilverTimer';

  /// Notification channel ID for Android — high-priority alarm (timer done).
  /// Separate channel so it can use AudioAttributesUsage.alarm and Importance.max.
  static const String alarmChannelId = 'silvertimer_alarm';

  /// Notification channel name for Android — alarm.
  static const String alarmChannelName = 'SilverTimer Alarm';

  /// Flutter asset path for the alarm sound used for foreground playback.
  static const String alarmSoundAsset = 'assets/sounds/alarm.mp3';

  /// Android res/raw filename (without extension) for the alarm notification sound.
  static const String alarmSoundRaw = 'alarm';

  /// Notification ID used for the timer completion notification
  static const int timerCompleteNotificationId = 1;

  /// Notification ID used for the scheduled fallback notification
  static const int timerScheduledNotificationId = 2;

  /// Maximum safe current in milliamps
  static const double maxSafeCurrentMa = 5000.0;

  /// Default target PPM for new sessions
  static const double defaultTargetPpm = 10.0;

  /// SharedPreferences keys
  static const String prefThemeMode = 'theme_mode';
  static const String prefDefaultVolumeUnit = 'default_volume_unit';
  static const String prefNotificationsEnabled = 'notifications_enabled';
  static const String prefDefaultPpm = 'default_ppm';
  static const String prefDefaultCurrentMa = 'default_current_ma';
  static const String prefTimerStartedAt = 'timer_started_at';
  static const String prefTimerTotalSeconds = 'timer_total_seconds';

  /// Base notification ID for electrode cleaning alarms (IDs 100–199).
  static const int cleaningAlarmBaseNotificationId = 100;

  /// SharedPreferences key: whether electrode cleaning alarms are enabled.
  static const String prefCleaningAlarmsEnabled = 'cleaning_alarms_enabled';

  /// SharedPreferences key: cleaning alarm interval in minutes.
  static const String prefCleaningIntervalMinutes = 'cleaning_interval_minutes';

  /// SharedPreferences keys for last-used calculator values.
  static const String prefLastVolumeValue = 'last_volume_value';
  static const String prefLastVolumeUnit = 'last_volume_unit';
  static const String prefLastTargetPpm = 'last_target_ppm';
}
