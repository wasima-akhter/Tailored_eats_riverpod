import '../../domain/entities/home_consistency.dart';
import '../../domain/entities/home_goal.dart';
import '../../domain/entities/home_profile.dart';

class HomeState {
  final bool isLoading;
  final bool isRefreshing;
  final bool isSavingWeight;
  final String? errorMessage;

  final HomeProfile? profile;
  final HomeConsistency? consistency;
  final List<HomeGoal> goals;

  const HomeState({
    this.isLoading = false,
    this.isRefreshing = false,
    this.isSavingWeight = false,
    this.errorMessage,
    this.profile,
    this.consistency,
    this.goals = const [],
  });

  HomeState copyWith({
    bool? isLoading,
    bool? isRefreshing,
    bool? isSavingWeight,
    String? errorMessage,
    HomeProfile? profile,
    HomeConsistency? consistency,
    List<HomeGoal>? goals,
    bool clearError = false,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isSavingWeight: isSavingWeight ?? this.isSavingWeight,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      profile: profile ?? this.profile,
      consistency: consistency ?? this.consistency,
      goals: goals ?? this.goals,
    );
  }
}
