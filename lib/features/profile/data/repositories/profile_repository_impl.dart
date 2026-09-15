// lib/features/profile/data/repositories/profile_repository_impl.dart

import 'dart:io';

import '../../domain/entities/profile_update_result.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl({required this._remoteDataSource});

  final ProfileRemoteDataSource _remoteDataSource;

  @override
  Future<ProfileUpdateResult> completeProfile({
    required Map<String, dynamic> data,
  }) {
    return _remoteDataSource.completeProfile(data: data);
  }

  @override
  Future<ProfileUpdateResult> updateProfile({
    required Map<String, dynamic> data,
    File? profileImage,
  }) {
    return _remoteDataSource.updateProfile(
      data: data,
      profileImage: profileImage,
    );
  }
}
