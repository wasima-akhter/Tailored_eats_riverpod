// lib/features/calorie_tracking/presentation/controllers/calorie_tracking_controller.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/calorie_summary.dart';
import '../../domain/usecases/log_consumed_meal.dart';

class CalorieTrackingState {
  final CalorieSummary? summary;
  final bool isSubmitting;
  final String? errorMessage;

  const CalorieTrackingState({
    this.summary,
    this.isSubmitting = false,
    this.errorMessage,
  });

  CalorieTrackingState copyWith({
    CalorieSummary? summary,
    bool? isSubmitting,
    String? errorMessage,
    bool clearSummary = false,
    bool clearError = false,
  }) {
    return CalorieTrackingState(
      summary: clearSummary ? null : summary ?? this.summary,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class CalorieTrackingController extends StateNotifier<CalorieTrackingState> {
  CalorieTrackingController({required this._logConsumedMeal})
    : super(const CalorieTrackingState());

  final LogConsumedMeal _logConsumedMeal;

  Future<CalorieSummary?> logConsumedMeal({
    required int consumedCalorie,
    required int consumedProtein,
    required int consumedCarb,
    required int consumedFat,
  }) async {
    state = state.copyWith(isSubmitting: true, clearError: true);

    try {
      final summary = await _logConsumedMeal(
        consumedCalorie: consumedCalorie,
        consumedProtein: consumedProtein,
        consumedCarb: consumedCarb,
        consumedFat: consumedFat,
      );

      state = state.copyWith(
        summary: summary,
        isSubmitting: false,
        clearError: true,
      );

      return summary;
    } catch (e) {
      state = state.copyWith(isSubmitting: false, errorMessage: e.toString());

      return null;
    }
  }

  void setSummary(CalorieSummary summary) {
    state = state.copyWith(summary: summary, clearError: true);
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
