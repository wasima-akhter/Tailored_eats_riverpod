import '../entities/goal.dart';

abstract class GoalsRepository {
  Future<List<Goal>> getGoals();

  Future<void> markGoalCompleted({
    required String goalId,
  });
}
