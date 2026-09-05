import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/home_consistency.dart';
import '../../domain/entities/home_goal.dart';
import '../../domain/entities/home_profile.dart';
import '../../domain/usecases/add_user_weight.dart';
import '../../domain/usecases/get_home_consistency.dart';
import '../../domain/usecases/get_home_goals.dart';
import '../../domain/usecases/get_home_profile.dart';
import '../../domain/usecases/mark_goal_completed.dart';
import '../providers/home_provider.dart';
import 'home_state.dart';

class HomeController extends Notifier<HomeState> {
  late final GetHomeProfile _getHomeProfile;
  late final GetHomeConsistency _getHomeConsistency;
  late final GetHomeGoals _getHomeGoals;
  late final AddUserWeight _addUserWeight;
  late final MarkGoalCompleted _markGoalCompleted;

  @override
  HomeState build() {
    _getHomeProfile = ref.read(getHomeProfileProvider);
    _getHomeConsistency = ref.read(getHomeConsistencyProvider);
    _getHomeGoals = ref.read(getHomeGoalsProvider);
    _addUserWeight = ref.read(addUserWeightProvider);
    _markGoalCompleted = ref.read(markGoalCompletedProvider);

    return const HomeState();
  }

  Future<void> loadHome() async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final results = await Future.wait([
        _getHomeProfile(),
        _getHomeConsistency(),
        _getHomeGoals(),
      ]);

      state = state.copyWith(
        isLoading: false,
        profile: results[0] as HomeProfile,
        consistency: results[1] as HomeConsistency,
        goals: results[2] as List<HomeGoal>,
        clearError: true,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> refreshHome() async {
    state = state.copyWith(isRefreshing: true, clearError: true);

    try {
      final results = await Future.wait([
        _getHomeProfile(),
        _getHomeConsistency(),
        _getHomeGoals(),
      ]);

      state = state.copyWith(
        isRefreshing: false,
        profile: results[0] as HomeProfile,
        consistency: results[1] as HomeConsistency,
        goals: results[2] as List<HomeGoal>,
        clearError: true,
      );
    } catch (e) {
      state = state.copyWith(isRefreshing: false, errorMessage: e.toString());
    }
  }

  Future<bool> saveWeight({required double weight}) async {
    state = state.copyWith(isSavingWeight: true, clearError: true);

    try {
      await _addUserWeight(weight: weight);

      state = state.copyWith(isSavingWeight: false, clearError: true);

      return true;
    } catch (e) {
      state = state.copyWith(isSavingWeight: false, errorMessage: e.toString());

      return false;
    }
  }

  Future<bool> markGoalCompleted({required String goalId}) async {
    try {
      await _markGoalCompleted(goalId: goalId);

      final updatedGoals = state.goals.map((goal) {
        if (goal.id == goalId) {
          return HomeGoal(
            id: goal.id,
            title: goal.title,
            isCompleted: true,
            createdAt: goal.createdAt,
          );
        }

        return goal;
      }).toList();

      state = state.copyWith(goals: updatedGoals, clearError: true);

      return true;
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());

      return false;
    }
  }
}
