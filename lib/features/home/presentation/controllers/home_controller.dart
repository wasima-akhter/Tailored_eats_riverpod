import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/error_handler.dart';
import '../../domain/entities/home_goal.dart';
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
    state = state.copyWith(
      isLoading: true,
      clearProfileError: true,
      clearConsistencyError: true,
      clearGoalsError: true,
      clearActionError: true,
    );

    await Future.wait([_loadProfile(), _loadConsistency(), _loadGoals()]);

    state = state.copyWith(isLoading: false);
  }

  Future<void> _loadProfile() async {
    try {
      final profile = await _getHomeProfile();

      state = state.copyWith(profile: profile, clearProfileError: true);
    } catch (error) {
      state = state.copyWith(profileError: ErrorHandler.message(error));
    }
  }

  Future<void> _loadConsistency() async {
    try {
      final consistency = await _getHomeConsistency();

      state = state.copyWith(
        consistency: consistency,
        clearConsistencyError: true,
      );
    } catch (error) {
      state = state.copyWith(consistencyError: ErrorHandler.message(error));
    }
  }

  Future<void> _loadGoals() async {
    try {
      final goals = await _getHomeGoals();

      state = state.copyWith(goals: goals, clearGoalsError: true);
    } catch (error) {
      state = state.copyWith(goalsError: ErrorHandler.message(error));
    }
  }

  Future<void> refreshHome() async {
    state = state.copyWith(
      isRefreshing: true,
      clearProfileError: true,
      clearConsistencyError: true,
      clearGoalsError: true,
    );

    await Future.wait([_loadProfile(), _loadConsistency(), _loadGoals()]);

    state = state.copyWith(isRefreshing: false);
  }

  Future<bool> saveWeight({required double weight}) async {
    state = state.copyWith(isSavingWeight: true, clearActionError: true);

    try {
      await _addUserWeight(weight: weight);

      state = state.copyWith(isSavingWeight: false, clearActionError: true);

      return true;
    } catch (error) {
      state = state.copyWith(
        isSavingWeight: false,
        actionError: ErrorHandler.message(error),
      );

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

      state = state.copyWith(goals: updatedGoals, clearActionError: true);

      return true;
    } catch (error) {
      state = state.copyWith(actionError: ErrorHandler.message(error));

      return false;
    }
  }
}
