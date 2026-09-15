import '../../domain/entities/custom_meal.dart';

class CustomMealModel extends CustomMeal {
  const CustomMealModel({
    required super.id,
    required super.userId,
    required super.name,
    required super.mealType,
    required super.calorie,
    required super.protein,
    required super.carb,
    required super.fat,
    required super.image,
    required super.prepTime,
    required super.ingredients,
    required super.instructions,
    required super.createdAt,
    required super.updatedAt,
  });

  factory CustomMealModel.fromJson(Map<String, dynamic> json) {
    return CustomMealModel(
      id: _string(json['_id']),
      userId: _string(json['user']),
      name: _string(json['name']),
      mealType: _string(json['mealType']),
      calorie: _int(json['calorie']),
      protein: _int(json['protein']),
      carb: _int(json['carb']),
      fat: _int(json['fat']),
      image: _string(json['image']),
      prepTime: _string(json['prepTime']),
      ingredients: _stringList(json['ingredients']),
      instructions: _string(json['instructions']),
      createdAt: _dateTime(json['createdAt']),
      updatedAt: _dateTime(json['updatedAt']),
    );
  }

  static String _string(dynamic value) {
    return value?.toString().trim() ?? '';
  }

  static int _int(dynamic value) {
    if (value is int) {
      return value;
    }

    if (value is num) {
      return value.toInt();
    }

    return int.tryParse(value?.toString() ?? '') ?? 0;
  }

  static List<String> _stringList(dynamic value) {
    if (value is! List) {
      return const [];
    }

    return value
        .map((item) => item?.toString().trim() ?? '')
        .where((item) => item.isNotEmpty)
        .toList();
  }

  static DateTime _dateTime(dynamic value) {
    if (value is DateTime) {
      return value;
    }

    return DateTime.tryParse(value?.toString() ?? '') ??
        DateTime.fromMillisecondsSinceEpoch(0);
  }
}
