import '../../domain/entities/meal.dart';
import '../../domain/entities/meal_ingredient.dart';

class MealModel {
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
  final List<MealIngredientModel> ingredients;
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

  const MealModel({
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

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'],
      mealName: json['meal_name'] as String? ?? '',
      mealType: json['meal_type'] as String? ?? '',
      macroProfile: json['macro_profile'] as String? ?? '',
      cuisine: json['cuisine'] as String? ?? '',
      description: json['description'] as String? ?? '',
      caloriesKcal: (json['calories_kcal'] as num?)?.toDouble() ?? 0.0,
      proteinG: (json['protein_g'] as num?)?.toDouble() ?? 0.0,
      carbsG: (json['carbs_g'] as num?)?.toDouble() ?? 0.0,
      fatG: (json['fat_g'] as num?)?.toDouble() ?? 0.0,
      prepTimeMinutes: (json['prep_time_minutes'] as num?)?.toInt() ?? 0,
      cookTimeMinutes: (json['cook_time_minutes'] as num?)?.toInt() ?? 0,
      totalTimeMinutes: (json['total_time_minutes'] as num?)?.toInt() ?? 0,
      costGbp: (json['cost_gbp'] as num?)?.toDouble() ?? 0.0,
      difficulty: json['difficulty'] as String? ?? '',
      ingredients: _parseIngredients(json['ingredients']),
      instructions: _parseStringList(json['instructions']),
      tips: json['tips'] as String?,
      storage: json['storage'] as String?,
      dietaryTags: _parseStringList(json['dietary_tags']),
      allergens: _parseStringList(json['allergens']),
      imageUrl: json['image_url'] as String?,
      userId: json['user_id'] as String?,
      dataSource: json['data_source'] as String?,
      isFavorite: json['is_favorite'] as bool? ?? false,
      createdAt: _parseDateTime(json['created_at']),
    );
  }

  Meal toEntity() {
    return Meal(
      id: id,
      mealName: mealName,
      mealType: mealType,
      macroProfile: macroProfile,
      cuisine: cuisine,
      description: description,
      caloriesKcal: caloriesKcal,
      proteinG: proteinG,
      carbsG: carbsG,
      fatG: fatG,
      prepTimeMinutes: prepTimeMinutes,
      cookTimeMinutes: cookTimeMinutes,
      totalTimeMinutes: totalTimeMinutes,
      costGbp: costGbp,
      difficulty: difficulty,
      ingredients: ingredients
          .map((ingredient) => ingredient.toEntity())
          .toList(),
      instructions: instructions,
      tips: tips,
      storage: storage,
      dietaryTags: dietaryTags,
      allergens: allergens,
      imageUrl: imageUrl,
      userId: userId,
      dataSource: dataSource,
      isFavorite: isFavorite,
      createdAt: createdAt,
    );
  }

  static List<MealIngredientModel> _parseIngredients(dynamic value) {
    if (value is! List) {
      return [];
    }

    return value
        .whereType<Map<String, dynamic>>()
        .map(MealIngredientModel.fromJson)
        .toList();
  }

  static List<String> _parseStringList(dynamic value) {
    if (value is! List) {
      return [];
    }

    return value.whereType<String>().toList();
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value is! String || value.isEmpty) {
      return null;
    }

    return DateTime.tryParse(value);
  }
}

class MealIngredientModel {
  final String item;
  final String quantity;
  final double calories;
  final double proteinG;
  final double carbsG;
  final double fatG;

  const MealIngredientModel({
    required this.item,
    required this.quantity,
    required this.calories,
    required this.proteinG,
    required this.carbsG,
    required this.fatG,
  });

  factory MealIngredientModel.fromJson(Map<String, dynamic> json) {
    return MealIngredientModel(
      item: json['item'] as String? ?? '',
      quantity: json['quantity'] as String? ?? '',
      calories: (json['calories'] as num?)?.toDouble() ?? 0.0,
      proteinG: (json['protein_g'] as num?)?.toDouble() ?? 0.0,
      carbsG: (json['carbs_g'] as num?)?.toDouble() ?? 0.0,
      fatG: (json['fat_g'] as num?)?.toDouble() ?? 0.0,
    );
  }

  MealIngredient toEntity() {
    return MealIngredient(
      item: item,
      quantity: quantity,
      calories: calories,
      proteinG: proteinG,
      carbsG: carbsG,
      fatG: fatG,
    );
  }
}
