import '../repositories/custom_meals_repository.dart';

class GetCustomMeals {
  GetCustomMeals(this.repository);

  final CustomMealsRepository repository;

  Future<CustomMealsPage> call({
    String? mealType,
    String? search,
    int page = 1,
    int limit = 20,
  }) {
    return repository.getCustomMeals(
      mealType: mealType,
      search: search,
      page: page,
      limit: limit,
    );
  }
}
