import 'package:drift/drift.dart';

class CachedFriends extends Table {
  TextColumn get id => text()();

  TextColumn get userId => text().nullable()();

  TextColumn get name => text().nullable()();

  TextColumn get mainGoal => text().nullable()();

  TextColumn get image => text().nullable()();

  IntColumn get percentage => integer().nullable()();

  BoolColumn get isFriend => boolean().withDefault(const Constant(false))();

  BoolColumn get isPendingRequest =>
      boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().nullable()();

  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
