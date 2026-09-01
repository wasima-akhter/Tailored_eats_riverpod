// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_dao.dart';

// ignore_for_file: type=lint
mixin _$MealDaoMixin on DatabaseAccessor<AppDatabase> {
  $CachedMealsTable get cachedMeals => attachedDatabase.cachedMeals;
  MealDaoManager get managers => MealDaoManager(this);
}

class MealDaoManager {
  final _$MealDaoMixin _db;
  MealDaoManager(this._db);
  $$CachedMealsTableTableManager get cachedMeals =>
      $$CachedMealsTableTableManager(_db.attachedDatabase, _db.cachedMeals);
}
