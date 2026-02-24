import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silvertimer_flutter/core/constants/app_constants.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:universal_platform/universal_platform.dart';

part 'notification_service.g.dart';

class NotificationService {
  NotificationService();

  final _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  // Android 12+ (API 31+): whether the user has granted SCHEDULE_EXACT_ALARM.
  // Falls back to inexact scheduling when false.
  bool _canScheduleExact = true;

  Future<void> initialize() async {
    if (UniversalPlatform.isWeb) return;

    tz.initializeTimeZones();

    const androidSettings = AndroidInitializationSettings('@drawable/ic_notification');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      const InitializationSettings(android: androidSettings, iOS: iosSettings),
    );

    // On Android 12+, check whether exact alarms are already permitted.
    if (UniversalPlatform.isAndroid) {
      final androidPlugin = _plugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      _canScheduleExact = await androidPlugin?.canScheduleExactNotifications() ?? true;
    }

    _initialized = true;
  }

  Future<bool> requestPermission() async {
    if (UniversalPlatform.isWeb || !_initialized) return false;

    if (UniversalPlatform.isAndroid) {
      final androidPlugin = _plugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

      // 1. Request POST_NOTIFICATIONS (Android 13+).
      final granted = await androidPlugin?.requestNotificationsPermission() ?? false;

      // 2. Request SCHEDULE_EXACT_ALARM (Android 12+).
      //    Opens the system "Alarms & Reminders" settings page if not yet granted.
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

    return false;
  }

  AndroidNotificationDetails _androidDetails(String channelDescription) =>
      AndroidNotificationDetails(
        AppConstants.notificationChannelId,
        AppConstants.notificationChannelName,
        channelDescription: channelDescription,
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
      );

  /// Exact scheduling when permitted, inexact (~1 min tolerance) as fallback.
  AndroidScheduleMode get _scheduleMode => _canScheduleExact
      ? AndroidScheduleMode.exactAllowWhileIdle
      : AndroidScheduleMode.inexactAllowWhileIdle;

  /// Shows an immediate completion notification (app is in foreground).
  Future<void> showCompletionNotification(
    String title,
    String body, {
    String channelDescription = '',
  }) async {
    if (UniversalPlatform.isWeb || !_initialized) return;

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    await _plugin.show(
      AppConstants.timerCompleteNotificationId,
      title,
      body,
      NotificationDetails(
        android: _androidDetails(channelDescription),
        iOS: iosDetails,
      ),
    );
  }

  /// Schedules a notification to fire at [fireAt] as a reliable OS-level alarm.
  /// Fires even if the app is backgrounded or killed. Uses exact alarms when
  /// permitted, falling back to inexact when the user has not granted the permission.
  Future<void> scheduleCompletionNotification(
    DateTime fireAt,
    String title,
    String body, {
    String channelDescription = '',
  }) async {
    if (UniversalPlatform.isWeb || !_initialized) return;

    final tzFireAt = tz.TZDateTime.from(fireAt, tz.local);

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    await _plugin.zonedSchedule(
      AppConstants.timerScheduledNotificationId,
      title,
      body,
      tzFireAt,
      NotificationDetails(
        android: _androidDetails(channelDescription),
        iOS: iosDetails,
      ),
      androidScheduleMode: _scheduleMode,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  /// Shows an immediate cleaning alarm notification (app is in foreground).
  Future<void> showCleaningAlarmNotification(
    int alarmNumber,
    String title,
    String body, {
    String channelDescription = '',
  }) async {
    if (UniversalPlatform.isWeb || !_initialized) return;

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: false,
      presentSound: true,
    );

    await _plugin.show(
      AppConstants.cleaningAlarmBaseNotificationId + alarmNumber,
      title,
      body,
      NotificationDetails(
        android: _androidDetails(channelDescription),
        iOS: iosDetails,
      ),
    );
  }

  /// Schedules a cleaning alarm notification at [fireAt].
  /// Uses exact alarms when permitted, falling back to inexact.
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

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: false,
      presentSound: true,
    );

    await _plugin.zonedSchedule(
      notifId,
      title,
      body,
      tzFireAt,
      NotificationDetails(
        android: _androidDetails(channelDescription),
        iOS: iosDetails,
      ),
      androidScheduleMode: _scheduleMode,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  /// Cancels all pending/delivered notifications.
  Future<void> cancelAll() async {
    if (UniversalPlatform.isWeb || !_initialized) return;
    await _plugin.cancelAll();
  }
}

// keepAlive: true — NotificationService must never be disposed while the app
// is running; losing _initialized/_canScheduleExact state would silently
// break all background notifications.
@Riverpod(keepAlive: true)
NotificationService notificationService(Ref ref) => NotificationService();
