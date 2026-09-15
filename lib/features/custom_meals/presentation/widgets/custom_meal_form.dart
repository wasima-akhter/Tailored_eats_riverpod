// lib/features/custom_meals/presentation/widgets/custom_meal_form.dart

import 'package:flutter/material.dart';

class CustomMealForm extends StatelessWidget {
  const CustomMealForm({
    super.key,
    required this.nameController,
    required this.calorieController,
    required this.proteinController,
    required this.carbController,
    required this.fatController,
    required this.prepTimeController,
    required this.instructionsController,
    required this.ingredients,
    required this.selectedMealType,
    required this.onMealTypeChanged,
    required this.onAddIngredient,
    required this.onRemoveIngredient,
    this.isLoading = false,
  });

  final TextEditingController nameController;
  final TextEditingController calorieController;
  final TextEditingController proteinController;
  final TextEditingController carbController;
  final TextEditingController fatController;
  final TextEditingController prepTimeController;
  final TextEditingController instructionsController;

  final List<TextEditingController> ingredients;

  final String? selectedMealType;
  final ValueChanged<String?> onMealTypeChanged;

  final VoidCallback onAddIngredient;
  final ValueChanged<int> onRemoveIngredient;

  final bool isLoading;

  static const mealTypes = ['Breakfast', 'Lunch', 'Dinner', 'Snack', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _field(
          context,
          controller: nameController,
          label: 'Meal Name',
          hint: 'e.g. Peanut Butter Banana Oats',
          icon: Icons.restaurant_outlined,
          textCapitalization: TextCapitalization.words,
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          initialValue: selectedMealType,
          decoration: InputDecoration(
            labelText: 'Meal Type',
            prefixIcon: const Icon(Icons.category_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          ),
          items: mealTypes
              .map((type) => DropdownMenuItem(value: type, child: Text(type)))
              .toList(),
          onChanged: isLoading ? null : onMealTypeChanged,
        ),
        const SizedBox(height: 20),
        Text(
          'Nutrition',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _field(
                context,
                controller: calorieController,
                label: 'Calories',
                hint: '430',
                icon: Icons.local_fire_department_outlined,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _field(
                context,
                controller: proteinController,
                label: 'Protein (g)',
                hint: '30',
                icon: Icons.fitness_center_outlined,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _field(
                context,
                controller: carbController,
                label: 'Carbs (g)',
                hint: '55',
                icon: Icons.grain_outlined,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _field(
                context,
                controller: fatController,
                label: 'Fat (g)',
                hint: '11',
                icon: Icons.water_drop_outlined,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _field(
          context,
          controller: prepTimeController,
          label: 'Preparation Time',
          hint: 'e.g. 10 mins',
          icon: Icons.schedule_outlined,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Text(
                'Ingredients',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            TextButton.icon(
              onPressed: isLoading ? null : onAddIngredient,
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            ),
          ],
        ),
        const SizedBox(height: 4),
        if (ingredients.isEmpty)
          _EmptyIngredients()
        else
          ...List.generate(
            ingredients.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _field(
                      context,
                      controller: ingredients[index],
                      label: 'Ingredient ${index + 1}',
                      hint: 'e.g. 60g Rolled Oats',
                      icon: Icons.circle_outlined,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  const SizedBox(width: 6),
                  IconButton(
                    onPressed: isLoading
                        ? null
                        : () => onRemoveIngredient(index),
                    icon: const Icon(Icons.remove_circle_outline),
                    color: Theme.of(context).colorScheme.error,
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 12),
        _field(
          context,
          controller: instructionsController,
          label: 'Instructions',
          hint: 'Describe how to prepare this meal...',
          icon: Icons.menu_book_outlined,
          maxLines: 5,
          textCapitalization: TextCapitalization.sentences,
        ),
      ],
    );
  }

  Widget _field(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      enabled: !isLoading,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '$label is required';
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: maxLines == 1
            ? Icon(icon)
            : Padding(
                padding: const EdgeInsets.only(bottom: 72),
                child: Icon(icon),
              ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}

class _EmptyIngredients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        'Add ingredients for this meal.',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: colors.onSurfaceVariant,
        ),
      ),
    );
  }
}
