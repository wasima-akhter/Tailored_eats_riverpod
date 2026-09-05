import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/nutrition_state.dart';
import '../providers/nutrition_provider.dart';
import '../widgets/meal_section.dart';

class NutritionScreen extends ConsumerStatefulWidget {
  const NutritionScreen({super.key});

  @override
  ConsumerState<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends ConsumerState<NutritionScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(nutritionControllerProvider.notifier).loadAllMeals();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(nutritionControllerProvider);
    final controller = ref.read(nutritionControllerProvider.notifier);

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(title: const Text('Nutrition')),
        body: RefreshIndicator(
          onRefresh: controller.loadAllMeals,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            children: [
              Text(
                'What would you like to eat?',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Choose from personalized meal suggestions for today.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),

              MealSection(
                title: 'Breakfast',
                mealType: MealType.breakfast,
                mealState: state.breakfast,
                onRetry: () {
                  controller.retryMeal(MealType.breakfast);
                },
                onMealSelected: (meal) {
                  controller.selectMeal(
                    mealType: MealType.breakfast,
                    meal: meal,
                  );
                },
              ),

              const SizedBox(height: 28),

              MealSection(
                title: 'Lunch',
                mealType: MealType.lunch,
                mealState: state.lunch,
                onRetry: () {
                  controller.retryMeal(MealType.lunch);
                },
                onMealSelected: (meal) {
                  controller.selectMeal(mealType: MealType.lunch, meal: meal);
                },
              ),

              const SizedBox(height: 28),

              MealSection(
                title: 'Dinner',
                mealType: MealType.dinner,
                mealState: state.dinner,
                onRetry: () {
                  controller.retryMeal(MealType.dinner);
                },
                onMealSelected: (meal) {
                  controller.selectMeal(mealType: MealType.dinner, meal: meal);
                },
              ),

              const SizedBox(height: 28),

              MealSection(
                title: 'Snacks',
                mealType: MealType.snacks,
                mealState: state.snacks,
                onRetry: () {
                  controller.retryMeal(MealType.snacks);
                },
                onMealSelected: (meal) {
                  controller.selectMeal(mealType: MealType.snacks, meal: meal);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
