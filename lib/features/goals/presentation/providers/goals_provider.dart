import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/network_providers.dart';
import '../../data/datasources/goals_remote_data_source.dart';
import '../../data/repositories/goals_repository_impl.dart';
import '../../domain/repositories/goals_repository.dart';
import '../../domain/usecases/get_goals.dart';
import '../../domain/usecases/mark_goal_completed.dart';
import '../controllers/goals_controller.dart';
import '../controllers/goals_state.dart';

final goalsRemoteDataSourceProvider = Provider<GoalsRemoteDataSource>((ref) {
  return GoalsRemoteDataSource(apiClient: ref.watch(apiClientProvider));
});

final goalsRepositoryProvider = Provider<GoalsRepository>((ref) {
  return GoalsRepositoryImpl(
    remoteDataSource: ref.watch(goalsRemoteDataSourceProvider),
  );
});

final getGoalsProvider = Provider<GetGoals>((ref) {
  return GetGoals(repository: ref.watch(goalsRepositoryProvider));
});

final markGoalCompletedProvider = Provider<MarkGoalCompleted>((ref) {
  return MarkGoalCompleted(repository: ref.watch(goalsRepositoryProvider));
});

final goalsControllerProvider =
    StateNotifierProvider<GoalsController, GoalsState>((ref) {
      return GoalsController(
        getGoals: ref.watch(getGoalsProvider),
        markGoalCompleted: ref.watch(markGoalCompletedProvider),
      );
    });
