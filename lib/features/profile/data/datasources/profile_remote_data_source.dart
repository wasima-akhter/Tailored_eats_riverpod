// lib/features/profile/data/datasources/profile_remote_data_source.dart

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tailored_eats_riverpod/core/constants/api_constants.dart';

import '../../../../core/network/api_client.dart';
import '../models/profile_update_result_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileUpdateResultModel> completeProfile({
    required Map<String, dynamic> data,
  });

  Future<ProfileUpdateResultModel> updateProfile({
    required Map<String, dynamic> data,
    File? profileImage,
  });
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  const ProfileRemoteDataSourceImpl({required this._apiClient});

  final ApiClient _apiClient;

  @override
  Future<ProfileUpdateResultModel> completeProfile({
    required Map<String, dynamic> data,
  }) async {
    final response = await _apiClient.patch<Map<String, dynamic>>(
      ApiConstants.completeProfile,
      data: data,
    );

    final responseData = response.data?['data'] as Map<String, dynamic>? ?? {};

    final userData = responseData['user'] as Map<String, dynamic>? ?? {};

    return ProfileUpdateResultModel.fromJson({
      ...userData,
      'accessToken': responseData['accessToken'],
    });
  }

  @override
  Future<ProfileUpdateResultModel> updateProfile({
    required Map<String, dynamic> data,
    File? profileImage,
  }) async {
    final formData = FormData();

    data.forEach((key, value) {
      if (value != null) {
        formData.fields.add(MapEntry(key, value.toString()));
      }
    });

    if (profileImage != null) {
      formData.files.add(
        MapEntry(
          'profile_image',
          await MultipartFile.fromFile(profileImage.path),
        ),
      );
    }

    final response = await _apiClient.patch<Map<String, dynamic>>(
      ApiConstants.updateProfile,
      data: formData,
    );

    final responseData = response.data?['data'] as Map<String, dynamic>? ?? {};

    return ProfileUpdateResultModel.fromJson(responseData);
  }
}
