import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/error_handler.dart';
import '../../domain/entities/meal.dart';
import '../../domain/usecases/generate_meals.dart';
import 'nutrition_state.dart';

class NutritionController extends StateNotifier<NutritionState> {
  NutritionController({required this._generateMeals, required this._userId})
    : super(const NutritionState());

  final GenerateMeals _generateMeals;
  final String _userId;

  Future<void> loadAllMeals() async {
    await Future.wait([
      loadMeals(MealType.breakfast),
      loadMeals(MealType.lunch),
      loadMeals(MealType.dinner),
      loadMeals(MealType.snacks),
    ]);
  }

  Future<void> loadMeals(MealType mealType) async {
    _updateMealState(
      mealType,
      state
          .mealState(mealType)
          .copyWith(status: MealLoadingStatus.loading, clearError: true),
    );

    try {
      final meals = await _generateMeals(
        userId: _userId,
        mealType: mealType.value,
        numMeals: 2,
      );

      if (meals.isEmpty) {
        _updateMealState(
          mealType,
          MealState(
            status: MealLoadingStatus.failure,
            errorMessage: _emptyMealsMessage(mealType),
          ),
        );
        return;
      }

      final shuffledMeals = List<Meal>.from(meals)..shuffle(Random());

      _updateMealState(
        mealType,
        MealState(
          status: MealLoadingStatus.success,
          meals: shuffledMeals,
          currentMeal: shuffledMeals.first,
        ),
      );
    } catch (error, stackTrace) {
      debugPrint(
        '[NutritionController] Failed to load ${mealType.value}: $error',
      );
      debugPrintStack(stackTrace: stackTrace);

      // Resolve/classify the error centrally, but never expose its
      // raw message directly to the UI.
      final failure = ErrorHandler.handle(error);

      debugPrint(
        '[NutritionController] ${mealType.value} failure: '
        '${failure.userMessage}',
      );

      _updateMealState(
        mealType,
        MealState(
          status: MealLoadingStatus.failure,
          errorMessage: _loadMealsErrorMessage(mealType),
        ),
      );
    }
  }

  Future<void> retryMeal(MealType mealType) async {
    _updateMealState(mealType, MealState(status: MealLoadingStatus.initial));

    await loadMeals(mealType);
  }

  void selectMeal({required MealType mealType, required Meal meal}) {
    final currentState = state.mealState(mealType);

    _updateMealState(mealType, currentState.copyWith(currentMeal: meal));
  }

  void _updateMealState(MealType mealType, MealState mealState) {
    switch (mealType) {
      case MealType.breakfast:
        state = state.copyWith(breakfast: mealState);
        break;
      case MealType.lunch:
        state = state.copyWith(lunch: mealState);
        break;
      case MealType.dinner:
        state = state.copyWith(dinner: mealState);
        break;
      case MealType.snacks:
        state = state.copyWith(snacks: mealState);
        break;
    }
  }

  String _loadMealsErrorMessage(MealType mealType) {
    switch (mealType) {
      case MealType.breakfast:
        return 'Unable to load breakfast meals. Please try again.';
      case MealType.lunch:
        return 'Unable to load lunch meals. Please try again.';
      case MealType.dinner:
        return 'Unable to load dinner meals. Please try again.';
      case MealType.snacks:
        return 'Unable to load snack meals. Please try again.';
    }
  }

  String _emptyMealsMessage(MealType mealType) {
    switch (mealType) {
      case MealType.breakfast:
        return 'No breakfast meals are available right now.';
      case MealType.lunch:
        return 'No lunch meals are available right now.';
      case MealType.dinner:
        return 'No dinner meals are available right now.';
      case MealType.snacks:
        return 'No snack meals are available right now.';
    }
  }
}
