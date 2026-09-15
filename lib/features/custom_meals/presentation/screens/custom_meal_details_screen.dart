// lib/features/custom_meals/presentation/screens/custom_meal_details_screen.dart

import 'package:flutter/material.dart';

import '../../domain/entities/custom_meal.dart';

class CustomMealDetailsScreen extends StatelessWidget {
  const CustomMealDetailsScreen({super.key, required this.meal});

  final CustomMeal meal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Meal Details')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          _buildImage(context),
          const SizedBox(height: 20),
          Text(
            meal.name.isNotEmpty ? meal.name : 'Untitled meal',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (meal.mealType.isNotEmpty)
                _Tag(icon: Icons.restaurant_outlined, label: meal.mealType),
              if (meal.prepTime.isNotEmpty)
                _Tag(icon: Icons.schedule_outlined, label: meal.prepTime),
            ],
          ),
          const SizedBox(height: 20),
          _NutritionCard(meal: meal),
          if (meal.ingredients.isNotEmpty) ...[
            const SizedBox(height: 24),
            _SectionTitle(title: 'Ingredients'),
            const SizedBox(height: 10),
            ...meal.ingredients.map(
              (ingredient) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 19,
                      color: colors.primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        ingredient,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (meal.instructions.trim().isNotEmpty) ...[
            const SizedBox(height: 24),
            _SectionTitle(title: 'Instructions'),
            const SizedBox(height: 10),
            Text(
              meal.instructions,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final imageUrl = meal.image.trim();

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: imageUrl.isEmpty
            ? Container(
                color: colors.primaryContainer,
                alignment: Alignment.center,
                child: Icon(
                  Icons.restaurant_outlined,
                  size: 64,
                  color: colors.onPrimaryContainer,
                ),
              )
            : Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) {
                  return Container(
                    color: colors.primaryContainer,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.restaurant_outlined,
                      size: 64,
                      color: colors.onPrimaryContainer,
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class _NutritionCard extends StatelessWidget {
  const _NutritionCard({required this.meal});

  final CustomMeal meal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Card(
      elevation: 0,
      color: colors.surfaceContainerHighest.withValues(alpha: 0.45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          runSpacing: 18,
          children: [
            _Item(
              icon: Icons.local_fire_department_outlined,
              value: '${meal.calorie}',
              label: 'Calories',
            ),
            _Item(
              icon: Icons.fitness_center_outlined,
              value: '${meal.protein}g',
              label: 'Protein',
            ),
            _Item(
              icon: Icons.grain_outlined,
              value: '${meal.carb}g',
              label: 'Carbs',
            ),
            _Item(
              icon: Icons.water_drop_outlined,
              value: '${meal.fat}g',
              label: 'Fat',
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.icon, required this.value, required this.label});

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return SizedBox(
      width: 75,
      child: Column(
        children: [
          Icon(icon, size: 22, color: colors.primary),
          const SizedBox(height: 6),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: colors.onPrimaryContainer),
          const SizedBox(width: 6),
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: colors.onPrimaryContainer,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
