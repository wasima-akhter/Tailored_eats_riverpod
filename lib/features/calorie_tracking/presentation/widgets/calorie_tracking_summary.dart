// lib/features/calorie_tracking/presentation/widgets/calorie_tracking_summary.dart

import 'package:flutter/material.dart';

import '../../domain/entities/calorie_summary.dart';
import 'calorie_progress_card.dart';
import 'macro_summary.dart';

class CalorieTrackingSummary extends StatelessWidget {
  const CalorieTrackingSummary({super.key, required this.summary});

  final CalorieSummary summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalorieProgressCard(summary: summary),
        const SizedBox(height: 12),
        MacroSummary(summary: summary),
      ],
    );
  }
}
