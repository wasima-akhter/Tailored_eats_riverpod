import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/network_providers.dart';
import '../../data/datasources/goals_remote_data_source.dart';
import '../../data/repositories/goals_repository_impl.dart';
import '../../domain/repositories/goals_repository.dart';
import '../../domain/usecases/change_goal_type.dart';
import '../../domain/usecases/create_goal.dart';
import '../../domain/usecases/delete_goal.dart';
import '../../domain/usecases/get_completed_goal_percentage.dart';
import '../../domain/usecases/get_goals.dart';
import '../../domain/usecases/mark_goal_completed.dart';
import '../../domain/usecases/update_goal.dart';
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

// -----------------------------------------------------------------------------
// Use Cases
// -----------------------------------------------------------------------------

final getGoalsProvider = Provider<GetGoals>((ref) {
  return GetGoals(repository: ref.watch(goalsRepositoryProvider));
});

final markGoalCompletedProvider = Provider<MarkGoalCompleted>((ref) {
  return MarkGoalCompleted(repository: ref.watch(goalsRepositoryProvider));
});

final createGoalProvider = Provider<CreateGoal>((ref) {
  return CreateGoal(repository: ref.watch(goalsRepositoryProvider));
});

final updateGoalProvider = Provider<UpdateGoal>((ref) {
  return UpdateGoal(repository: ref.watch(goalsRepositoryProvider));
});

final deleteGoalProvider = Provider<DeleteGoal>((ref) {
  return DeleteGoal(repository: ref.watch(goalsRepositoryProvider));
});

final changeGoalTypeProvider = Provider<ChangeGoalType>((ref) {
  return ChangeGoalType(repository: ref.watch(goalsRepositoryProvider));
});

final getCompletedGoalPercentageProvider = Provider<GetCompletedGoalPercentage>(
  (ref) {
    return GetCompletedGoalPercentage(
      repository: ref.watch(goalsRepositoryProvider),
    );
  },
);

// -----------------------------------------------------------------------------
// Controller
// -----------------------------------------------------------------------------

final goalsControllerProvider =
    StateNotifierProvider<GoalsController, GoalsState>((ref) {
      return GoalsController(
        getGoals: ref.watch(getGoalsProvider),
        markGoalCompleted: ref.watch(markGoalCompletedProvider),
        createGoal: ref.watch(createGoalProvider),
        updateGoal: ref.watch(updateGoalProvider),
        deleteGoal: ref.watch(deleteGoalProvider),
        changeGoalType: ref.watch(changeGoalTypeProvider),
        getCompletedGoalPercentage: ref.watch(
          getCompletedGoalPercentageProvider,
        ),
      );
    });
