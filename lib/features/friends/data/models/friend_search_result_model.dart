import '../../domain/entities/friend_search_result.dart';

class FriendSearchResultModel {
  final String id;
  final String name;
  final String mainGoal;
  final String image;

  const FriendSearchResultModel({
    required this.id,
    required this.name,
    required this.mainGoal,
    required this.image,
  });

  factory FriendSearchResultModel.fromJson(Map<String, dynamic> json) {
    return FriendSearchResultModel(
      id: json['_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      mainGoal: json['mainGoal']?.toString() ?? '',
      image: json['profile_image']?.toString() ?? '',
    );
  }

  FriendSearchResult toEntity() {
    return FriendSearchResult(
      id: id,
      name: name,
      mainGoal: mainGoal,
      image: image,
    );
  }
}
