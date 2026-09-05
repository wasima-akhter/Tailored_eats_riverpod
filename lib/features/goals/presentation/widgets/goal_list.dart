import 'package:flutter/material.dart';

import '../../domain/entities/goal.dart';
import 'goal_card.dart';

class GoalList extends StatelessWidget {
  const GoalList({
    super.key,
    required this.goals,
    required this.onComplete,
    this.completingGoalId,
  });

  final List<Goal> goals;
  final ValueChanged<String> onComplete;
  final String? completingGoalId;

  @override
  Widget build(BuildContext context) {
    if (goals.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'No goals available right now.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: goals.length,
      itemBuilder: (context, index) {
        final goal = goals[index];

        return GoalCard(
          goal: goal,
          isCompleting: completingGoalId == goal.id,
          onComplete: () => onComplete(goal.id),
        );
      },
    );
  }
}
