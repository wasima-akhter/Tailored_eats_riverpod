// lib/features/profile/domain/repositories/profile_repository.dart

import 'dart:io';

import '../entities/profile_update_result.dart';

abstract class ProfileRepository {
  Future<ProfileUpdateResult> completeProfile({
    required Map<String, dynamic> data,
  });

  Future<ProfileUpdateResult> updateProfile({
    required Map<String, dynamic> data,
    File? profileImage,
  });
}
