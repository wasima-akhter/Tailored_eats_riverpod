import 'package:flutter/material.dart';

class MealSummaryCard extends StatelessWidget {
  final int? percentage;

  const MealSummaryCard({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    final String message;

    if (percentage == null) {
      message = 'Consistency data is currently unavailable.';
    } else if (percentage! >= 80) {
      message = 'Excellent consistency!';
    } else if (percentage! >= 50) {
      message = 'You are making good progress.';
    } else {
      message = 'There is room to improve your consistency.';
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              percentage == null ? Icons.info_outline : Icons.track_changes,
              size: 32,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Consistency Status',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(message),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
