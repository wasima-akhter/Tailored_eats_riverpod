import 'package:flutter/material.dart';

import '../../domain/entities/home_consistency.dart';

class SelfConsistencyWidget extends StatelessWidget {
  final HomeConsistency? consistency;

  const SelfConsistencyWidget({super.key, required this.consistency});

  @override
  Widget build(BuildContext context) {
    final entries = consistency?.consistency ?? const [];

    if (entries.isEmpty) {
      return _EmptyConsistency();
    }

    return SizedBox(
      height: 125,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: entries.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final entry = entries[index];

          return _ConsistencyCard(entry: entry);
        },
      ),
    );
  }
}

class _ConsistencyCard extends StatelessWidget {
  final ConsistencyEntry entry;

  const _ConsistencyCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _formatDate(entry.createdAt),
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 8),
          Text(
            '${entry.completed.toStringAsFixed(0)}%',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          const Text('Completed', style: TextStyle(fontSize: 11)),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}';
  }
}

class _EmptyConsistency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: const Text(
        'No consistency history available yet.',
        textAlign: TextAlign.center,
      ),
    );
  }
}
