// lib/features/profile/domain/usecases/complete_profile.dart

import '../entities/profile_update_result.dart';
import '../repositories/profile_repository.dart';

class CompleteProfile {
  const CompleteProfile({required this._repository});

  final ProfileRepository _repository;

  Future<ProfileUpdateResult> call(Map<String, dynamic> data) {
    return _repository.completeProfile(data: data);
  }
}
