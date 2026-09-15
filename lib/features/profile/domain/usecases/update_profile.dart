// lib/features/profile/domain/usecases/update_profile.dart

import 'dart:io';

import '../entities/profile_update_result.dart';
import '../repositories/profile_repository.dart';

class UpdateProfile {
  const UpdateProfile({required this._repository});

  final ProfileRepository _repository;

  Future<ProfileUpdateResult> call({
    required Map<String, dynamic> data,
    File? profileImage,
  }) {
    return _repository.updateProfile(data: data, profileImage: profileImage);
  }
}
