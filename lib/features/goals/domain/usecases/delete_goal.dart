import '../repositories/goals_repository.dart';

class DeleteGoal {
  const DeleteGoal({required this.repository});

  final GoalsRepository repository;

  Future<void> call({required String goalId}) {
    return repository.deleteGoal(goalId: goalId);
  }
}
