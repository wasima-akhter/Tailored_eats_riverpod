import '../entities/custom_meal.dart';
import '../repositories/custom_meals_repository.dart';

class AddCustomMeal {
  AddCustomMeal(this.repository);

  final CustomMealsRepository repository;

  Future<CustomMeal> call({required Map<String, dynamic> data}) {
    return repository.addCustomMeal(data: data);
  }
}
