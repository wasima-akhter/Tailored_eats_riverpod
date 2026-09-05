import 'package:flutter/material.dart';

import '../../domain/entities/goal.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({
    super.key,
    required this.goal,
    required this.onComplete,
    this.isCompleting = false,
  });

  final Goal goal;
  final VoidCallback onComplete;
  final bool isCompleting;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _GoalStatusIcon(isCompleted: goal.isCompleted),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    goal.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (goal.description != null &&
                      goal.description!.trim().isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      goal.description!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  if (goal.isCompleted)
                    const Text(
                      'Completed',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  else
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: isCompleting ? null : onComplete,
                        child: isCompleting
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text('Complete'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoalStatusIcon extends StatelessWidget {
  const _GoalStatusIcon({required this.isCompleted});

  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Icon(
      isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
      size: 28,
    );
  }
}
