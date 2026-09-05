import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/error_handler.dart';
import '../../domain/entities/goal.dart';
import '../../domain/usecases/get_goals.dart';
import '../../domain/usecases/mark_goal_completed.dart';
import 'goals_state.dart';

class GoalsController extends StateNotifier<GoalsState> {
  GoalsController({required this._getGoals, required this._markGoalCompleted})
    : super(const GoalsState());

  final GetGoals _getGoals;
  final MarkGoalCompleted _markGoalCompleted;

  Future<void> loadGoals() async {
    state = state.copyWith(status: GoalsStatus.loading, clearError: true);

    try {
      final goals = await _getGoals();

      state = state.copyWith(
        status: GoalsStatus.success,
        goals: goals,
        clearError: true,
      );
    } catch (error, stackTrace) {
      debugPrint('[GoalsController] Failed to load goals: $error');
      debugPrintStack(stackTrace: stackTrace);

      final failure = ErrorHandler.handle(error);

      debugPrint(
        '[GoalsController] Load goals failure: ${failure.userMessage}',
      );

      state = state.copyWith(
        status: GoalsStatus.failure,
        errorMessage: 'Unable to load your goals. Please try again.',
      );
    }
  }

  Future<void> retry() async {
    await loadGoals();
  }

  Future<void> markGoalCompleted({required String goalId}) async {
    if (state.isCompletingGoal) {
      return;
    }

    final goalIndex = state.goals.indexWhere((goal) => goal.id == goalId);

    if (goalIndex == -1) {
      return;
    }

    final currentGoal = state.goals[goalIndex];

    if (currentGoal.isCompleted) {
      return;
    }

    final updatedGoals = List<Goal>.from(state.goals);

    updatedGoals[goalIndex] = Goal(
      id: currentGoal.id,
      title: currentGoal.title,
      description: currentGoal.description,
      isCompleted: true,
    );

    state = state.copyWith(
      goals: updatedGoals,
      completingGoalId: goalId,
      clearError: true,
    );

    try {
      await _markGoalCompleted(goalId: goalId);

      state = state.copyWith(
        completingGoalId: goalId,
        clearCompletingGoal: true,
      );
    } catch (error, stackTrace) {
      debugPrint('[GoalsController] Failed to complete goal $goalId: $error');
      debugPrintStack(stackTrace: stackTrace);

      final failure = ErrorHandler.handle(error);

      debugPrint(
        '[GoalsController] Complete goal failure: ${failure.userMessage}',
      );

      final rollbackGoals = List<Goal>.from(state.goals);

      rollbackGoals[goalIndex] = currentGoal;

      state = state.copyWith(
        goals: rollbackGoals,
        completingGoalId: goalId,
        clearCompletingGoal: true,
        errorMessage: 'Unable to complete this goal. Please try again.',
      );
    }
  }
}
