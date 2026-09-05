import '../../../../core/network/api_client.dart';

class GoalsRemoteDataSource {
  GoalsRemoteDataSource({required this._apiClient});

  final ApiClient _apiClient;

  Future<List<Map<String, dynamic>>> getGoals() async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      '/goal/get-all-goal',
    );

    final data = response.data;

    if (data == null) {
      throw Exception('Empty response from goals API.');
    }

    final goals = data['data'];

    if (goals is! List) {
      throw Exception('Invalid goals response.');
    }

    return goals.whereType<Map<String, dynamic>>().toList();
  }

  Future<void> markGoalCompleted({required String goalId}) async {
    await _apiClient.patch<Map<String, dynamic>>(
      '/goal/mark-goal-completed',
      data: {'goalId': goalId},
    );
  }
}
