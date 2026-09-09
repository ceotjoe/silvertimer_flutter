// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silvertimer_flutter/core/constants/app_constants.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculation_result.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculator_input.dart';
import 'package:silvertimer_flutter/features/devices/domain/models/device.dart';
import 'package:silvertimer_flutter/features/settings/data/settings_repository.dart';
import 'package:silvertimer_flutter/features/timer/data/notification_service.dart';
import 'package:silvertimer_flutter/features/timer/data/notification_strings.dart';
import 'package:silvertimer_flutter/features/timer/presentation/timer_controller.dart';

/// Records calls instead of touching platform channels.
class FakeNotificationService extends NotificationService {
  final List<DateTime> cleaningScheduled = [];
  int completionScheduledCount = 0;

  @override
  Future<void> scheduleCleaningNotification(
    DateTime fireAt,
    int alarmNumber,
    String title,
    String body, {
    String channelDescription = '',
  }) async {
    cleaningScheduled.add(fireAt);
  }

  @override
  Future<void> scheduleCompletionNotification(
    DateTime fireAt,
    String title,
    String body, {
    String channelDescription = '',
  }) async {
    completionScheduledCount++;
  }

  @override
  Future<void> cancelAll() async {}
}

const _strings = NotificationStrings(
  completeTitle: 'Done',
  completeBody: 'Complete',
  cleanTitle: 'Clean',
  cleanBodyForAlarm: _cleanBody,
  channelDescription: 'test channel',
);

String _cleanBody(int n) => 'Clean #$n';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // TimerController eagerly constructs an audioplayers AudioPlayer for the
  // completion alarm sound; stub its platform channels so construction
  // doesn't throw MissingPluginException in a plain unit test.
  setUpAll(() {
    for (final channelName in ['xyz.luan/audioplayers', 'xyz.luan/audioplayers.global']) {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
        MethodChannel(channelName),
        (call) async => null,
      );
    }
  });

  Future<ProviderContainer> buildContainer({int cleaningIntervalMinutes = 1}) async {
    SharedPreferences.setMockInitialValues({
      AppConstants.prefCleaningIntervalMinutes: cleaningIntervalMinutes,
    });
    final prefs = await SharedPreferences.getInstance();
    final container = ProviderContainer(
      overrides: [
        settingsRepositoryProvider.overrideWithValue(SettingsRepository(prefs)),
        notificationServiceProvider.overrideWithValue(FakeNotificationService()),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  test('auto-polarity device skips cleaning alarms but keeps completion notification', () async {
    final container = await buildContainer();
    final fakeNotifications =
        container.read(notificationServiceProvider) as FakeNotificationService;

    const device = Device(
      id: 1,
      name: 'Auto Device',
      currentMilliamps: 8.0,
      supportsAutoPolarity: true,
    );
    final result = CalculationResult(
      input: const CalculatorInput(
        volumeValue: 500,
        currentMilliamps: 8.0,
        targetPpm: 10,
        selectedDevice: device,
      ),
      calculatedDuration: const Duration(minutes: 3),
      calculatedAt: DateTime.now(),
    );

    final notifier = container.read(timerControllerProvider.notifier);
    notifier.loadCalculation(result);
    notifier.start(strings: _strings);

    expect(notifier.cleaningAlarmSchedule, isEmpty);
    expect(fakeNotifications.cleaningScheduled, isEmpty);
    expect(fakeNotifications.completionScheduledCount, 1);
  });

  test('device without auto-polarity still schedules cleaning alarms', () async {
    final container = await buildContainer();
    final fakeNotifications =
        container.read(notificationServiceProvider) as FakeNotificationService;

    const device = Device(
      id: 2,
      name: 'Manual Device',
      currentMilliamps: 8.0,
      supportsAutoPolarity: false,
    );
    final result = CalculationResult(
      input: const CalculatorInput(
        volumeValue: 500,
        currentMilliamps: 8.0,
        targetPpm: 10,
        selectedDevice: device,
      ),
      calculatedDuration: const Duration(minutes: 3),
      calculatedAt: DateTime.now(),
    );

    final notifier = container.read(timerControllerProvider.notifier);
    notifier.loadCalculation(result);
    notifier.start(strings: _strings);

    expect(notifier.cleaningAlarmSchedule, [
      const Duration(minutes: 1),
      const Duration(minutes: 2),
    ]);
    expect(fakeNotifications.cleaningScheduled, hasLength(2));
    expect(fakeNotifications.completionScheduledCount, 1);
  });

  test('Custom (no selected device) still schedules cleaning alarms', () async {
    final container = await buildContainer();
    final fakeNotifications =
        container.read(notificationServiceProvider) as FakeNotificationService;

    final result = CalculationResult(
      input: const CalculatorInput(volumeValue: 500, currentMilliamps: 8.0, targetPpm: 10),
      calculatedDuration: const Duration(minutes: 3),
      calculatedAt: DateTime.now(),
    );

    final notifier = container.read(timerControllerProvider.notifier);
    notifier.loadCalculation(result);
    notifier.start(strings: _strings);

    expect(notifier.cleaningAlarmSchedule, [
      const Duration(minutes: 1),
      const Duration(minutes: 2),
    ]);
    expect(fakeNotifications.cleaningScheduled, hasLength(2));
    expect(fakeNotifications.completionScheduledCount, 1);
  });
}
