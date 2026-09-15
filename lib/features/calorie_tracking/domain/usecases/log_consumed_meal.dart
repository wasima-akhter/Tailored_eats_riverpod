// lib/features/calorie_tracking/domain/usecases/log_consumed_meal.dart

import '../entities/calorie_summary.dart';
import '../repositories/calorie_tracking_repository.dart';

class LogConsumedMeal {
  LogConsumedMeal(this._repository);

  final CalorieTrackingRepository _repository;

  Future<CalorieSummary> call({
    required int consumedCalorie,
    required int consumedProtein,
    required int consumedCarb,
    required int consumedFat,
  }) {
    return _repository.logConsumedMeal(
      consumedCalorie: consumedCalorie,
      consumedProtein: consumedProtein,
      consumedCarb: consumedCarb,
      consumedFat: consumedFat,
    );
  }
}
