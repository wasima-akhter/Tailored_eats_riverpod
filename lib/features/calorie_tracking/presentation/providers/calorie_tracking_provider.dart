// lib/features/calorie_tracking/presentation/providers/calorie_tracking_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/network_providers.dart';
import '../../data/datasources/calorie_tracking_remote_data_source.dart';
import '../../data/repositories/calorie_tracking_repository_impl.dart';
import '../../domain/repositories/calorie_tracking_repository.dart';
import '../../domain/usecases/log_consumed_meal.dart';
import '../controllers/calorie_tracking_controller.dart';

final calorieTrackingRemoteDataSourceProvider =
    Provider<CalorieTrackingRemoteDataSource>((ref) {
      return CalorieTrackingRemoteDataSourceImpl(
        apiClient: ref.read(apiClientProvider),
      );
    });

final calorieTrackingRepositoryProvider = Provider<CalorieTrackingRepository>((
  ref,
) {
  return CalorieTrackingRepositoryImpl(
    remoteDataSource: ref.read(calorieTrackingRemoteDataSourceProvider),
  );
});

final logConsumedMealProvider = Provider<LogConsumedMeal>((ref) {
  return LogConsumedMeal(ref.read(calorieTrackingRepositoryProvider));
});

final calorieTrackingControllerProvider =
    StateNotifierProvider<CalorieTrackingController, CalorieTrackingState>((
      ref,
    ) {
      return CalorieTrackingController(
        logConsumedMeal: ref.read(logConsumedMealProvider),
      );
    });
