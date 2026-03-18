import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silvertimer_flutter/core/constants/app_constants.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:universal_platform/universal_platform.dart';

part 'notification_service.g.dart';

/// Vibration pattern for the alarm: 0 ms delay, then 600/200/600/200/600 ms on/off.
final _alarmVibration = Int64List.fromList([0, 600, 200, 600, 200, 600]);

/// Vibration pattern for cleaning reminders: gentler single pulse.
final _cleaningVibration = Int64List.fromList([0, 400]);

class NotificationService {
  NotificationService();

  final _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  // Android 12+ (API 31+): whether SCHEDULE_EXACT_ALARM is granted.
  // Falls back to inexact scheduling when false.
  bool _canScheduleExact = true;

  Future<void> initialize() async {
    if (UniversalPlatform.isWeb) return;

    tz.initializeTimeZones();

    const androidSettings = AndroidInitializationSettings('@drawable/ic_notification');
    const darwinSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: darwinSettings,
        macOS: darwinSettings,
      ),
    );

    if (UniversalPlatform.isAndroid) {
      final androidPlugin =
          _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      _canScheduleExact = await androidPlugin?.canScheduleExactNotifications() ?? true;
    }

    _initialized = true;
  }

  Future<bool> requestPermission() async {
    if (UniversalPlatform.isWeb || !_initialized) return false;

    if (UniversalPlatform.isAndroid) {
      final androidPlugin =
          _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

      final granted = await androidPlugin?.requestNotificationsPermission() ?? false;

      // Request SCHEDULE_EXACT_ALARM — opens "Alarms & Reminders" settings on Android 12+.
      await androidPlugin?.requestExactAlarmsPermission();
      _canScheduleExact = await androidPlugin?.canScheduleExactNotifications() ?? true;

      return granted;
    }

    if (UniversalPlatform.isIOS) {
      final iosPlugin =
          _plugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();
      return await iosPlugin?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          ) ??
          false;
    }

    if (UniversalPlatform.isMacOS) {
      final macPlugin =
          _plugin.resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>();
      return await macPlugin?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          ) ??
          false;
    }

    return false;
  }

  // ---------------------------------------------------------------------------
  // Android notification details
  // ---------------------------------------------------------------------------

  /// Full alarm-level details: alarm audio stream, max importance, full-screen
  /// intent, strong vibration. Used for timer completion.
  AndroidNotificationDetails _androidAlarmDetails(String channelDescription) =>
      AndroidNotificationDetails(
        AppConstants.alarmChannelId,
        AppConstants.alarmChannelName,
        channelDescription: channelDescription,
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
        sound: const RawResourceAndroidNotificationSound(AppConstants.alarmSoundRaw),
        audioAttributesUsage: AudioAttributesUsage.alarm,
        fullScreenIntent: true,
        category: AndroidNotificationCategory.alarm,
        vibrationPattern: _alarmVibration,
        enableVibration: true,
      );

  /// Standard high-priority details for cleaning reminders.
  AndroidNotificationDetails _androidDetails(String channelDescription) =>
      AndroidNotificationDetails(
        AppConstants.notificationChannelId,
        AppConstants.notificationChannelName,
        channelDescription: channelDescription,
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        vibrationPattern: _cleaningVibration,
        enableVibration: true,
      );

  // ---------------------------------------------------------------------------
  // Schedule mode
  // ---------------------------------------------------------------------------

  /// For the completion alarm: use alarmClock (AlarmManager.setAlarmClock) which
  /// bypasses Doze/battery optimisation entirely. Falls back to inexact if the
  /// exact-alarm permission was not granted.
  AndroidScheduleMode get _alarmScheduleMode =>
      _canScheduleExact ? AndroidScheduleMode.alarmClock : AndroidScheduleMode.inexactAllowWhileIdle;

  /// For cleaning reminders: exactAllowWhileIdle is sufficient.
  AndroidScheduleMode get _scheduleMode =>
      _canScheduleExact
          ? AndroidScheduleMode.exactAllowWhileIdle
          : AndroidScheduleMode.inexactAllowWhileIdle;

  // ---------------------------------------------------------------------------
  // Completion notification (timer done)
  // ---------------------------------------------------------------------------

  /// Shows an immediate alarm-level notification when the app is in the foreground.
  Future<void> showCompletionNotification(
    String title,
    String body, {
    String channelDescription = '',
  }) async {
    if (UniversalPlatform.isWeb || !_initialized) return;

    // timeSensitive: breaks through Focus/DND on iOS.
    const darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      interruptionLevel: InterruptionLevel.timeSensitive,
    );

    await _plugin.show(
      AppConstants.timerCompleteNotificationId,
      title,
      body,
      NotificationDetails(
        android: _androidAlarmDetails(channelDescription),
        iOS: darwinDetails,
        macOS: darwinDetails,
      ),
    );
  }

  /// Schedules an alarm-level OS notification at [fireAt].
  /// Fires even if the app is backgrounded or killed.
  /// Uses AndroidScheduleMode.alarmClock — bypasses all Android battery
  /// optimisations and Doze mode, identical to the system alarm clock.
  Future<void> scheduleCompletionNotification(
    DateTime fireAt,
    String title,
    String body, {
    String channelDescription = '',
  }) async {
    if (UniversalPlatform.isWeb || !_initialized) return;

    final tzFireAt = tz.TZDateTime.from(fireAt, tz.local);

    const darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      interruptionLevel: InterruptionLevel.timeSensitive,
    );

    await _plugin.zonedSchedule(
      AppConstants.timerScheduledNotificationId,
      title,
      body,
      tzFireAt,
      NotificationDetails(
        android: _androidAlarmDetails(channelDescription),
        iOS: darwinDetails,
        macOS: darwinDetails,
      ),
      androidScheduleMode: _alarmScheduleMode,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  // ---------------------------------------------------------------------------
  // Cleaning alarm notifications
  // ---------------------------------------------------------------------------

  /// Shows an immediate cleaning reminder notification (app in foreground).
  Future<void> showCleaningAlarmNotification(
    int alarmNumber,
    String title,
    String body, {
    String channelDescription = '',
  }) async {
    if (UniversalPlatform.isWeb || !_initialized) return;

    const darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: false,
      presentSound: true,
      interruptionLevel: InterruptionLevel.timeSensitive,
    );

    await _plugin.show(
      AppConstants.cleaningAlarmBaseNotificationId + alarmNumber,
      title,
      body,
      NotificationDetails(
        android: _androidDetails(channelDescription),
        iOS: darwinDetails,
        macOS: darwinDetails,
      ),
    );
  }

  /// Schedules a cleaning reminder notification at [fireAt].
  Future<void> scheduleCleaningNotification(
    DateTime fireAt,
    int alarmNumber,
    String title,
    String body, {
    String channelDescription = '',
  }) async {
    if (UniversalPlatform.isWeb || !_initialized) return;

    final tzFireAt = tz.TZDateTime.from(fireAt, tz.local);
    final notifId = AppConstants.cleaningAlarmBaseNotificationId + alarmNumber;

    const darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: false,
      presentSound: true,
      interruptionLevel: InterruptionLevel.timeSensitive,
    );

    await _plugin.zonedSchedule(
      notifId,
      title,
      body,
      tzFireAt,
      NotificationDetails(
        android: _androidDetails(channelDescription),
        iOS: darwinDetails,
        macOS: darwinDetails,
      ),
      androidScheduleMode: _scheduleMode,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  // ---------------------------------------------------------------------------

  /// Cancels all pending/delivered notifications.
  Future<void> cancelAll() async {
    if (UniversalPlatform.isWeb || !_initialized) return;
    await _plugin.cancelAll();
  }
}

// keepAlive: true — must never be disposed; losing _initialized/_canScheduleExact
// state would silently break all background notifications.
@Riverpod(keepAlive: true)
NotificationService notificationService(Ref ref) => NotificationService();
