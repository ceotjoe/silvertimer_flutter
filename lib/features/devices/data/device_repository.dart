// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silvertimer_flutter/features/devices/domain/models/device.dart' as domain;
import 'package:silvertimer_flutter/features/history/data/local/history_database.dart' as db_lib;

part 'device_repository.g.dart';

class DeviceRepository {
  const DeviceRepository(this._db);

  final db_lib.HistoryDatabase _db;

  Future<List<domain.Device>> getAllDevices() async {
    final rows = await (_db.select(_db.devices)..orderBy([(t) => OrderingTerm.asc(t.id)])).get();
    return rows.map(_toModel).toList();
  }

  Future<void> insertDevice(domain.Device device) async {
    await _db
        .into(_db.devices)
        .insert(
          db_lib.DevicesCompanion.insert(
            name: device.name,
            currentMilliamps: device.currentMilliamps,
            supportsAutoPolarity: Value(device.supportsAutoPolarity),
          ),
        );
  }

  Future<void> updateDevice(domain.Device device) async {
    await _db
        .update(_db.devices)
        .replace(
          db_lib.DevicesCompanion(
            id: Value(device.id),
            name: Value(device.name),
            currentMilliamps: Value(device.currentMilliamps),
            supportsAutoPolarity: Value(device.supportsAutoPolarity),
          ),
        );
  }

  Future<void> deleteDevice(int id) async {
    await (_db.delete(_db.devices)..where((t) => t.id.equals(id))).go();
  }

  domain.Device _toModel(db_lib.Device row) {
    return domain.Device(
      id: row.id,
      name: row.name,
      currentMilliamps: row.currentMilliamps,
      supportsAutoPolarity: row.supportsAutoPolarity,
    );
  }
}

@riverpod
DeviceRepository deviceRepository(Ref ref) {
  return DeviceRepository(ref.watch(db_lib.historyDatabaseProvider));
}
