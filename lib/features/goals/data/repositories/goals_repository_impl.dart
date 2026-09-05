import '../../domain/entities/goal.dart';
import '../../domain/repositories/goals_repository.dart';
import '../datasources/goals_remote_data_source.dart';
import '../models/goal_model.dart';

class GoalsRepositoryImpl implements GoalsRepository {
  GoalsRepositoryImpl({required this._remoteDataSource});

  final GoalsRemoteDataSource _remoteDataSource;

  @override
  Future<List<Goal>> getGoals() async {
    final response = await _remoteDataSource.getGoals();

    return response
        .map(GoalModel.fromJson)
        .map((model) => model.toEntity())
        .toList();
  }

  @override
  Future<void> markGoalCompleted({required String goalId}) async {
    await _remoteDataSource.markGoalCompleted(goalId: goalId);
  }
}
