import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/network_providers.dart';
import '../../data/datasources/custom_meals_remote_data_source.dart';
import '../../data/repositories/custom_meals_repository_impl.dart';
import '../../domain/repositories/custom_meals_repository.dart';
import '../../domain/usecases/add_custom_meal.dart';
import '../../domain/usecases/delete_custom_meal.dart';
import '../../domain/usecases/get_custom_meals.dart';
import '../../domain/usecases/update_custom_meal.dart';
import '../controllers/custom_meals_controller.dart';
import '../controllers/custom_meals_state.dart';

final customMealsRemoteDataSourceProvider =
    Provider<CustomMealsRemoteDataSource>((ref) {
      return CustomMealsRemoteDataSourceImpl(
        apiClient: ref.read(apiClientProvider),
      );
    });

final customMealsRepositoryProvider = Provider<CustomMealsRepository>((ref) {
  return CustomMealsRepositoryImpl(
    remoteDataSource: ref.read(customMealsRemoteDataSourceProvider),
  );
});

final getCustomMealsProvider = Provider<GetCustomMeals>((ref) {
  return GetCustomMeals(ref.read(customMealsRepositoryProvider));
});

final addCustomMealProvider = Provider<AddCustomMeal>((ref) {
  return AddCustomMeal(ref.read(customMealsRepositoryProvider));
});

final updateCustomMealProvider = Provider<UpdateCustomMeal>((ref) {
  return UpdateCustomMeal(ref.read(customMealsRepositoryProvider));
});

final deleteCustomMealProvider = Provider<DeleteCustomMeal>((ref) {
  return DeleteCustomMeal(ref.read(customMealsRepositoryProvider));
});

final customMealsControllerProvider =
    StateNotifierProvider<CustomMealsController, CustomMealsState>((ref) {
      return CustomMealsController(
        getCustomMeals: ref.read(getCustomMealsProvider),
        addCustomMeal: ref.read(addCustomMealProvider),
        updateCustomMeal: ref.read(updateCustomMealProvider),
        deleteCustomMeal: ref.read(deleteCustomMealProvider),
      );
    });
