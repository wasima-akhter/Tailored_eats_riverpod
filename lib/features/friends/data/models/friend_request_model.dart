import '../../domain/entities/friend_request.dart';

class FriendRequestModel {
  final String senderId;
  final String name;
  final String mainGoal;
  final String image;
  final DateTime createdAt;

  const FriendRequestModel({
    required this.senderId,
    required this.name,
    required this.mainGoal,
    required this.image,
    required this.createdAt,
  });

  factory FriendRequestModel.fromJson(Map<String, dynamic> json) {
    return FriendRequestModel(
      senderId: json['senderId']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      mainGoal: json['mainGoal']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      createdAt:
          DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  FriendRequest toEntity() {
    return FriendRequest(
      senderId: senderId,
      name: name,
      mainGoal: mainGoal,
      image: image,
      createdAt: createdAt,
    );
  }
}
