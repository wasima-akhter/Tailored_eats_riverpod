import '../repositories/goals_repository.dart';

class ChangeGoalType {
  const ChangeGoalType({required this.repository});

  final GoalsRepository repository;

  Future<String> call({required String mainGoal}) {
    return repository.changeGoalType(mainGoal: mainGoal);
  }
}
