import '../../domain/entities/consistency_day.dart';

class ConsistencyDayModel {
  final int completed;
  final DateTime createdAt;

  const ConsistencyDayModel({required this.completed, required this.createdAt});

  factory ConsistencyDayModel.fromJson(Map<String, dynamic> json) {
    return ConsistencyDayModel(
      completed: _parseInt(json['completed']),
      createdAt: _parseDateTime(json['createdAt']),
    );
  }

  ConsistencyDay toEntity() {
    return ConsistencyDay(completed: completed, createdAt: createdAt);
  }

  static int _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }

  static DateTime _parseDateTime(dynamic value) {
    return DateTime.tryParse(value?.toString() ?? '') ??
        DateTime.fromMillisecondsSinceEpoch(0);
  }
}
