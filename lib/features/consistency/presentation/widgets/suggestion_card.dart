import 'package:flutter/material.dart';

class SuggestionCard extends StatelessWidget {
  final int? percentage;

  const SuggestionCard({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.lightbulb_outline, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Suggestion',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  Text(_getSuggestion()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getSuggestion() {
    if (percentage == null) {
      return 'Your consistency data is currently unavailable. '
          'Keep following your plan and check back later.';
    }

    if (percentage! >= 80) {
      return 'Great job! Keep maintaining your consistency.';
    }

    if (percentage! >= 50) {
      return 'You are on the right track. Try to stay consistent each day.';
    }

    return 'Focus on completing more of your daily goals today.';
  }
}
