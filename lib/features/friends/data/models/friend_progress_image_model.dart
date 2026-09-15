import '../../domain/entities/friend_progress_image.dart';

class FriendProgressImageModel {
  final String id;
  final String url;
  final DateTime createdAt;

  const FriendProgressImageModel({
    required this.id,
    required this.url,
    required this.createdAt,
  });

  factory FriendProgressImageModel.fromJson(Map<String, dynamic> json) {
    return FriendProgressImageModel(
      id: json['_id']?.toString() ?? '',
      url: json['url']?.toString() ?? '',
      createdAt:
          DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  FriendProgressImage toEntity() {
    return FriendProgressImage(id: id, url: url, createdAt: createdAt);
  }
}
