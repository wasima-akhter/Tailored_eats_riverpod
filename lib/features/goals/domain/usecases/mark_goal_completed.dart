import '../repositories/goals_repository.dart';

class MarkGoalCompleted {
  MarkGoalCompleted({required this._repository});

  final GoalsRepository _repository;

  Future<void> call({required String goalId}) {
    return _repository.markGoalCompleted(goalId: goalId);
  }
}
