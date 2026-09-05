import '../entities/meal.dart';

abstract class NutritionRepository {
  Future<List<Meal>> generateMeals({
    required String userId,
    required String mealType,
    int numMeals,
  });
}
