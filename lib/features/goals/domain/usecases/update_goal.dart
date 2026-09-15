import '../entities/goal.dart';
import '../repositories/goals_repository.dart';

class UpdateGoal {
  const UpdateGoal({required this.repository});

  final GoalsRepository repository;

  Future<Goal> call({required String goalId, required String title}) {
    return repository.updateGoal(goalId: goalId, title: title);
  }
}
