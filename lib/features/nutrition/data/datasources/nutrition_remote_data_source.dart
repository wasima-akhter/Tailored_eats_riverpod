import '../../../../core/network/api_client.dart';
import '../models/meal_model.dart';

class NutritionAiRemoteDataSource {
  NutritionAiRemoteDataSource({required this._apiClient});

  final ApiClient _apiClient;

  Future<List<MealModel>> generateMeals({
    required String userId,
    required String mealType,
    int numMeals = 2,
  }) async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      '/generate/$mealType',
      queryParameters: {'user_id': userId, 'num_meals': numMeals},
    );

    final data = response.data;

    if (data == null) {
      throw Exception('Empty response from AI meal generator.');
    }

    final meals = data['meals'];

    if (meals is! List) {
      throw Exception('Invalid meals response from AI meal generator.');
    }

    return meals
        .whereType<Map<String, dynamic>>()
        .map(MealModel.fromJson)
        .toList();
  }
}
