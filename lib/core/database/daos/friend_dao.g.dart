// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_dao.dart';

// ignore_for_file: type=lint
mixin _$FriendDaoMixin on DatabaseAccessor<AppDatabase> {
  $CachedFriendsTable get cachedFriends => attachedDatabase.cachedFriends;
  FriendDaoManager get managers => FriendDaoManager(this);
}

class FriendDaoManager {
  final _$FriendDaoMixin _db;
  FriendDaoManager(this._db);
  $$CachedFriendsTableTableManager get cachedFriends =>
      $$CachedFriendsTableTableManager(_db.attachedDatabase, _db.cachedFriends);
}
