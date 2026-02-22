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
  static const String prefTimerStartedAt = 'timer_started_at';
  static const String prefTimerTotalSeconds = 'timer_total_seconds';
}
