class CustomMeal {
  final String id;
  final String userId;
  final String name;
  final String mealType;
  final int calorie;
  final int protein;
  final int carb;
  final int fat;
  final String image;
  final String prepTime;
  final List<String> ingredients;
  final String instructions;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CustomMeal({
    required this.id,
    required this.userId,
    required this.name,
    required this.mealType,
    required this.calorie,
    required this.protein,
    required this.carb,
    required this.fat,
    required this.image,
    required this.prepTime,
    required this.ingredients,
    required this.instructions,
    required this.createdAt,
    required this.updatedAt,
  });
}
