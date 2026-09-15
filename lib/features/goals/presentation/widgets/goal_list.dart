import 'package:flutter/material.dart';

import '../../domain/entities/goal.dart';
import 'goal_card.dart';

class GoalList extends StatelessWidget {
  const GoalList({
    super.key,
    required this.goals,
    required this.onComplete,
    required this.onEdit,
    required this.onDelete,
    this.completingGoalId,
    this.updatingGoalId,
    this.deletingGoalId,
  });

  final List<Goal> goals;

  final ValueChanged<String> onComplete;
  final ValueChanged<Goal> onEdit;
  final ValueChanged<String> onDelete;

  final String? completingGoalId;
  final String? updatingGoalId;
  final String? deletingGoalId;

  @override
  Widget build(BuildContext context) {
    if (goals.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Text(
            'No goals available right now.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Goals right now:',

          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        Column(
          children: goals.map((goal) {
            return GoalCard(
              goal: goal,
              isCompleting: completingGoalId == goal.id,
              isUpdating: updatingGoalId == goal.id,
              isDeleting: deletingGoalId == goal.id,
              onComplete: () => onComplete(goal.id),
              onEdit: () => onEdit(goal),
              onDelete: () => onDelete(goal.id),
            );
          }).toList(),
        ),
      ],
    );
  }
}
