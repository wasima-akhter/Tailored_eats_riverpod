import '../../domain/entities/friend_detail.dart';
import 'friend_consistency_model.dart';
import 'friend_progress_image_model.dart';

class FriendDetailModel {
  final String id;
  final String name;
  final String mainGoal;
  final List<FriendConsistencyModel> consistency;
  final List<FriendProgressImageModel> images;

  const FriendDetailModel({
    required this.id,
    required this.name,
    required this.mainGoal,
    required this.consistency,
    required this.images,
  });

  factory FriendDetailModel.fromJson(Map<String, dynamic> json) {
    final details = json['details'] is Map<String, dynamic>
        ? json['details'] as Map<String, dynamic>
        : <String, dynamic>{};

    final consistencyData = details['consistency'];

    final imagesData = json['images'];

    return FriendDetailModel(
      id: details['_id']?.toString() ?? '',
      name: details['name']?.toString() ?? '',
      mainGoal: details['mainGoal']?.toString() ?? '',
      consistency: consistencyData is List
          ? consistencyData
                .whereType<Map<String, dynamic>>()
                .map(FriendConsistencyModel.fromJson)
                .toList()
          : const [],
      images: imagesData is List
          ? imagesData
                .whereType<Map<String, dynamic>>()
                .map(FriendProgressImageModel.fromJson)
                .toList()
          : const [],
    );
  }

  FriendDetail toEntity() {
    return FriendDetail(
      id: id,
      name: name,
      mainGoal: mainGoal,
      consistency: consistency.map((item) => item.toEntity()).toList(),
      images: images.map((item) => item.toEntity()).toList(),
    );
  }
}
