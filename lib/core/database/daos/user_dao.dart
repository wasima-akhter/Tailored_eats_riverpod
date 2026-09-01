import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/cached_user_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [CachedUsers])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<CachedUser?> getUser(String userId) {
    return (select(
      cachedUsers,
    )..where((table) => table.id.equals(userId))).getSingleOrNull();
  }

  Stream<CachedUser?> watchUser(String userId) {
    return (select(
      cachedUsers,
    )..where((table) => table.id.equals(userId))).watchSingleOrNull();
  }

  Future<void> saveUser(CachedUsersCompanion user) async {
    await into(cachedUsers).insertOnConflictUpdate(user);
  }

  Future<void> deleteUser(String userId) async {
    await (delete(cachedUsers)..where((table) => table.id.equals(userId))).go();
  }

  Future<void> clearUsers() async {
    await delete(cachedUsers).go();
  }
}
