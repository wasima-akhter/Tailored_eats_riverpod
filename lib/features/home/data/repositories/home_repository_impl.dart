import '../../domain/entities/home_consistency.dart';
import '../../domain/entities/home_goal.dart';
import '../../domain/entities/home_profile.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  const HomeRepositoryImpl({required this._remoteDataSource});

  @override
  Future<HomeProfile> getHomeProfile() async {
    final response = await _remoteDataSource.getHomeProfile();

    return response.toEntity();
  }

  @override
  Future<HomeConsistency> getHomeConsistency() async {
    final response = await _remoteDataSource.getHomeConsistency();

    return response.toEntity();
  }

  @override
  Future<List<HomeGoal>> getHomeGoals() async {
    final response = await _remoteDataSource.getHomeGoals();

    return response.map((goal) => goal.toEntity()).toList();
  }

  @override
  Future<void> addUserWeight({required double weight}) {
    return _remoteDataSource.addUserWeight(weight: weight);
  }

  @override
  Future<void> markGoalCompleted({required String goalId}) {
    return _remoteDataSource.markGoalCompleted(goalId: goalId);
  }
}
