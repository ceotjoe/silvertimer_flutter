// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silvertimer_flutter/features/history/data/local/history_database.dart'
    as db_lib;
import 'package:silvertimer_flutter/features/history/domain/models/session_record.dart'
    as domain;

part 'history_repository.g.dart';

class HistoryRepository {
  const HistoryRepository(this._db);

  final db_lib.HistoryDatabase _db;

  Future<List<domain.SessionRecord>> getAllSessions() async {
    final rows = await (_db.select(_db.sessionRecords)
          ..orderBy([(t) => OrderingTerm.desc(t.completedAt)]))
        .get();
    return rows.map(_toModel).toList();
  }

  Future<void> insertSession(domain.SessionRecord record) async {
    await _db.into(_db.sessionRecords).insert(
          db_lib.SessionRecordsCompanion.insert(
            volumeLiters: record.volumeLiters,
            currentMilliamps: record.currentMilliamps,
            targetPpm: record.targetPpm,
            durationSeconds: record.durationSeconds,
            completedAt: record.completedAt,
            completed: Value(record.completed),
          ),
        );
  }

  Future<void> deleteSession(int id) async {
    await (_db.delete(_db.sessionRecords)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  Future<void> clearAll() async {
    await _db.delete(_db.sessionRecords).go();
  }

  domain.SessionRecord _toModel(db_lib.SessionRecord row) {
    return domain.SessionRecord(
      id: row.id,
      volumeLiters: row.volumeLiters,
      currentMilliamps: row.currentMilliamps,
      targetPpm: row.targetPpm,
      durationSeconds: row.durationSeconds,
      completedAt: row.completedAt,
      completed: row.completed,
    );
  }
}

@riverpod
HistoryRepository historyRepository(Ref ref) {
  return HistoryRepository(ref.watch(db_lib.historyDatabaseProvider));
}
