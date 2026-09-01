// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_dao.dart';

// ignore_for_file: type=lint
mixin _$ProgressDaoMixin on DatabaseAccessor<AppDatabase> {
  $CachedProgressTable get cachedProgress => attachedDatabase.cachedProgress;
  ProgressDaoManager get managers => ProgressDaoManager(this);
}

class ProgressDaoManager {
  final _$ProgressDaoMixin _db;
  ProgressDaoManager(this._db);
  $$CachedProgressTableTableManager get cachedProgress =>
      $$CachedProgressTableTableManager(
        _db.attachedDatabase,
        _db.cachedProgress,
      );
}
