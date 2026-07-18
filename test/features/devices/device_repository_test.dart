// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:silvertimer_flutter/features/devices/data/device_repository.dart';
import 'package:silvertimer_flutter/features/devices/domain/models/device.dart';
import 'package:silvertimer_flutter/features/history/data/local/history_database.dart'
    hide Device;

void main() {
  late HistoryDatabase db;
  late DeviceRepository repository;

  setUp(() {
    db = HistoryDatabase.forTesting(NativeDatabase.memory());
    repository = DeviceRepository(db);
  });

  tearDown(() => db.close());

  test('seeds exactly 3 generic devices on creation', () async {
    final devices = await repository.getAllDevices();

    expect(devices, hasLength(3));
    expect(devices.map((d) => d.name), [
      'Generic 5mA',
      'Generic 10mA',
      'Generic 20mA',
    ]);
    expect(devices.map((d) => d.currentMilliamps), [5.0, 10.0, 20.0]);
    expect(devices.every((d) => d.supportsAutoPolarity == false), isTrue);
  });

  test('insertDevice adds a new device', () async {
    await repository.insertDevice(
      const Device(id: 0, name: 'My Generator', currentMilliamps: 12.5, supportsAutoPolarity: true),
    );

    final devices = await repository.getAllDevices();
    expect(devices, hasLength(4));
    final added = devices.last;
    expect(added.name, 'My Generator');
    expect(added.currentMilliamps, 12.5);
    expect(added.supportsAutoPolarity, isTrue);
  });

  test('updateDevice modifies an existing device', () async {
    final devices = await repository.getAllDevices();
    final target = devices.first;

    await repository.updateDevice(target.copyWith(name: 'Renamed', currentMilliamps: 7.0));

    final updated = (await repository.getAllDevices()).first;
    expect(updated.id, target.id);
    expect(updated.name, 'Renamed');
    expect(updated.currentMilliamps, 7.0);
  });

  test('deleteDevice removes a device', () async {
    final devices = await repository.getAllDevices();
    final target = devices.first;

    await repository.deleteDevice(target.id);

    final remaining = await repository.getAllDevices();
    expect(remaining, hasLength(2));
    expect(remaining.any((d) => d.id == target.id), isFalse);
  });
}
