// lib/features/calorie_tracking/presentation/widgets/macro_summary.dart

import 'package:flutter/material.dart';

import '../../domain/entities/calorie_summary.dart';

class MacroSummary extends StatelessWidget {
  const MacroSummary({super.key, required this.summary});

  final CalorieSummary summary;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _MacroItem(
            label: 'Protein',
            value: '${summary.consumedProtein}g',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _MacroItem(label: 'Carbs', value: '${summary.consumedCarb}g'),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _MacroItem(label: 'Fat', value: '${summary.consumedFat}g'),
        ),
      ],
    );
  }
}

class _MacroItem extends StatelessWidget {
  const _MacroItem({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: [
            Text(
              value,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(label, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
