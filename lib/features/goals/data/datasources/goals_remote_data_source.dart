import '../../../../core/network/api_client.dart';

class GoalsRemoteDataSource {
  GoalsRemoteDataSource({required this._apiClient});

  final ApiClient _apiClient;

  // ------------------------------------------------------------
  // 6.1 Create New Custom Goal
  // ------------------------------------------------------------
  Future<Map<String, dynamic>> createGoal({
    required String userId,
    required String title,
  }) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      '/goal/create-new-goal',
      data: {'userId': userId, 'title': title},
    );

    final data = response.data;

    if (data == null) {
      throw Exception('Empty response from create goal API.');
    }

    final goal = data['data'];

    if (goal is! Map<String, dynamic>) {
      throw Exception('Invalid create goal response.');
    }

    return goal;
  }

  // ------------------------------------------------------------
  // 6.2 Get All Goals
  // ------------------------------------------------------------
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

  // ------------------------------------------------------------
  // 6.3 Mark Goal as Completed
  // ------------------------------------------------------------
  Future<Map<String, dynamic>> markGoalCompleted({
    required String goalId,
  }) async {
    final response = await _apiClient.patch<Map<String, dynamic>>(
      '/goal/mark-goal-completed',
      data: {'goalId': goalId},
    );

    final data = response.data;

    if (data == null) {
      throw Exception('Empty response from mark goal API.');
    }

    return data;
  }

  // ------------------------------------------------------------
  // 6.4 Update Goal Title
  // ------------------------------------------------------------
  Future<Map<String, dynamic>> updateGoal({
    required String goalId,
    required String title,
  }) async {
    final response = await _apiClient.patch<Map<String, dynamic>>(
      '/goal/update-goal',
      data: {'goalId': goalId, 'title': title},
    );

    final data = response.data;

    if (data == null) {
      throw Exception('Empty response from update goal API.');
    }

    final goal = data['data'];

    if (goal is! Map<String, dynamic>) {
      throw Exception('Invalid update goal response.');
    }

    return goal;
  }

  // ------------------------------------------------------------
  // 6.5 Delete Goal
  // ------------------------------------------------------------
  Future<Map<String, dynamic>> deleteGoal({required String goalId}) async {
    final response = await _apiClient.delete<Map<String, dynamic>>(
      '/goal/delete-goal/$goalId',
    );

    final data = response.data;

    if (data == null) {
      throw Exception('Empty response from delete goal API.');
    }

    final goal = data['data'];

    if (goal is! Map<String, dynamic>) {
      throw Exception('Invalid delete goal response.');
    }

    return goal;
  }

  // ------------------------------------------------------------
  // 6.6 Change Primary Fitness Goal Type
  // ------------------------------------------------------------
  Future<String> changeGoalType({required String mainGoal}) async {
    final response = await _apiClient.patch<Map<String, dynamic>>(
      '/goal/change-goal-type',
      data: {'mainGoal': mainGoal},
    );

    final data = response.data;

    if (data == null) {
      throw Exception('Empty response from change goal type API.');
    }

    final result = data['data'];

    if (result is! Map<String, dynamic>) {
      throw Exception('Invalid change goal type response.');
    }

    final value = result['mainGoal'];

    if (value == null) {
      throw Exception('Main goal missing from response.');
    }

    return value.toString();
  }

  // ------------------------------------------------------------
  // 6.7 Get Completed Goal Percentage
  // ------------------------------------------------------------
  Future<Map<String, dynamic>> getCompletedGoalPercentage() async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      '/goal/completed-goal-percentage',
    );

    final data = response.data;

    if (data == null) {
      throw Exception('Empty response from goal percentage API.');
    }

    final result = data['data'];

    if (result is! Map<String, dynamic>) {
      throw Exception('Invalid goal percentage response.');
    }

    return result;
  }
}
