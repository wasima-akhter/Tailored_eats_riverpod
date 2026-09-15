import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/custom_meal.dart';
import '../../domain/usecases/add_custom_meal.dart';
import '../../domain/usecases/delete_custom_meal.dart';
import '../../domain/usecases/get_custom_meals.dart';
import '../../domain/usecases/update_custom_meal.dart';
import 'custom_meals_state.dart';

class CustomMealsController extends StateNotifier<CustomMealsState> {
  CustomMealsController({
    required this.getCustomMeals,
    required this.addCustomMeal,
    required this.updateCustomMeal,
    required this.deleteCustomMeal,
  }) : super(const CustomMealsState());

  final GetCustomMeals getCustomMeals;
  final AddCustomMeal addCustomMeal;
  final UpdateCustomMeal updateCustomMeal;
  final DeleteCustomMeal deleteCustomMeal;

  Timer? _searchDebounce;

  Future<void> loadMeals({
    bool refresh = false,
    String? mealType,
    String? search,
  }) async {
    if (state.isLoading || state.isLoadingMore) {
      return;
    }

    final nextMealType = mealType ?? state.selectedMealType;
    final nextSearch = search ?? state.search;

    final page = refresh ? 1 : state.page;

    if (!refresh && page > 1 && !state.hasMore) {
      return;
    }

    state = state.copyWith(
      isLoading: refresh || page == 1,
      isLoadingMore: !refresh && page > 1,
      errorMessage: null,
      selectedMealType: nextMealType,
      search: nextSearch,
    );

    try {
      final result = await getCustomMeals(
        mealType: nextMealType,
        search: nextSearch,
        page: page,
      );

      final meals = refresh || page == 1
          ? result.items
          : [...state.meals, ...result.items];

      state = state.copyWith(
        meals: meals,
        isLoading: false,
        isLoadingMore: false,
        page: result.page,
        totalPage: result.totalPage,
        hasMore: result.hasNextPage,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> refresh() {
    return loadMeals(refresh: true);
  }

  Future<void> loadMore() async {
    if (state.isLoading || state.isLoadingMore || !state.hasMore) {
      return;
    }

    await loadMeals();
  }

  void search(String value) {
    _searchDebounce?.cancel();

    _searchDebounce = Timer(const Duration(milliseconds: 400), () {
      loadMeals(refresh: true, search: value.trim());
    });
  }

  Future<void> filterByMealType(String? mealType) {
    return loadMeals(refresh: true, mealType: mealType);
  }

  Future<CustomMeal?> createMeal({required Map<String, dynamic> data}) async {
    if (state.isSubmitting) {
      return null;
    }

    state = state.copyWith(isSubmitting: true, errorMessage: null);

    try {
      final meal = await addCustomMeal(data: data);

      state = state.copyWith(
        meals: [meal, ...state.meals],
        isSubmitting: false,
      );

      return meal;
    } catch (e) {
      state = state.copyWith(isSubmitting: false, errorMessage: e.toString());

      return null;
    }
  }

  Future<CustomMeal?> editMeal({
    required String mealId,
    required Map<String, dynamic> data,
  }) async {
    if (state.isSubmitting) {
      return null;
    }

    state = state.copyWith(
      isSubmitting: true,
      processingMealId: mealId,
      errorMessage: null,
    );

    try {
      final updatedMeal = await updateCustomMeal(mealId: mealId, data: data);

      final updatedMeals = state.meals.map((meal) {
        if (meal.id != mealId) {
          return meal;
        }

        return updatedMeal;
      }).toList();

      state = state.copyWith(
        meals: updatedMeals,
        isSubmitting: false,
        clearProcessingMealId: true,
      );

      return updatedMeal;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        clearProcessingMealId: true,
        errorMessage: e.toString(),
      );

      return null;
    }
  }

  Future<bool> removeMeal(String mealId) async {
    if (state.isDeleting) {
      return false;
    }

    state = state.copyWith(
      isDeleting: true,
      processingMealId: mealId,
      errorMessage: null,
    );

    try {
      await deleteCustomMeal(mealId: mealId);

      state = state.copyWith(
        meals: state.meals.where((meal) => meal.id != mealId).toList(),
        isDeleting: false,
        clearProcessingMealId: true,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isDeleting: false,
        clearProcessingMealId: true,
        errorMessage: e.toString(),
      );

      return false;
    }
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
  }
}
