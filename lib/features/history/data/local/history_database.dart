// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_platform/universal_platform.dart';

part 'history_database.g.dart';

/// Drift table for session records.
class SessionRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get volumeLiters => real()();
  RealColumn get currentMilliamps => real()();
  RealColumn get targetPpm => real()();
  IntColumn get durationSeconds => integer()();
  DateTimeColumn get completedAt => dateTime()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();

  // Snapshot of the device used for this session, captured at completion
  // time. Not a foreign key: deleting/editing a device must never affect
  // past history, so these columns are the source of truth for display.
  IntColumn get deviceId => integer().nullable()();
  TextColumn get deviceName => text().nullable()();
  RealColumn get deviceCurrentMa => real().nullable()();
  BoolColumn get deviceAutoPolarity => boolean().nullable()();
}

/// Drift table for user-managed electrolysis generator devices.
class Devices extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get currentMilliamps => real()();
  BoolColumn get supportsAutoPolarity =>
      boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [SessionRecords, Devices])
class HistoryDatabase extends _$HistoryDatabase {
  HistoryDatabase() : super(_openConnection());

  /// Injects a custom [QueryExecutor] (e.g. an in-memory database) for tests.
  @visibleForTesting
  HistoryDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _seedGenericDevices(this);
        },
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(devices);
            await m.addColumn(sessionRecords, sessionRecords.deviceId);
            await m.addColumn(sessionRecords, sessionRecords.deviceName);
            await m.addColumn(sessionRecords, sessionRecords.deviceCurrentMa);
            await m.addColumn(sessionRecords, sessionRecords.deviceAutoPolarity);
            await _seedGenericDevices(this);
          }
        },
      );

  static QueryExecutor _openConnection() {
    if (UniversalPlatform.isWeb) {
      return driftDatabase(
        name: 'silvertimer_history',
        web: DriftWebOptions(
          sqlite3Wasm: Uri.parse('sqlite3.wasm'),
          driftWorker: Uri.parse('drift_worker.dart.js'),
          onResult: (result) {
            if (result.missingFeatures.isNotEmpty) {
              // Silently fall back to in-memory storage when WASM isn't available.
            }
          },
        ),
      );
    }
    return driftDatabase(name: 'silvertimer_history');
  }
}

Future<void> _seedGenericDevices(HistoryDatabase db) async {
  await db.batch((b) {
    b.insertAll(db.devices, [
      DevicesCompanion.insert(name: 'Generic 5mA', currentMilliamps: 5.0),
      DevicesCompanion.insert(name: 'Generic 10mA', currentMilliamps: 10.0),
      DevicesCompanion.insert(name: 'Generic 20mA', currentMilliamps: 20.0),
    ]);
  });
}

@riverpod
HistoryDatabase historyDatabase(Ref ref) {
  final db = HistoryDatabase();
  ref.onDispose(db.close);
  return db;
}
