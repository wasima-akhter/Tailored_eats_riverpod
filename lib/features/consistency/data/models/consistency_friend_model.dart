import '../../domain/entities/consistency_friend.dart';

class ConsistencyFriendModel {
  final String userId;
  final String name;
  final int percentage;
  final String? image;

  const ConsistencyFriendModel({
    required this.userId,
    required this.name,
    required this.percentage,
    this.image,
  });

  factory ConsistencyFriendModel.fromJson(Map<String, dynamic> json) {
    return ConsistencyFriendModel(
      userId: json['userId']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      percentage: _parseInt(json['percentage']),
      image: _parseNullableString(json['image']),
    );
  }

  ConsistencyFriend toEntity() {
    return ConsistencyFriend(
      userId: userId,
      name: name,
      percentage: percentage,
      image: image,
    );
  }

  static int _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }

  static String? _parseNullableString(dynamic value) {
    final result = value?.toString().trim();

    if (result == null || result.isEmpty) {
      return null;
    }

    return result;
  }
}
