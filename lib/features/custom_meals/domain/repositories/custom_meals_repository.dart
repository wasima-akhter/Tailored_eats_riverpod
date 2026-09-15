import '../entities/custom_meal.dart';

class CustomMealsPage {
  final List<CustomMeal> items;
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  const CustomMealsPage({
    required this.items,
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  bool get hasNextPage => page < totalPage;
}

abstract class CustomMealsRepository {
  Future<CustomMealsPage> getCustomMeals({
    String? mealType,
    String? search,
    int page = 1,
    int limit = 20,
  });

  Future<CustomMeal> addCustomMeal({required Map<String, dynamic> data});

  Future<CustomMeal> updateCustomMeal({
    required String mealId,
    required Map<String, dynamic> data,
  });

  Future<String> deleteCustomMeal({required String mealId});
}
