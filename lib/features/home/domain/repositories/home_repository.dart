import '../entities/home_consistency.dart';
import '../entities/home_goal.dart';
import '../entities/home_profile.dart';

abstract class HomeRepository {
  Future<HomeProfile> getHomeProfile();

  Future<HomeConsistency> getHomeConsistency();

  Future<List<HomeGoal>> getHomeGoals();

  Future<void> addUserWeight({required double weight});

  Future<void> markGoalCompleted({required String goalId});
}
