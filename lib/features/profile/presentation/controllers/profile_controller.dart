// lib/features/profile/presentation/controllers/profile_controller.dart

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/error_handler.dart';
import '../../../authentication/domain/entities/auth_session.dart';
import '../../../authentication/domain/entities/auth_user.dart';
import '../../../home/domain/usecases/get_home_profile.dart';
import '../../domain/usecases/complete_profile.dart';
import '../../domain/usecases/update_profile.dart';
import 'profile_api_state.dart';
import 'profile_state.dart';

class ProfileController extends StateNotifier<ProfileState> {
  ProfileController({
    required this._getHomeProfile,
    required this._completeProfile,
    required this._updateProfile,
    required this._authenticate,
  }) : super(const ProfileState());

  final GetHomeProfile _getHomeProfile;
  final CompleteProfile _completeProfile;
  final UpdateProfile _updateProfile;
  final Future<void> Function(AuthSession session) _authenticate;

  Future<void> loadProfile() async {
    state = state.copyWith(status: ProfileStatus.loading, clearError: true);

    try {
      final profile = await _getHomeProfile();

      state = state.copyWith(status: ProfileStatus.success, profile: profile);
    } catch (error, stackTrace) {
      debugPrint('[ProfileController] Failed to load profile: $error');
      debugPrintStack(stackTrace: stackTrace);

      ErrorHandler.handle(error);

      state = state.copyWith(
        status: ProfileStatus.failure,
        errorMessage: 'Unable to load your profile. Please try again.',
      );
    }
  }

  Future<void> completeUserProfile({required Map<String, dynamic> data}) async {
    state = state.copyWith(
      completeProfileState: const ProfileApiState.loading(),
    );

    try {
      final result = await _completeProfile(data);

      final accessToken = result.accessToken;

      if (accessToken == null || accessToken.isEmpty) {
        throw Exception('Access token was not returned.');
      }

      final user = AuthUser(
        id: result.id,
        name: result.name ?? '',
        email: result.email ?? '',
      );

      final session = AuthSession(user: user, accessToken: accessToken);

      await _authenticate(session);

      state = state.copyWith(
        completeProfileState: ProfileApiState.success(result),
      );
    } catch (error, stackTrace) {
      debugPrint('[ProfileController] Complete profile failed: $error');
      debugPrintStack(stackTrace: stackTrace);

      final failure = ErrorHandler.handle(error);

      state = state.copyWith(
        completeProfileState: ProfileApiState.failure(failure.userMessage),
      );
    }
  }

  Future<void> updateUserProfile({
    required Map<String, dynamic> data,
    File? profileImage,
  }) async {
    state = state.copyWith(updateProfileState: const ProfileApiState.loading());

    try {
      final result = await _updateProfile(
        data: data,
        profileImage: profileImage,
      );

      state = state.copyWith(
        updateProfileState: ProfileApiState.success(result),
      );

      await loadProfile();
    } catch (error, stackTrace) {
      debugPrint('[ProfileController] Update profile failed: $error');
      debugPrintStack(stackTrace: stackTrace);

      final failure = ErrorHandler.handle(error);

      state = state.copyWith(
        updateProfileState: ProfileApiState.failure(failure.userMessage),
      );
    }
  }

  Future<void> retry() {
    return loadProfile();
  }
}
