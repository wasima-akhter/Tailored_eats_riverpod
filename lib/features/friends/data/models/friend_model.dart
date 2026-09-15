import '../../domain/entities/friend.dart';

class FriendModel {
  final String friendId;
  final String name;
  final String mainGoal;
  final String image;
  final int percentage;

  const FriendModel({
    required this.friendId,
    required this.name,
    required this.mainGoal,
    required this.image,
    required this.percentage,
  });

  factory FriendModel.fromJson(Map<String, dynamic> json) {
    return FriendModel(
      friendId: json['friendId']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      mainGoal: json['mainGoal']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      percentage: _parseInt(json['percentage']),
    );
  }

  Friend toEntity() {
    return Friend(
      friendId: friendId,
      name: name,
      mainGoal: mainGoal,
      image: image,
      percentage: percentage,
    );
  }

  static int _parseInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }
}
