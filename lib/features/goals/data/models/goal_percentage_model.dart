import '../../domain/entities/goal.dart';

class GoalPercentageModel {
  final int totalGoals;
  final int completedGoals;
  final int percentage;

  const GoalPercentageModel({
    required this.totalGoals,
    required this.completedGoals,
    required this.percentage,
  });

  factory GoalPercentageModel.fromJson(Map<String, dynamic> json) {
    return GoalPercentageModel(
      totalGoals: _parseInt(json['totalGoals']),
      completedGoals: _parseInt(json['completedGoals']),
      percentage: _parseInt(json['percentage']),
    );
  }

  GoalPercentage toEntity() {
    return GoalPercentage(
      totalGoals: totalGoals,
      completedGoals: completedGoals,
      percentage: percentage,
    );
  }

  static int _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();

    return int.tryParse(value?.toString() ?? '') ?? 0;
  }
}
