import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/network_providers.dart';
import '../../../profile/presentation/providers/profile_provider.dart';
import '../../data/datasources/nutrition_remote_data_source.dart';
import '../../domain/repositories/nutrition_repository_provider.dart.dart';
import '../../domain/usecases/generate_meals.dart';
import '../controllers/nutrition_controller.dart';
import '../controllers/nutrition_state.dart';

final nutritionAiRemoteDataSourceProvider =
    Provider<NutritionAiRemoteDataSource>((ref) {
      return NutritionAiRemoteDataSource(
        apiClient: ref.watch(aiApiClientProvider),
      );
    });

final generateMealsProvider = Provider<GenerateMeals>((ref) {
  return GenerateMeals(repository: ref.watch(nutritionRepositoryProvider));
});

final nutritionControllerProvider =
    StateNotifierProvider<NutritionController, NutritionState>((ref) {
      final profileState = ref.watch(profileControllerProvider);

      return NutritionController(
        generateMeals: ref.watch(generateMealsProvider),
        userId: profileState.profile?.email ?? '',
      );
    });
