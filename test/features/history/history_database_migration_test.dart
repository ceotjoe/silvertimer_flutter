// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:silvertimer_flutter/features/history/data/local/history_database.dart' hide Device;
import 'package:sqlite3/sqlite3.dart' as raw_sqlite;

/// Builds a real on-disk sqlite file matching the app's original (pre-devices)
/// schema — just [SessionRecords], no [Devices] table, no device snapshot
/// columns — with `PRAGMA user_version = 1`, exactly what an existing
/// installed user's database looks like today. One legacy session row is
/// inserted so we can confirm the migration doesn't touch existing data.
void _createLegacyV1Database(String path) {
  final db = raw_sqlite.sqlite3.open(path);
  db.execute('''
    CREATE TABLE session_records (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      volume_liters REAL NOT NULL,
      current_milliamps REAL NOT NULL,
      target_ppm REAL NOT NULL,
      duration_seconds INTEGER NOT NULL,
      completed_at INTEGER NOT NULL,
      completed INTEGER NOT NULL DEFAULT 0
    );
  ''');
  db.execute('''
    INSERT INTO session_records
      (volume_liters, current_milliamps, target_ppm, duration_seconds, completed_at, completed)
    VALUES (0.5, 8.0, 25.0, 1200, 1700000000, 1);
  ''');
  db.execute('PRAGMA user_version = 1;');
  db.close();
}

void main() {
  late Directory tempDir;
  late String dbPath;

  setUp(() {
    tempDir = Directory.systemTemp.createTempSync('history_migration_test');
    dbPath = '${tempDir.path}/legacy.sqlite';
    _createLegacyV1Database(dbPath);
  });

  tearDown(() {
    tempDir.deleteSync(recursive: true);
  });

  test('upgrading a real v1 database file adds Devices and seeds it, without touching existing session rows', () async {
    final db = HistoryDatabase.forTesting(NativeDatabase(File(dbPath)));
    addTearDown(db.close);

    // Any query forces drift to open the file and run the migration.
    final sessions = await db.select(db.sessionRecords).get();
    final devices = await db.select(db.devices).get();

    // Legacy row survived untouched, with NULL device snapshot fields.
    expect(sessions, hasLength(1));
    final legacy = sessions.single;
    expect(legacy.volumeLiters, 0.5);
    expect(legacy.currentMilliamps, 8.0);
    expect(legacy.targetPpm, 25.0);
    expect(legacy.durationSeconds, 1200);
    expect(legacy.completed, isTrue);
    expect(legacy.deviceId, isNull);
    expect(legacy.deviceName, isNull);
    expect(legacy.deviceCurrentMa, isNull);
    expect(legacy.deviceAutoPolarity, isNull);

    // Devices table created and seeded exactly once during the upgrade.
    expect(devices, hasLength(3));
    expect(devices.map((d) => d.name), ['Generic 5mA', 'Generic 10mA', 'Generic 20mA']);
    expect(devices.every((d) => d.supportsAutoPolarity == false), isTrue);
  });

  test('user_version is updated to the new schema version after migration', () async {
    final db = HistoryDatabase.forTesting(NativeDatabase(File(dbPath)));

    await db.select(db.sessionRecords).get();
    await db.close();

    final raw = raw_sqlite.sqlite3.open(dbPath);
    final version = raw.select('PRAGMA user_version;').first.values.first as int;
    raw.close();

    expect(version, 2);
  });
}
