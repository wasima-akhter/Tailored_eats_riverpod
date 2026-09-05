import '../repositories/home_repository.dart';

class MarkGoalCompleted {
  final HomeRepository _repository;

  const MarkGoalCompleted({required this._repository});

  Future<void> call({required String goalId}) {
    return _repository.markGoalCompleted(goalId: goalId);
  }
}
