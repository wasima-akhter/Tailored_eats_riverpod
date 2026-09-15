// lib/features/calorie_tracking/data/datasources/calorie_tracking_remote_data_source.dart

import '../../../../core/network/api_client.dart';

abstract class CalorieTrackingRemoteDataSource {
  Future<Map<String, dynamic>> logConsumedMeal({
    required int consumedCalorie,
    required int consumedProtein,
    required int consumedCarb,
    required int consumedFat,
  });
}

class CalorieTrackingRemoteDataSourceImpl
    implements CalorieTrackingRemoteDataSource {
  CalorieTrackingRemoteDataSourceImpl({required this._apiClient});

  final ApiClient _apiClient;

  @override
  Future<Map<String, dynamic>> logConsumedMeal({
    required int consumedCalorie,
    required int consumedProtein,
    required int consumedCarb,
    required int consumedFat,
  }) async {
    final response = await _apiClient.patch<Map<String, dynamic>>(
      '/meal/ate-meal',
      data: {
        'consumedCalorie': consumedCalorie,
        'consumedProtein': consumedProtein,
        'consumedCarb': consumedCarb,
        'consumedFat': consumedFat,
      },
    );

    return response.data ?? <String, dynamic>{};
  }
}
