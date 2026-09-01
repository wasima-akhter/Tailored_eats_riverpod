import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/cached_progress_table.dart';

part 'progress_dao.g.dart';

@DriftAccessor(tables: [CachedProgress])
class ProgressDao extends DatabaseAccessor<AppDatabase>
    with _$ProgressDaoMixin {
  ProgressDao(super.db);

  Future<List<CachedProgressData>> getProgress({String? type}) {
    final query = select(cachedProgress);

    if (type != null && type.isNotEmpty) {
      query.where((table) => table.type.equals(type));
    }

    query.orderBy([(table) => OrderingTerm.desc(table.recordedAt)]);

    return query.get();
  }

  Stream<List<CachedProgressData>> watchProgress({String? type}) {
    final query = select(cachedProgress);

    if (type != null && type.isNotEmpty) {
      query.where((table) => table.type.equals(type));
    }

    query.orderBy([(table) => OrderingTerm.desc(table.recordedAt)]);

    return query.watch();
  }

  Future<void> saveProgress(CachedProgressCompanion progress) async {
    await into(cachedProgress).insertOnConflictUpdate(progress);
  }

  Future<void> saveProgressList(
    List<CachedProgressCompanion> progressList,
  ) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(cachedProgress, progressList);
    });
  }

  Future<void> deleteProgress(String id) async {
    await (delete(cachedProgress)..where((table) => table.id.equals(id))).go();
  }

  Future<void> clearProgress() async {
    await delete(cachedProgress).go();
  }
}
