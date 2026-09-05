import 'package:flutter/material.dart';

import '../../domain/entities/meal.dart';
import '../controllers/nutrition_state.dart';
import 'meal_card.dart';
import 'meal_error_card.dart';
import 'meal_loading_card.dart';

class MealSection extends StatelessWidget {
  const MealSection({
    super.key,
    required this.title,
    required this.mealType,
    required this.mealState,
    required this.onRetry,
    required this.onMealSelected,
  });

  final String title;
  final MealType mealType;
  final MealState mealState;
  final VoidCallback onRetry;
  final ValueChanged<Meal> onMealSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            if (mealState.meals.length > 1)
              Text(
                '${mealState.meals.length} options',
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
        const SizedBox(height: 12),
        _buildContent(),
      ],
    );
  }

  Widget _buildContent() {
    switch (mealState.status) {
      case MealLoadingStatus.initial:
      case MealLoadingStatus.loading:
        return const MealLoadingCard();

      case MealLoadingStatus.failure:
        return MealErrorCard(
          message:
              mealState.errorMessage ??
              'Unable to load meals. Please try again.',
          onRetry: onRetry,
        );

      case MealLoadingStatus.success:
        if (mealState.meals.isEmpty) {
          return MealErrorCard(
            message: 'No meals are available right now.',
            onRetry: onRetry,
          );
        }

        return _MealOptions(
          meals: mealState.meals,
          currentMeal: mealState.currentMeal,
          onMealSelected: onMealSelected,
        );
    }
  }
}

class _MealOptions extends StatelessWidget {
  const _MealOptions({
    required this.meals,
    required this.currentMeal,
    required this.onMealSelected,
  });

  final List<Meal> meals;
  final Meal? currentMeal;
  final ValueChanged<Meal> onMealSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MealCard(
          meal: currentMeal ?? meals.first,
          onTap: () => onMealSelected(currentMeal ?? meals.first),
        ),
        if (meals.length > 1) ...[
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: meals.length,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final meal = meals[index];

                return GestureDetector(
                  onTap: () => onMealSelected(meal),
                  child: SizedBox(
                    width: 130,
                    child: _SmallMealOption(
                      meal: meal,
                      selected: meal == currentMeal,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}

class _SmallMealOption extends StatelessWidget {
  const _SmallMealOption({required this.meal, required this.selected});

  final Meal meal;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).dividerColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            meal.mealName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Text(
            '${meal.caloriesKcal.round()} kcal',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
