import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/error_handler.dart';
import '../../domain/entities/goal.dart';
import '../../domain/usecases/change_goal_type.dart';
import '../../domain/usecases/create_goal.dart';
import '../../domain/usecases/delete_goal.dart';
import '../../domain/usecases/get_completed_goal_percentage.dart';
import '../../domain/usecases/get_goals.dart';
import '../../domain/usecases/mark_goal_completed.dart';
import '../../domain/usecases/update_goal.dart';
import 'goals_state.dart';

class GoalsController extends StateNotifier<GoalsState> {
  GoalsController({
    required this._getGoals,
    required this._markGoalCompleted,
    required this._createGoal,
    required this._updateGoal,
    required this._deleteGoal,
    required this._changeGoalType,
    required this._getCompletedGoalPercentage,
  }) : super(const GoalsState());

  final GetGoals _getGoals;
  final MarkGoalCompleted _markGoalCompleted;
  final CreateGoal _createGoal;
  final UpdateGoal _updateGoal;
  final DeleteGoal _deleteGoal;
  final ChangeGoalType _changeGoalType;
  final GetCompletedGoalPercentage _getCompletedGoalPercentage;

  // ---------------------------------------------------------------------------
  // Get All Goals
  // ---------------------------------------------------------------------------

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

  // ---------------------------------------------------------------------------
  // Create Goal
  // ---------------------------------------------------------------------------

  Future<void> createGoal({
    required String userId,
    required String title,
  }) async {
    if (state.isCreatingGoal) {
      return;
    }

    final trimmedTitle = title.trim();

    if (trimmedTitle.isEmpty) {
      state = state.copyWith(errorMessage: 'Goal title cannot be empty.');
      return;
    }

    state = state.copyWith(isCreatingGoal: true, clearError: true);

    try {
      final goal = await _createGoal(userId: userId, title: trimmedTitle);

      final updatedGoals = [goal, ...state.goals];

      state = state.copyWith(
        goals: updatedGoals,
        isCreatingGoal: false,
        clearCreatingGoal: true,
        clearError: true,
      );
    } catch (error, stackTrace) {
      debugPrint('[GoalsController] Failed to create goal: $error');
      debugPrintStack(stackTrace: stackTrace);

      final failure = ErrorHandler.handle(error);

      debugPrint(
        '[GoalsController] Create goal failure: ${failure.userMessage}',
      );

      state = state.copyWith(
        isCreatingGoal: false,
        clearCreatingGoal: true,
        errorMessage: 'Unable to create this goal. Please try again.',
      );
    }
  }

  // ---------------------------------------------------------------------------
  // Mark Goal Completed
  // ---------------------------------------------------------------------------

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
      createdAt: currentGoal.createdAt,
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

  // ---------------------------------------------------------------------------
  // Update Goal
  // ---------------------------------------------------------------------------

  Future<void> updateGoal({
    required String goalId,
    required String title,
  }) async {
    if (state.isUpdatingGoal) {
      return;
    }

    final trimmedTitle = title.trim();

    if (trimmedTitle.isEmpty) {
      state = state.copyWith(errorMessage: 'Goal title cannot be empty.');
      return;
    }

    final goalIndex = state.goals.indexWhere((goal) => goal.id == goalId);

    if (goalIndex == -1) {
      return;
    }

    state = state.copyWith(updatingGoalId: goalId, clearError: true);

    try {
      final updatedGoal = await _updateGoal(
        goalId: goalId,
        title: trimmedTitle,
      );

      final updatedGoals = List<Goal>.from(state.goals);

      updatedGoals[goalIndex] = Goal(
        id: updatedGoal.id,
        title: updatedGoal.title,
        createdAt: updatedGoal.createdAt,
        isCompleted: updatedGoal.isCompleted,
      );

      state = state.copyWith(
        goals: updatedGoals,
        updatingGoalId: goalId,
        clearUpdatingGoal: true,
        clearError: true,
      );
    } catch (error, stackTrace) {
      debugPrint('[GoalsController] Failed to update goal $goalId: $error');
      debugPrintStack(stackTrace: stackTrace);

      final failure = ErrorHandler.handle(error);

      debugPrint(
        '[GoalsController] Update goal failure: ${failure.userMessage}',
      );

      state = state.copyWith(
        updatingGoalId: goalId,
        clearUpdatingGoal: true,
        errorMessage: 'Unable to update this goal. Please try again.',
      );
    }
  }

