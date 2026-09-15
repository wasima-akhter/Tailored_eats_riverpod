import '../entities/goal.dart';
import '../repositories/goals_repository.dart';

class CreateGoal {
  const CreateGoal({required this.repository});

  final GoalsRepository repository;

  Future<Goal> call({required String userId, required String title}) {
    return repository.createGoal(userId: userId, title: title);
  }
}
