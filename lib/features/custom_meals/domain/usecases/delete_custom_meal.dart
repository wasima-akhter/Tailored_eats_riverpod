import '../repositories/custom_meals_repository.dart';

class DeleteCustomMeal {
  DeleteCustomMeal(this.repository);

  final CustomMealsRepository repository;

  Future<String> call({required String mealId}) {
    return repository.deleteCustomMeal(mealId: mealId);
  }
}
