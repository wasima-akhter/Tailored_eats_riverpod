import '../entities/goal.dart';
import '../repositories/goals_repository.dart';

class GetGoals {
  GetGoals({required this._repository});

  final GoalsRepository _repository;

  Future<List<Goal>> call() {
    return _repository.getGoals();
  }
}
