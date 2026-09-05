import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/error_handler.dart';
import '../../../home/domain/usecases/get_home_profile.dart';
import 'profile_state.dart';

class ProfileController extends StateNotifier<ProfileState> {
  ProfileController({required this._getHomeProfile})
    : super(const ProfileState());

  final GetHomeProfile _getHomeProfile;

  Future<void> loadProfile() async {
    state = state.copyWith(status: ProfileStatus.loading, clearError: true);

    try {
      final profile = await _getHomeProfile();

      state = state.copyWith(status: ProfileStatus.success, profile: profile);
    } catch (error, stackTrace) {
      debugPrint('[ProfileController] Failed to load profile: $error');
      debugPrintStack(stackTrace: stackTrace);

      final failure = ErrorHandler.handle(error);

      debugPrint('[ProfileController] Failure: ${failure.userMessage}');

      state = state.copyWith(
        status: ProfileStatus.failure,
        errorMessage: 'Unable to load your profile. Please try again.',
      );
    }
  }

  Future<void> retry() {
    return loadProfile();
  }
}
