import 'package:flutter/material.dart';

import '../../domain/entities/consistency_day.dart';

class DailyCalorieSummary extends StatelessWidget {
  final List<ConsistencyDay> days;

  const DailyCalorieSummary({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Consistency History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            if (days.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('No consistency history available yet.'),
              )
            else
              ...days.map(
                (day) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _ConsistencyDayRow(day: day),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ConsistencyDayRow extends StatelessWidget {
  final ConsistencyDay day;

  const _ConsistencyDayRow({required this.day});

  @override
  Widget build(BuildContext context) {
    final progress = (day.completed / 100).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(_formatDate(day.createdAt))),
            Text(
              '${day.completed}%',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 6),
        LinearProgressIndicator(value: progress),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}
