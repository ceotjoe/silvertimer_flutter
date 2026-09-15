// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silvertimer_flutter/features/devices/data/device_repository.dart';
import 'package:silvertimer_flutter/features/devices/domain/models/device.dart';

part 'devices_controller.g.dart';

@Riverpod(keepAlive: true)
class DevicesController extends _$DevicesController {
  @override
  Future<List<Device>> build() async {
    return ref.watch(deviceRepositoryProvider).getAllDevices();
  }

  Future<void> addDevice(Device device) async {
    await ref.read(deviceRepositoryProvider).insertDevice(device);
    ref.invalidateSelf();
  }

  Future<void> updateDevice(Device device) async {
    await ref.read(deviceRepositoryProvider).updateDevice(device);
    ref.invalidateSelf();
  }

  Future<void> deleteDevice(int id) async {
    await ref.read(deviceRepositoryProvider).deleteDevice(id);
    ref.invalidateSelf();
  }
}
