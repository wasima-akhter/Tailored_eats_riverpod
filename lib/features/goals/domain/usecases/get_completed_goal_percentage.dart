import '../entities/goal.dart';
import '../repositories/goals_repository.dart';

class GetCompletedGoalPercentage {
  const GetCompletedGoalPercentage({required this.repository});

  final GoalsRepository repository;

  Future<GoalPercentage> call() {
    return repository.getCompletedGoalPercentage();
  }
}
