import 'package:flutter/material.dart';

import '../../domain/entities/home_profile.dart';

class NutrientCardWidget extends StatelessWidget {
  final HomeProfile? profile;

  const NutrientCardWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    if (profile == null) {
      return const _EmptyCard(message: 'Nutrition information is unavailable.');
    }

    final homeProfile = profile!;

    final currentWeight = homeProfile.weight.isNotEmpty
        ? homeProfile.weight.first.weightKg
        : null;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoRow(
            label: 'Daily Calories',
            value:
                '${_formatNumber(homeProfile.calorie?.consumedCalorie)} kcal',
            icon: Icons.local_fire_department_outlined,
          ),

          const SizedBox(height: 14),

          _InfoRow(
            label: 'Current Weight',
            value: currentWeight == null
                ? '--'
                : '${_formatNumber(currentWeight)} kg',
            icon: Icons.monitor_weight_outlined,
          ),

          const SizedBox(height: 14),

          _InfoRow(
            label: 'Activity Level',
            value: _displayValue(homeProfile.activityLevel),
            icon: Icons.directions_run_outlined,
          ),

          const SizedBox(height: 14),

          _InfoRow(
            label: 'Training',
            value: _displayValue(homeProfile.training),
            icon: Icons.fitness_center_outlined,
          ),
        ],
      ),
    );
  }

  String _formatNumber(double? value) {
    if (value == null) {
      return '--';
    }

    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }

    return value.toStringAsFixed(1);
  }

  String _displayValue(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '--';
    }

    return value.replaceAll('_', ' ');
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _InfoRow({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: colorScheme.primary),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(label, style: const TextStyle(fontSize: 14))),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class _EmptyCard extends StatelessWidget {
  final String message;

  const _EmptyCard({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Text(message),
    );
  }
}
