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
    _initialized = true;
  }

  Future<bool> requestPermission() async {
    if (UniversalPlatform.isWeb || !_initialized) return false;

    if (UniversalPlatform.isAndroid) {
      final androidPlugin =
          _plugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      return await androidPlugin?.requestNotificationsPermission() ?? false;
    }

    if (UniversalPlatform.isIOS) {
      final iosPlugin =
          _plugin.resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>();
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

  /// Shows an immediate completion notification.
  Future<void> showCompletionNotification(String title, String body) async {
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
        android: _androidDetails(''),
        iOS: iosDetails,
      ),
    );
  }

  /// Schedules a notification to fire at [fireAt] as a reliable OS-level fallback.
  /// This fires even if the app is killed by the OS.
  Future<void> scheduleCompletionNotification(
    DateTime fireAt,
    String title,
    String body,
  ) async {
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
        android: _androidDetails(''),
        iOS: iosDetails,
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  /// Shows an immediate cleaning alarm notification.
  /// [alarmNumber] is 1-based and used to generate a unique notification ID.
  Future<void> showCleaningAlarmNotification(
    int alarmNumber,
    String title,
    String body,
  ) async {
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
        android: _androidDetails(''),
        iOS: iosDetails,
      ),
    );
  }

  /// Schedules a cleaning alarm notification at [fireAt].
  /// [alarmNumber] is 1-based and determines the unique notification ID.
  Future<void> scheduleCleaningNotification(
    DateTime fireAt,
    int alarmNumber,
    String title,
    String body,
  ) async {
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
        android: _androidDetails(''),
        iOS: iosDetails,
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  /// Cancels all pending/delivered notifications.
  Future<void> cancelAll() async {
    if (UniversalPlatform.isWeb || !_initialized) return;
    await _plugin.cancelAll();
  }
}

@riverpod
NotificationService notificationService(Ref ref) => NotificationService();
