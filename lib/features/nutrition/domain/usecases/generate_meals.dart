import '../entities/meal.dart';
import '../repositories/nutrition_repository.dart';

class GenerateMeals {
  GenerateMeals({required this._repository});

  final NutritionRepository _repository;

  Future<List<Meal>> call({
    required String userId,
    required String mealType,
    int numMeals = 2,
  }) {
    return _repository.generateMeals(
      userId: userId,
      mealType: mealType,
      numMeals: numMeals,
    );
  }
}
