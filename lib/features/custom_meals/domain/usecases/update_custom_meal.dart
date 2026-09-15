import '../entities/custom_meal.dart';
import '../repositories/custom_meals_repository.dart';

class UpdateCustomMeal {
  UpdateCustomMeal(this.repository);

  final CustomMealsRepository repository;

  Future<CustomMeal> call({
    required String mealId,
    required Map<String, dynamic> data,
  }) {
    return repository.updateCustomMeal(mealId: mealId, data: data);
  }
}
