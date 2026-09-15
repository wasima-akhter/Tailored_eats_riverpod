// lib/features/calorie_tracking/domain/entities/calorie_summary.dart

class CalorieSummary {
  final String id;
  final String userId;
  final int calorieGoal;
  final int consumedCalorie;
  final int consumedProtein;
  final int consumedCarb;
  final int consumedFat;
  final int percentage;

  const CalorieSummary({
    required this.id,
    required this.userId,
    required this.calorieGoal,
    required this.consumedCalorie,
    required this.consumedProtein,
    required this.consumedCarb,
    required this.consumedFat,
    required this.percentage,
  });
}
