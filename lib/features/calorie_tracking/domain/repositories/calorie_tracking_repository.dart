// lib/features/calorie_tracking/domain/repositories/calorie_tracking_repository.dart

import '../entities/calorie_summary.dart';

abstract class CalorieTrackingRepository {
  Future<CalorieSummary> logConsumedMeal({
    required int consumedCalorie,
    required int consumedProtein,
    required int consumedCarb,
    required int consumedFat,
  });
}
