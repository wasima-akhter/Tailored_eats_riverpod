// lib/features/custom_meals/presentation/widgets/custom_meal_card.dart

import 'package:flutter/material.dart';

import '../../domain/entities/custom_meal.dart';

class CustomMealCard extends StatelessWidget {
  const CustomMealCard({
    super.key,
    required this.meal,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.isDeleting = false,
  });

  final CustomMeal meal;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool isDeleting;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      color: colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: colors.outline.withValues(alpha: 0.16)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _MealImage(meal: meal),
                  const SizedBox(width: 12),
                  Expanded(child: _buildHeader(context)),
                  const SizedBox(width: 8),
                  _buildMenu(context),
                ],
              ),
              const SizedBox(height: 14),
              _buildNutrition(context),
              if (meal.ingredients.isNotEmpty) ...[
                const SizedBox(height: 12),
                _buildIngredients(context),
              ],
              if (meal.instructions.trim().isNotEmpty) ...[
                const SizedBox(height: 12),
                _buildInstructions(context),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          meal.name.isNotEmpty ? meal.name : 'Untitled meal',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: colors.onSurface,
          ),
        ),
        const SizedBox(height: 7),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            if (meal.mealType.isNotEmpty)
              _Tag(
                label: _formatValue(meal.mealType),
                icon: Icons.restaurant_outlined,
              ),
            if (meal.prepTime.isNotEmpty)
              _Tag(label: meal.prepTime, icon: Icons.schedule_outlined),
          ],
        ),
      ],
    );
  }

  Widget _buildMenu(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.more_vert, color: colors.onSurfaceVariant),
      onSelected: (value) {
        if (value == 'edit') {
          onEdit?.call();
        } else if (value == 'delete') {
          onDelete?.call();
        }
      },
      itemBuilder: (context) {
        return [
          const PopupMenuItem<String>(
            value: 'edit',
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.edit_outlined),
              title: Text('Edit'),
            ),
          ),
          PopupMenuItem<String>(
            value: 'delete',
            enabled: !isDeleting,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.delete_outline, color: colors.error),
              title: Text('Delete', style: TextStyle(color: null)),
            ),
          ),
        ];
      },
    );
  }

  Widget _buildNutrition(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _NutritionItem(
            icon: Icons.local_fire_department_outlined,
            value: '${meal.calorie}',
            label: 'kcal',
          ),
        ),
        Expanded(
          child: _NutritionItem(
            icon: Icons.fitness_center_outlined,
            value: '${meal.protein}g',
            label: 'protein',
          ),
        ),
        Expanded(
          child: _NutritionItem(
            icon: Icons.grain_outlined,
            value: '${meal.carb}g',
            label: 'carbs',
          ),
        ),
        Expanded(
          child: _NutritionItem(
            icon: Icons.water_drop_outlined,
            value: '${meal.fat}g',
            label: 'fat',
          ),
        ),
      ],
    );
  }

  Widget _buildIngredients(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final visibleIngredients = meal.ingredients.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: colors.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        ...visibleIngredients.map(
          (ingredient) => Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '•  ',
                  style: TextStyle(
                    color: colors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  child: Text(
                    ingredient,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (meal.ingredients.length > 3)
          Text(
            '+${meal.ingredients.length - 3} more',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }

  Widget _buildInstructions(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        meal.instructions,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.bodySmall?.copyWith(
          color: colors.onSurfaceVariant,
          height: 1.4,
        ),
      ),
    );
  }

  String _formatValue(String value) {
    return value
        .trim()
        .split(RegExp(r'[\s_-]+'))
        .where((word) => word.isNotEmpty)
        .map(
          (word) =>
              '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(' ');
  }
}

class _MealImage extends StatelessWidget {
  const _MealImage({required this.meal});

  final CustomMeal meal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final imageUrl = meal.image.trim();

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        width: 78,
        height: 78,
        child: imageUrl.isEmpty
            ? _placeholder(colors)
            : Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => _placeholder(colors),
              ),
      ),
    );
  }

  Widget _placeholder(ColorScheme colors) {
    return Container(
      color: colors.primaryContainer,
      alignment: Alignment.center,
      child: Icon(
        Icons.restaurant_outlined,
        size: 30,
        color: colors.onPrimaryContainer,
      ),
    );
  }
}

class _NutritionItem extends StatelessWidget {
  const _NutritionItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 17, color: colors.primary),
        const SizedBox(width: 5),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colors.onSurface,
                ),
              ),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: colors.primaryContainer.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: colors.primary),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: colors.onPrimaryContainer,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
