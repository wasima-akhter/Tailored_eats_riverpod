import 'meal_ingredient.dart';

class Meal {
  final dynamic id;
  final String mealName;
  final String mealType;
  final String macroProfile;
  final String cuisine;
  final String description;
  final double caloriesKcal;
  final double proteinG;
  final double carbsG;
  final double fatG;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int totalTimeMinutes;
  final double costGbp;
  final String difficulty;
  final List<MealIngredient> ingredients;
  final List<String> instructions;
  final String? tips;
  final String? storage;
  final List<String> dietaryTags;
  final List<String> allergens;
  final String? imageUrl;
  final String? userId;
  final String? dataSource;
  final bool isFavorite;
  final DateTime? createdAt;

  const Meal({
    required this.id,
    required this.mealName,
    required this.mealType,
    required this.macroProfile,
    required this.cuisine,
    required this.description,
    required this.caloriesKcal,
    required this.proteinG,
    required this.carbsG,
    required this.fatG,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.totalTimeMinutes,
    required this.costGbp,
    required this.difficulty,
    required this.ingredients,
    required this.instructions,
    this.tips,
    this.storage,
    required this.dietaryTags,
    required this.allergens,
    this.imageUrl,
    this.userId,
    this.dataSource,
    required this.isFavorite,
    this.createdAt,
  });
}
