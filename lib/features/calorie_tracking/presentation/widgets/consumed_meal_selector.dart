// lib/features/calorie_tracking/presentation/widgets/consumed_meal_selector.dart

import 'package:flutter/material.dart';

import '../../../custom_meals/domain/entities/custom_meal.dart';

class ConsumedMealSelector extends StatelessWidget {
  const ConsumedMealSelector({
    super.key,
    required this.meals,
    required this.selectedMeals,
    required this.onToggle,
  });

  final List<CustomMeal> meals;
  final Set<String> selectedMeals;
  final ValueChanged<CustomMeal> onToggle;

  @override
  Widget build(BuildContext context) {
    if (meals.isEmpty) {
      return const Center(child: Text('No custom meals available'));
    }

    return Column(
      children: meals.map((meal) {
        final selected = selectedMeals.contains(meal.id);

        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: CheckboxListTile(
            value: selected,
            onChanged: (_) => onToggle(meal),
            title: Text(
              meal.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${meal.calorie} kcal • '
              '${meal.protein}g protein • '
              '${meal.carb}g carbs • '
              '${meal.fat}g fat',
            ),
            secondary: Text(
              meal.mealType,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        );
      }).toList(),
    );
  }
}
