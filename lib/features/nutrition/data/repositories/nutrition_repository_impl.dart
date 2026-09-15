import '../../data/datasources/nutrition_remote_data_source.dart';
import '../../domain/entities/meal.dart';
import '../../domain/repositories/nutrition_repository.dart';

class NutritionRepositoryImpl implements NutritionRepository {
  NutritionRepositoryImpl({required this._remoteDataSource});

  final NutritionAiRemoteDataSource _remoteDataSource;

  @override
  Future<List<Meal>> generateMeals({
    required String userId,
    required String mealType,
    int numMeals = 2,
  }) async {
    final models = await _remoteDataSource.generateMeals(
      userId: userId,
      mealType: mealType,
      numMeals: numMeals,
    );

    return models.map((model) => model.toEntity()).toList();
  }
}
