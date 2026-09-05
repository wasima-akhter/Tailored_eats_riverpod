import '../../domain/entities/meal.dart';

enum MealType {
  breakfast,
  lunch,
  dinner,
  snacks;

  String get value {
    switch (this) {
      case MealType.breakfast:
        return 'breakfast';
      case MealType.lunch:
        return 'lunch';
      case MealType.dinner:
        return 'dinner';
      case MealType.snacks:
        return 'snacks';
    }
  }
}

enum MealLoadingStatus { initial, loading, success, failure }

class MealState {
  final MealLoadingStatus status;
  final List<Meal> meals;
  final Meal? currentMeal;
  final String? errorMessage;

  const MealState({
    this.status = MealLoadingStatus.initial,
    this.meals = const [],
    this.currentMeal,
    this.errorMessage,
  });

  MealState copyWith({
    MealLoadingStatus? status,
    List<Meal>? meals,
    Meal? currentMeal,
    String? errorMessage,
    bool clearCurrentMeal = false,
    bool clearError = false,
  }) {
    return MealState(
      status: status ?? this.status,
      meals: meals ?? this.meals,
      currentMeal: clearCurrentMeal ? null : currentMeal ?? this.currentMeal,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class NutritionState {
  final MealState breakfast;
  final MealState lunch;
  final MealState dinner;
  final MealState snacks;

  const NutritionState({
    this.breakfast = const MealState(),
    this.lunch = const MealState(),
    this.dinner = const MealState(),
    this.snacks = const MealState(),
  });

  MealState mealState(MealType mealType) {
    switch (mealType) {
      case MealType.breakfast:
        return breakfast;
      case MealType.lunch:
        return lunch;
      case MealType.dinner:
        return dinner;
      case MealType.snacks:
        return snacks;
    }
  }

  NutritionState copyWith({
    MealState? breakfast,
    MealState? lunch,
    MealState? dinner,
    MealState? snacks,
  }) {
    return NutritionState(
      breakfast: breakfast ?? this.breakfast,
      lunch: lunch ?? this.lunch,
      dinner: dinner ?? this.dinner,
      snacks: snacks ?? this.snacks,
    );
  }
}
