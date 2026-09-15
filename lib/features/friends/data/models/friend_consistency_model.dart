import '../../domain/entities/friend_consistency.dart';

class FriendConsistencyModel {
  final int completed;
  final DateTime createdAt;

  const FriendConsistencyModel({
    required this.completed,
    required this.createdAt,
  });

  factory FriendConsistencyModel.fromJson(Map<String, dynamic> json) {
    return FriendConsistencyModel(
      completed: _parseInt(json['completed']),
      createdAt:
          DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  FriendConsistency toEntity() {
    return FriendConsistency(completed: completed, createdAt: createdAt);
  }

  static int _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }
}
