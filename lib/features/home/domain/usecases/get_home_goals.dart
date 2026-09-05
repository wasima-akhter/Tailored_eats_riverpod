import '../entities/home_goal.dart';
import '../repositories/home_repository.dart';

class GetHomeGoals {
  final HomeRepository _repository;

  const GetHomeGoals({required this._repository});

  Future<List<HomeGoal>> call() {
    return _repository.getHomeGoals();
  }
}
