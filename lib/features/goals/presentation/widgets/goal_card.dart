import 'package:flutter/material.dart';

import '../../domain/entities/goal.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({
    super.key,
    required this.goal,
    required this.onComplete,
    required this.onEdit,
    required this.onDelete,
    this.isCompleting = false,
    this.isUpdating = false,
    this.isDeleting = false,
  });

  final Goal goal;

  final VoidCallback onComplete;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  final bool isCompleting;
  final bool isUpdating;
  final bool isDeleting;

  @override
  Widget build(BuildContext context) {
    final isBusy = isCompleting || isUpdating || isDeleting;

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

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      if (!goal.isCompleted)
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: isBusy ? null : onComplete,
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
                        ),

                      if (goal.isCompleted)
                        const Expanded(
                          child: Text(
                            'Completed',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),

                      const SizedBox(width: 8),

                      IconButton(
                        tooltip: 'Edit',
                        onPressed: isBusy ? null : onEdit,
                        icon: isUpdating
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.edit_outlined),
                      ),

                      IconButton(
                        tooltip: 'Delete',
                        onPressed: isBusy ? null : onDelete,
                        icon: isDeleting
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Icon(Icons.delete_outline),
                      ),
                    ],
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
