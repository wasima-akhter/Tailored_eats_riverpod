import '../entities/goal.dart';

abstract class GoalsRepository {
  Future<Goal> createGoal({required String userId, required String title});

  Future<List<Goal>> getGoals();

  Future<void> markGoalCompleted({required String goalId});

  Future<Goal> updateGoal({required String goalId, required String title});

  Future<void> deleteGoal({required String goalId});

  Future<String> changeGoalType({required String mainGoal});

  Future<GoalPercentage> getCompletedGoalPercentage();
}
