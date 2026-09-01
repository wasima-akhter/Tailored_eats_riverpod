import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/cached_friends_table.dart';

part 'friend_dao.g.dart';

@DriftAccessor(tables: [CachedFriends])
class FriendDao extends DatabaseAccessor<AppDatabase> with _$FriendDaoMixin {
  FriendDao(super.db);

  Future<List<CachedFriend>> getFriends() {
    return (select(cachedFriends)
          ..where((table) => table.isFriend.equals(true))
          ..orderBy([(table) => OrderingTerm.asc(table.name)]))
        .get();
  }

  Stream<List<CachedFriend>> watchFriends() {
    return (select(cachedFriends)
          ..where((table) => table.isFriend.equals(true))
          ..orderBy([(table) => OrderingTerm.asc(table.name)]))
        .watch();
  }

  Future<List<CachedFriend>> getPendingFriends() {
    return (select(cachedFriends)
          ..where((table) => table.isPendingRequest.equals(true))
          ..orderBy([(table) => OrderingTerm.desc(table.createdAt)]))
        .get();
  }

  Future<List<CachedFriend>> getFriendSuggestions() {
    return (select(cachedFriends)
          ..where(
            (table) =>
                table.isFriend.equals(false) &
                table.isPendingRequest.equals(false),
          )
          ..orderBy([(table) => OrderingTerm.asc(table.name)]))
        .get();
  }

  Future<CachedFriend?> getFriend(String id) {
    return (select(
      cachedFriends,
    )..where((table) => table.id.equals(id))).getSingleOrNull();
  }

  Future<void> saveFriend(CachedFriendsCompanion friend) async {
    await into(cachedFriends).insertOnConflictUpdate(friend);
  }

  Future<void> saveFriends(List<CachedFriendsCompanion> friends) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(cachedFriends, friends);
    });
  }

  Future<void> deleteFriend(String id) async {
    await (delete(cachedFriends)..where((table) => table.id.equals(id))).go();
  }

  Future<void> clearFriends() async {
    await delete(cachedFriends).go();
  }
}
