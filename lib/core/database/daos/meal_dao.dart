import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/cached_meals_table.dart';

part 'meal_dao.g.dart';

@DriftAccessor(tables: [CachedMeals])
class MealDao extends DatabaseAccessor<AppDatabase>
    with _$MealDaoMixin {
  MealDao(super.db);

  Future<List<CachedMeal>> getMeals({
    String? mealType,
  }) {
    final query = select(cachedMeals);

    if (mealType != null && mealType.isNotEmpty) {
      query.where(
        (table) => table.mealType.equals(mealType),
      );
    }

    query.orderBy([
      (table) => OrderingTerm.desc(table.createdAt),
    ]);

    return query.get();
  }

  Stream<List<CachedMeal>> watchMeals({
    String? mealType,
  }) {
    final query = select(cachedMeals);

    if (mealType != null && mealType.isNotEmpty) {
      query.where(
        (table) => table.mealType.equals(mealType),
      );
    }

    query.orderBy([
      (table) => OrderingTerm.desc(table.createdAt),
    ]);

    return query.watch();
  }

  Future<CachedMeal?> getMeal(String mealId) {
    return (select(cachedMeals)
          ..where((table) => table.id.equals(mealId)))
        .getSingleOrNull();
  }

  Future<void> saveMeal(CachedMealsCompanion meal) async {
    await into(cachedMeals).insertOnConflictUpdate(meal);
  }

  Future<void> saveMeals(
    List<CachedMealsCompanion> meals,
  ) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        cachedMeals,
        meals,
      );
    });
  }

  Future<void> deleteMeal(String mealId) async {
    await (delete(cachedMeals)
          ..where((table) => table.id.equals(mealId)))
        .go();
  }

  Future<void> clearMeals() async {
    await delete(cachedMeals).go();
  }
}
