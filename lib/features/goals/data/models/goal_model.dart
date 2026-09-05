import '../../domain/entities/goal.dart';

class GoalModel {
  final String? id;
  final String title;
  final String? description;
  final bool isCompleted;

  const GoalModel({
    this.id,
    required this.title,
    this.description,
    required this.isCompleted,
  });

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    return GoalModel(
      id: json['_id']?.toString() ?? json['id']?.toString(),
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString(),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  Goal toEntity() {
    return Goal(
      id: id ?? '',
      title: title,
      description: description,
      isCompleted: isCompleted,
    );
  }
}
