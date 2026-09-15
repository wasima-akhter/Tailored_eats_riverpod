// lib/features/calorie_tracking/data/repositories/calorie_tracking_repository_impl.dart

import '../../domain/entities/calorie_summary.dart';
import '../../domain/repositories/calorie_tracking_repository.dart';
import '../datasources/calorie_tracking_remote_data_source.dart';
import '../models/calorie_summary_model.dart';

class CalorieTrackingRepositoryImpl implements CalorieTrackingRepository {
  CalorieTrackingRepositoryImpl({required this._remoteDataSource});

  final CalorieTrackingRemoteDataSource _remoteDataSource;

  @override
  Future<CalorieSummary> logConsumedMeal({
    required int consumedCalorie,
    required int consumedProtein,
    required int consumedCarb,
    required int consumedFat,
  }) async {
    final response = await _remoteDataSource.logConsumedMeal(
      consumedCalorie: consumedCalorie,
      consumedProtein: consumedProtein,
      consumedCarb: consumedCarb,
      consumedFat: consumedFat,
    );

    final data = response['data'];

    if (data is! Map<String, dynamic>) {
      throw Exception('Invalid calorie tracking response');
    }

    return CalorieSummaryModel.fromJson(data);
  }
}
