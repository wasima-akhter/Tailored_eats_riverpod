// lib/features/calorie_tracking/presentation/screens/calorie_tracking_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../custom_meals/domain/entities/custom_meal.dart';
import '../../../custom_meals/presentation/providers/custom_meals_provider.dart';
import '../providers/calorie_tracking_provider.dart';
import '../widgets/calorie_progress_card.dart';
import '../widgets/consumed_meal_selector.dart';
import '../widgets/macro_summary.dart';

class CalorieTrackingScreen extends ConsumerStatefulWidget {
  const CalorieTrackingScreen({super.key});

  @override
  ConsumerState<CalorieTrackingScreen> createState() =>
      _CalorieTrackingScreenState();
}

class _CalorieTrackingScreenState extends ConsumerState<CalorieTrackingScreen> {
  final Set<String> _selectedMealIds = {};

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(customMealsControllerProvider.notifier).loadMeals(refresh: true);
    });
  }

  void _toggleMeal(CustomMeal meal) {
    setState(() {
      if (_selectedMealIds.contains(meal.id)) {
        _selectedMealIds.remove(meal.id);
      } else {
        _selectedMealIds.add(meal.id);
      }
    });
  }

  Future<void> _logSelectedMeals() async {
    final customMealsState = ref.read(customMealsControllerProvider);

    final selectedMeals = customMealsState.meals
        .where((meal) => _selectedMealIds.contains(meal.id))
        .toList();

    if (selectedMeals.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Select at least one meal')));
      return;
    }

    final calorie = selectedMeals.fold<int>(
      0,
      (sum, meal) => sum + meal.calorie,
    );

    final protein = selectedMeals.fold<int>(
      0,
      (sum, meal) => sum + meal.protein,
    );

    final carb = selectedMeals.fold<int>(0, (sum, meal) => sum + meal.carb);

    final fat = selectedMeals.fold<int>(0, (sum, meal) => sum + meal.fat);

    final summary = await ref
        .read(calorieTrackingControllerProvider.notifier)
        .logConsumedMeal(
          consumedCalorie: calorie,
          consumedProtein: protein,
          consumedCarb: carb,
          consumedFat: fat,
        );

    if (!mounted || summary == null) return;

    setState(() {
      _selectedMealIds.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Meal consumption logged successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final calorieState = ref.watch(calorieTrackingControllerProvider);
    final mealsState = ref.watch(customMealsControllerProvider);

    ref.listen(calorieTrackingControllerProvider, (previous, next) {
      if (next.errorMessage != null &&
          next.errorMessage != previous?.errorMessage) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Calorie Tracking')),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(customMealsControllerProvider.notifier).refresh();
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (calorieState.summary != null) ...[
              CalorieProgressCard(summary: calorieState.summary!),
              const SizedBox(height: 12),
              MacroSummary(summary: calorieState.summary!),
              const SizedBox(height: 24),
            ],
            Text(
              'Log your meals',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              'Select the meals you have consumed today.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            if (mealsState.isLoading && mealsState.meals.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (mealsState.errorMessage != null &&
                mealsState.meals.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    mealsState.errorMessage!,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else
              ConsumedMealSelector(
                meals: mealsState.meals,
                selectedMeals: _selectedMealIds,
                onToggle: _toggleMeal,
              ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: calorieState.isSubmitting ? null : _logSelectedMeals,
                child: calorieState.isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Log Selected Meals'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
