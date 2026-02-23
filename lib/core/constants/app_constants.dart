/// Application-wide constants.
class AppConstants {
  AppConstants._();

  /// Notification channel ID for Android
  static const String notificationChannelId = 'silvertimer_channel';

  /// Notification channel name for Android
  static const String notificationChannelName = 'SilverTimer';

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
