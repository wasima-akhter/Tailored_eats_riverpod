import 'package:drift/drift.dart';

class CachedMeals extends Table {
  TextColumn get id => text()();

  TextColumn get userId => text().nullable()();

  TextColumn get name => text().nullable()();

  TextColumn get mealType => text().nullable()();

  RealColumn get calorie => real().nullable()();

  RealColumn get protein => real().nullable()();

  RealColumn get carb => real().nullable()();

  RealColumn get fat => real().nullable()();

  TextColumn get image => text().nullable()();

  TextColumn get prepTime => text().nullable()();

  TextColumn get ingredientsJson => text().nullable()();

  TextColumn get instructions => text().nullable()();

  DateTimeColumn get createdAt => dateTime().nullable()();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
