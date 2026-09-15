import '../../../home/domain/entities/home_profile.dart';
import '../../domain/entities/profile_update_result.dart';
import 'profile_api_state.dart';

enum ProfileStatus { initial, loading, success, failure }

class ProfileState {
  final ProfileStatus status;
  final HomeProfile? profile;
  final String? errorMessage;

  final ProfileApiState<ProfileUpdateResult> completeProfileState;
  final ProfileApiState<ProfileUpdateResult> updateProfileState;

  const ProfileState({
    this.status = ProfileStatus.initial,
    this.profile,
    this.errorMessage,
    this.completeProfileState = const ProfileApiState.initial(),
    this.updateProfileState = const ProfileApiState.initial(),
  });

  ProfileState copyWith({
    ProfileStatus? status,
    HomeProfile? profile,
    String? errorMessage,
    bool clearError = false,
    ProfileApiState<ProfileUpdateResult>? completeProfileState,
    ProfileApiState<ProfileUpdateResult>? updateProfileState,
  }) {
    return ProfileState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      completeProfileState: completeProfileState ?? this.completeProfileState,
      updateProfileState: updateProfileState ?? this.updateProfileState,
    );
  }
}
