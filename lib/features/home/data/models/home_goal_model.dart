import '../../domain/entities/home_goal.dart';

class HomeGoalModel {
  final String? id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;

  const HomeGoalModel({
    this.id,
    required this.title,
    required this.isCompleted,
    required this.createdAt,
  });

  factory HomeGoalModel.fromJson(Map<String, dynamic> json) {
    return HomeGoalModel(
      id: json['_id'] as String?,
      title: json['title'] as String? ?? '',
      isCompleted: json['isCompleted'] as bool? ?? false,
      createdAt:
          DateTime.tryParse(json['createdAt'] as String? ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  HomeGoal toEntity() {
    return HomeGoal(
      id: id ?? '',
      title: title,
      isCompleted: isCompleted,
      createdAt: createdAt,
    );
  }
}
