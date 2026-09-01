import 'package:drift/drift.dart';

class CachedUsers extends Table {
  TextColumn get id => text()();

  TextColumn get name => text().nullable()();

  TextColumn get firstName => text().nullable()();

  TextColumn get lastName => text().nullable()();

  TextColumn get email => text().nullable()();

  TextColumn get gender => text().nullable()();

  IntColumn get age => integer().nullable()();

  RealColumn get height => real().nullable()();

  TextColumn get activityLevel => text().nullable()();

  TextColumn get foodVibe => text().nullable()();

  TextColumn get mainGoal => text().nullable()();

  TextColumn get result => text().nullable()();

  TextColumn get training => text().nullable()();

  TextColumn get image => text().nullable()();

  TextColumn get profileImage => text().nullable()();

  RealColumn get weight => real().nullable()();

  RealColumn get calorie => real().nullable()();

  TextColumn get subscriptionPlan => text().nullable()();

  BoolColumn get isTwoFactor => boolean().withDefault(const Constant(false))();

  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
