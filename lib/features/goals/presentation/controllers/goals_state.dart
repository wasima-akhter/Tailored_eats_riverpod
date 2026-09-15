import '../../domain/entities/goal.dart';

enum GoalsStatus { initial, loading, success, failure }

class GoalsState {
  final GoalsStatus status;
  final List<Goal> goals;
  final String? errorMessage;

  // Goal completion
  final String? completingGoalId;

  // Create goal
  final bool isCreatingGoal;

  // Update goal
  final String? updatingGoalId;

  // Delete goal
  final String? deletingGoalId;

  // Change primary goal type
  final bool isChangingGoalType;
  final String? mainGoalType;

  // Completed goal percentage
  final bool isLoadingGoalPercentage;
  final GoalPercentage? goalPercentage;

  const GoalsState({
    this.status = GoalsStatus.initial,
    this.goals = const [],
    this.errorMessage,
    this.completingGoalId,
    this.isCreatingGoal = false,
    this.updatingGoalId,
    this.deletingGoalId,
    this.isChangingGoalType = false,
    this.mainGoalType,
    this.isLoadingGoalPercentage = false,
    this.goalPercentage,
  });

  // ---------------------------------------------------------------------------
  // Loading helpers
  // ---------------------------------------------------------------------------

  bool get isCompletingGoal => completingGoalId != null;

  bool get isUpdatingGoal => updatingGoalId != null;

  bool get isDeletingGoal => deletingGoalId != null;

  // ---------------------------------------------------------------------------
  // Copy With
  // ---------------------------------------------------------------------------

  GoalsState copyWith({
    GoalsStatus? status,
    List<Goal>? goals,
    String? errorMessage,

    String? completingGoalId,
    bool clearCompletingGoal = false,

    bool? isCreatingGoal,
    bool clearCreatingGoal = false,

    String? updatingGoalId,
    bool clearUpdatingGoal = false,

    String? deletingGoalId,
    bool clearDeletingGoal = false,

    bool? isChangingGoalType,
    bool clearChangingGoalType = false,

    String? mainGoalType,
    bool clearMainGoalType = false,

    bool? isLoadingGoalPercentage,
    bool clearGoalPercentageLoading = false,

    GoalPercentage? goalPercentage,
    bool clearGoalPercentage = false,

    bool clearError = false,
  }) {
    return GoalsState(
      status: status ?? this.status,
      goals: goals ?? this.goals,

      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,

      completingGoalId: clearCompletingGoal
          ? null
          : completingGoalId ?? this.completingGoalId,

      isCreatingGoal: clearCreatingGoal
          ? false
          : isCreatingGoal ?? this.isCreatingGoal,

      updatingGoalId: clearUpdatingGoal
          ? null
          : updatingGoalId ?? this.updatingGoalId,

      deletingGoalId: clearDeletingGoal
          ? null
          : deletingGoalId ?? this.deletingGoalId,

      isChangingGoalType: clearChangingGoalType
          ? false
          : isChangingGoalType ?? this.isChangingGoalType,

      mainGoalType: clearMainGoalType
          ? null
          : mainGoalType ?? this.mainGoalType,

      isLoadingGoalPercentage: clearGoalPercentageLoading
          ? false
          : isLoadingGoalPercentage ?? this.isLoadingGoalPercentage,

      goalPercentage: clearGoalPercentage
          ? null
          : goalPercentage ?? this.goalPercentage,
    );
  }
}
