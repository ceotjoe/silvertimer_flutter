import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
}

@DriftDatabase(tables: [SessionRecords])
class HistoryDatabase extends _$HistoryDatabase {
  HistoryDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

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

@riverpod
HistoryDatabase historyDatabase(Ref ref) {
  final db = HistoryDatabase();
  ref.onDispose(db.close);
  return db;
}
