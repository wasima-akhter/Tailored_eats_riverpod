import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/home_repository_provider.dart';
import '../../domain/usecases/add_user_weight.dart';
import '../../domain/usecases/get_home_consistency.dart';
import '../../domain/usecases/get_home_goals.dart';
import '../../domain/usecases/get_home_profile.dart';
import '../../domain/usecases/mark_goal_completed.dart';
import '../controllers/home_controller.dart';
import '../controllers/home_state.dart';

final getHomeProfileProvider = Provider<GetHomeProfile>((ref) {
  return GetHomeProfile(repository: ref.read(homeRepositoryProvider));
});

final getHomeConsistencyProvider = Provider<GetHomeConsistency>((ref) {
  return GetHomeConsistency(repository: ref.read(homeRepositoryProvider));
});

final getHomeGoalsProvider = Provider<GetHomeGoals>((ref) {
  return GetHomeGoals(repository: ref.read(homeRepositoryProvider));
});

final addUserWeightProvider = Provider<AddUserWeight>((ref) {
  return AddUserWeight(repository: ref.read(homeRepositoryProvider));
});

final markGoalCompletedProvider = Provider<MarkGoalCompleted>((ref) {
  return MarkGoalCompleted(repository: ref.read(homeRepositoryProvider));
});

final homeControllerProvider = NotifierProvider<HomeController, HomeState>(
  HomeController.new,
);
