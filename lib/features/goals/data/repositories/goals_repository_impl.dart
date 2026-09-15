import '../../domain/entities/goal.dart';
import '../../domain/repositories/goals_repository.dart';
import '../datasources/goals_remote_data_source.dart';
import '../models/goal_model.dart';
import '../models/goal_percentage_model.dart';

class GoalsRepositoryImpl implements GoalsRepository {
  GoalsRepositoryImpl({required this._remoteDataSource});

  final GoalsRemoteDataSource _remoteDataSource;

  @override
  Future<Goal> createGoal({
    required String userId,
    required String title,
  }) async {
    final data = await _remoteDataSource.createGoal(
      userId: userId,
      title: title,
    );

    return GoalModel.fromJson(data).toEntity();
  }

  @override
  Future<List<Goal>> getGoals() async {
    final data = await _remoteDataSource.getGoals();

    return data
        .map(GoalModel.fromJson)
        .map((model) => model.toEntity())
        .toList();
  }

  @override
  Future<void> markGoalCompleted({required String goalId}) async {
    await _remoteDataSource.markGoalCompleted(goalId: goalId);
  }

  @override
  Future<Goal> updateGoal({
    required String goalId,
    required String title,
  }) async {
    final data = await _remoteDataSource.updateGoal(
      goalId: goalId,
      title: title,
    );

    return GoalModel.fromJson(data).toEntity();
  }

  @override
  Future<void> deleteGoal({required String goalId}) async {
    await _remoteDataSource.deleteGoal(goalId: goalId);
  }

  @override
  Future<String> changeGoalType({required String mainGoal}) {
    return _remoteDataSource.changeGoalType(mainGoal: mainGoal);
  }

  @override
  Future<GoalPercentage> getCompletedGoalPercentage() async {
    final data = await _remoteDataSource.getCompletedGoalPercentage();

    return GoalPercentageModel.fromJson(data).toEntity();
  }
}
