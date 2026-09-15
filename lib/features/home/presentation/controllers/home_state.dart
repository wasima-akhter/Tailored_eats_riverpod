import '../../domain/entities/home_consistency.dart';
import '../../domain/entities/home_goal.dart';
import '../../domain/entities/home_profile.dart';

class HomeState {
  const HomeState({
    this.profile,
    this.consistency,
    this.goals = const [],
    this.isLoading = false,
    this.isRefreshing = false,
    this.isSavingWeight = false,
    this.profileError,
    this.consistencyError,
    this.goalsError,
    this.actionError,
  });

  final HomeProfile? profile;
  final HomeConsistency? consistency;
  final List<HomeGoal> goals;

  final bool isLoading;
  final bool isRefreshing;
  final bool isSavingWeight;

  final String? profileError;
  final String? consistencyError;
  final String? goalsError;
  final String? actionError;

  bool get hasAnyContent {
    return profile != null || consistency != null || goals.isNotEmpty;
  }

  bool get hasAnyError {
    return profileError != null ||
        consistencyError != null ||
        goalsError != null ||
        actionError != null;
  }

  HomeState copyWith({
    HomeProfile? profile,
    bool clearProfile = false,
    HomeConsistency? consistency,
    bool clearConsistency = false,
    List<HomeGoal>? goals,
    bool? isLoading,
    bool? isRefreshing,
    bool? isSavingWeight,
    String? profileError,
    bool clearProfileError = false,
    String? consistencyError,
    bool clearConsistencyError = false,
    String? goalsError,
    bool clearGoalsError = false,
    String? actionError,
    bool clearActionError = false,
  }) {
    return HomeState(
      profile: clearProfile ? null : profile ?? this.profile,
      consistency: clearConsistency ? null : consistency ?? this.consistency,
      goals: goals ?? this.goals,
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isSavingWeight: isSavingWeight ?? this.isSavingWeight,
      profileError: clearProfileError
          ? null
          : profileError ?? this.profileError,
      consistencyError: clearConsistencyError
          ? null
          : consistencyError ?? this.consistencyError,
      goalsError: clearGoalsError ? null : goalsError ?? this.goalsError,
      actionError: clearActionError ? null : actionError ?? this.actionError,
    );
  }
}