  // ---------------------------------------------------------------------------
  // Delete Goal
  // ---------------------------------------------------------------------------

  Future<void> deleteGoal({required String goalId}) async {
    if (state.isDeletingGoal) {
      return;
    }

    final goalIndex = state.goals.indexWhere((goal) => goal.id == goalId);

    if (goalIndex == -1) {
      return;
    }

    state = state.copyWith(deletingGoalId: goalId, clearError: true);

    try {
      await _deleteGoal(goalId: goalId);

      final updatedGoals = List<Goal>.from(state.goals)..removeAt(goalIndex);

      state = state.copyWith(
        goals: updatedGoals,
        deletingGoalId: goalId,
        clearDeletingGoal: true,
        clearError: true,
      );
    } catch (error, stackTrace) {
      debugPrint('[GoalsController] Failed to delete goal $goalId: $error');
      debugPrintStack(stackTrace: stackTrace);

      final failure = ErrorHandler.handle(error);

      debugPrint(
        '[GoalsController] Delete goal failure: ${failure.userMessage}',
      );

      state = state.copyWith(
        deletingGoalId: goalId,
        clearDeletingGoal: true,
        errorMessage: 'Unable to delete this goal. Please try again.',
      );
    }
  }

  // ---------------------------------------------------------------------------
  // Change Primary Goal Type
  // ---------------------------------------------------------------------------

  Future<void> changeGoalType({required String mainGoal}) async {
    if (state.isChangingGoalType) {
      return;
    }

    state = state.copyWith(isChangingGoalType: true, clearError: true);

    try {
      final updatedGoalType = await _changeGoalType(mainGoal: mainGoal);

      state = state.copyWith(
        mainGoalType: updatedGoalType,
        isChangingGoalType: false,
        clearChangingGoalType: true,
        clearError: true,
      );
    } catch (error, stackTrace) {
      debugPrint('[GoalsController] Failed to change goal type: $error');
      debugPrintStack(stackTrace: stackTrace);

      final failure = ErrorHandler.handle(error);

      debugPrint(
        '[GoalsController] Change goal type failure: ${failure.userMessage}',
      );

      state = state.copyWith(
        isChangingGoalType: false,
        clearChangingGoalType: true,
        errorMessage: 'Unable to change your primary goal. Please try again.',
      );
    }
  }

  // ---------------------------------------------------------------------------
  // Completed Goal Percentage
  // ---------------------------------------------------------------------------

  Future<void> loadCompletedGoalPercentage() async {
    if (state.isLoadingGoalPercentage) {
      return;
    }

    state = state.copyWith(isLoadingGoalPercentage: true, clearError: true);

    try {
      final percentage = await _getCompletedGoalPercentage();

      state = state.copyWith(
        goalPercentage: percentage,
        isLoadingGoalPercentage: false,
        clearGoalPercentageLoading: true,
        clearError: true,
      );
    } catch (error, stackTrace) {
      debugPrint('[GoalsController] Failed to load goal percentage: $error');
      debugPrintStack(stackTrace: stackTrace);

      final failure = ErrorHandler.handle(error);

      debugPrint(
        '[GoalsController] Goal percentage failure: ${failure.userMessage}',
      );

      state = state.copyWith(
        isLoadingGoalPercentage: false,
        clearGoalPercentageLoading: true,
        errorMessage: 'Unable to load your goal progress. Please try again.',
      );
    }
  }
}
