import 'package:flutter/material.dart';

import '../../domain/entities/home_goal.dart';

class TaskListWidget extends StatelessWidget {
  final List<HomeGoal> goals;
  final Future<bool> Function(String goalId)? onGoalCompleted;

  const TaskListWidget({super.key, required this.goals, this.onGoalCompleted});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: goals.map((goal) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: _GoalItem(goal: goal, onCompleted: onGoalCompleted),
        );
      }).toList(),
    );
  }
}

class _GoalItem extends StatelessWidget {
  final HomeGoal goal;
  final Future<bool> Function(String goalId)? onCompleted;

  const _GoalItem({required this.goal, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        children: [
          Checkbox(
            value: goal.isCompleted,
            onChanged: goal.isCompleted || onCompleted == null
                ? null
                : (_) {
                    onCompleted!(goal.id);
                  },
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              goal.title,
              style: TextStyle(
                fontSize: 14,
                decoration: goal.isCompleted
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
