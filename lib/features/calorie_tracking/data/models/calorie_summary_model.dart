// lib/features/calorie_tracking/data/models/calorie_summary_model.dart

import '../../domain/entities/calorie_summary.dart';

class CalorieSummaryModel extends CalorieSummary {
  const CalorieSummaryModel({
    required super.id,
    required super.userId,
    required super.calorieGoal,
    required super.consumedCalorie,
    required super.consumedProtein,
    required super.consumedCarb,
    required super.consumedFat,
    required super.percentage,
  });

  factory CalorieSummaryModel.fromJson(Map<String, dynamic> json) {
    return CalorieSummaryModel(
      id: _string(json['_id']),
      userId: _string(json['user']),
      calorieGoal: _int(json['calorieGoal']),
      consumedCalorie: _int(json['consumedCalorie']),
      consumedProtein: _int(json['consumedProtein']),
      consumedCarb: _int(json['consumedCarb']),
      consumedFat: _int(json['consumedFat']),
      percentage: _int(json['percentage']),
    );
  }

  static String _string(dynamic value) {
    return value?.toString() ?? '';
  }

  static int _int(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }
}
