import '../../domain/entities/goal.dart';

class GoalModel {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;

  const GoalModel({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.createdAt,
  });

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    return GoalModel(
      id: json['_id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      isCompleted: _parseBool(json['isCompleted']),
      createdAt: _parseDateTime(json['createdAt']),
    );
  }

  Goal toEntity() {
    return Goal(
      id: id,
      title: title,
      isCompleted: isCompleted,
      createdAt: createdAt,
    );
  }

  static bool _parseBool(dynamic value) {
    if (value is bool) return value;

    if (value is String) {
      return value.toLowerCase() == 'true';
    }

    return false;
  }

  static DateTime _parseDateTime(dynamic value) {
    return DateTime.tryParse(value?.toString() ?? '') ??
        DateTime.fromMillisecondsSinceEpoch(0);
  }
}
