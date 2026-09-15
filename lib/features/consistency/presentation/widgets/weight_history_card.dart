import 'package:flutter/material.dart';

import '../../domain/entities/weight_log.dart';

class WeightHistoryCard extends StatelessWidget {
  final List<WeightLog> weights;

  const WeightHistoryCard({super.key, required this.weights});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weight History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            if (weights.isEmpty)
              const Text('No weight records available.')
            else
              ...weights.map(
                (weight) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      const Icon(Icons.monitor_weight_outlined),
                      const SizedBox(width: 12),
                      Expanded(child: Text(_formatDate(weight.createdAt))),
                      Text(
                        '${weight.weight.toStringAsFixed(1)} kg',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}
