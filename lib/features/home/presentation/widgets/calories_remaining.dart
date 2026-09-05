import 'package:flutter/material.dart';

import '../../domain/entities/home_profile.dart';

class CaloriesRemainingWidget extends StatelessWidget {
  final HomeProfile? profile;

  const CaloriesRemainingWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final calorie = profile?.calorie;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          const Text(
            'Your Daily Calorie Target',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            calorie == null
                ? '--'
                : '${calorie.calorieGoal.toStringAsFixed(calorie.calorieGoal % 1 == 0 ? 0 : 1)} kcal',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Based on your current plan',
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
