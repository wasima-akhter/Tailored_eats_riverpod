import '../../domain/entities/profile_update_result.dart';

class ProfileUpdateResultModel extends ProfileUpdateResult {
  const ProfileUpdateResultModel({
    required super.id,
    super.name,
    super.email,
    super.profileImage,
    super.accessToken,
  });

  factory ProfileUpdateResultModel.fromJson(Map<String, dynamic> json) {
    return ProfileUpdateResultModel(
      id: json['_id']?.toString() ?? '',
      name: json['name']?.toString(),
      email: json['email']?.toString(),
      profileImage:
          json['profile_image']?.toString() ?? json['profileImage']?.toString(),
      accessToken: json['accessToken']?.toString(),
    );
  }
}
