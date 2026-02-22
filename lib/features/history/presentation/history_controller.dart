import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silvertimer_flutter/features/history/data/history_repository.dart';
import 'package:silvertimer_flutter/features/history/domain/models/session_record.dart';

part 'history_controller.g.dart';

@riverpod
class HistoryController extends _$HistoryController {
  @override
  Future<List<SessionRecord>> build() async {
    return ref.watch(historyRepositoryProvider).getAllSessions();
  }

  Future<void> addSession(SessionRecord record) async {
    await ref.read(historyRepositoryProvider).insertSession(record);
    ref.invalidateSelf();
  }

  Future<void> deleteSession(int id) async {
    await ref.read(historyRepositoryProvider).deleteSession(id);
    ref.invalidateSelf();
  }

  Future<void> clearAll() async {
    await ref.read(historyRepositoryProvider).clearAll();
    ref.invalidateSelf();
  }
}
