import '../../domain/entities/goal.dart';

enum GoalsStatus { initial, loading, success, failure }

class GoalsState {
  final GoalsStatus status;
  final List<Goal> goals;
  final String? errorMessage;
  final String? completingGoalId;

  const GoalsState({
    this.status = GoalsStatus.initial,
    this.goals = const [],
    this.errorMessage,
    this.completingGoalId,
  });

  bool get isCompletingGoal => completingGoalId != null;

  GoalsState copyWith({
    GoalsStatus? status,
    List<Goal>? goals,
    String? errorMessage,
    String? completingGoalId,
    bool clearError = false,
    bool clearCompletingGoal = false,
  }) {
    return GoalsState(
      status: status ?? this.status,
      goals: goals ?? this.goals,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      completingGoalId: clearCompletingGoal
          ? null
          : completingGoalId ?? this.completingGoalId,
    );
  }
}
