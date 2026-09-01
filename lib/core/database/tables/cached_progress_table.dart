import 'package:drift/drift.dart';

class CachedProgress extends Table {
  TextColumn get id => text()();

  TextColumn get userId => text().nullable()();

  TextColumn get type => text()();

  RealColumn get weight => real().nullable()();

  IntColumn get percentage => integer().nullable()();

  TextColumn get imageUrl => text().nullable()();

  DateTimeColumn get recordedAt => dateTime().nullable()();

  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
