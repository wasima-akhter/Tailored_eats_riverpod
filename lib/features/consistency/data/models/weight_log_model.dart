import '../../domain/entities/weight_log.dart';

class WeightLogModel {
  final String id;
  final double weight;
  final DateTime createdAt;

  const WeightLogModel({
    required this.id,
    required this.weight,
    required this.createdAt,
  });

  factory WeightLogModel.fromJson(Map<String, dynamic> json) {
    return WeightLogModel(
      id: json['_id']?.toString() ?? '',
      weight: _parseDouble(json['weightKg']),
      createdAt: _parseDateTime(json['createdAt']),
    );
  }

  WeightLog toEntity() {
    return WeightLog(id: id, weight: weight, createdAt: createdAt);
  }

  static double _parseDouble(dynamic value) {
    if (value is double) return value;

    if (value is num) {
      return value.toDouble();
    }

    return double.tryParse(value?.toString() ?? '') ?? 0.0;
  }

  static DateTime _parseDateTime(dynamic value) {
    return DateTime.tryParse(value?.toString() ?? '') ??
        DateTime.fromMillisecondsSinceEpoch(0);
  }
}
