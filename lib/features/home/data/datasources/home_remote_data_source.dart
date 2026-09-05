import 'package:tailored_eats_riverpod/core/constants/api_constants.dart';

import '../../../../core/network/api_client.dart';
import '../models/home_consistency_model.dart';
import '../models/home_goal_model.dart';
import '../models/home_profile_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeProfileModel> getHomeProfile();

  Future<HomeConsistencyModel> getHomeConsistency();

  Future<List<HomeGoalModel>> getHomeGoals();

  Future<void> addUserWeight({required double weight});

  Future<void> markGoalCompleted({required String goalId});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient _apiClient;

  const HomeRemoteDataSourceImpl({required this._apiClient});

  @override
  Future<HomeProfileModel> getHomeProfile() async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      ApiConstants.userDetail,
    );

    final data = response.data?['data'] as Map<String, dynamic>? ?? {};

    return HomeProfileModel.fromJson(data);
  }

  @override
  Future<HomeConsistencyModel> getHomeConsistency() async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      ApiConstants.userConsistencyDetails,
    );

    return HomeConsistencyModel.fromJson(response.data!);
  }

  @override
  Future<List<HomeGoalModel>> getHomeGoals() async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      ApiConstants.getAllGoal,
    );

    final data = response.data?['data'] as List<dynamic>? ?? [];

    return data
        .whereType<Map<String, dynamic>>()
        .map(HomeGoalModel.fromJson)
        .toList();
  }

  @override
  Future<void> addUserWeight({required double weight}) async {
    await _apiClient.post<Map<String, dynamic>>(
      ApiConstants.addUserWeight,
      data: {'weight': weight},
    );
  }

  @override
  Future<void> markGoalCompleted({required String goalId}) async {
    await _apiClient.patch<Map<String, dynamic>>(
      ApiConstants.markGoalCompleted,
      data: {'goalId': goalId},
    );
  }
}
