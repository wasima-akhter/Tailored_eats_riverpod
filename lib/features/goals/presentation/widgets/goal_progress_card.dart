import 'package:flutter/material.dart';

class GoalProgressCard extends StatelessWidget {
  const GoalProgressCard({
    super.key,
    required this.percentage,
    required this.completedGoals,
    required this.totalGoals,
    required this.isLoading,
  });

  final int percentage;
  final int completedGoals;
  final int totalGoals;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final progress = (percentage / 100).clamp(0.0, 1.0);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
              width: 72,
              height: 72,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: isLoading ? null : progress,
                    strokeWidth: 7,
                  ),
                  if (!isLoading)
                    Text(
                      '$percentage%',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Goal Progress',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),

                  const SizedBox(height: 6),

                  if (isLoading)
                    const Text('Loading progress...')
                  else
                    Text(
                      '$completedGoals of '
                      '$totalGoals goals completed',
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
