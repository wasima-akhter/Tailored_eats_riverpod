import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_paths.dart';
import '../../../profile/presentation/providers/profile_provider.dart';
import '../controllers/nutrition_state.dart';
import '../providers/nutrition_provider.dart';
import '../widgets/meal_section.dart';

class NutritionScreen extends ConsumerStatefulWidget {
  const NutritionScreen({super.key});

  @override
  ConsumerState<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends ConsumerState<NutritionScreen> {
  bool _nutritionLoaded = false;

  @override
  void initState() {
    super.initState();

    Future.microtask(_initializeNutrition);
  }

  Future<void> _initializeNutrition() async {
    final profileController = ref.read(profileControllerProvider.notifier);

    final profileState = ref.read(profileControllerProvider);

    if (profileState.profile == null) {
      await profileController.loadProfile();
    }

    if (!mounted) return;

    final userName = ref.read(nutritionUserEmailProvider);

    if (userName == null || userName.isEmpty) {
      setState(() {
        _nutritionLoaded = true;
      });
      return;
    }

    await ref.read(nutritionControllerProvider.notifier).loadAllMeals();

    if (!mounted) return;

    setState(() {
      _nutritionLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileControllerProvider);

    if (!_nutritionLoaded) {
      return const SafeArea(
        top: false,
        child: Scaffold(body: Center(child: CircularProgressIndicator())),
      );
    }

    final userName = profileState.profile?.name;

    if (userName == null || userName.isEmpty) {
      return const SafeArea(
        top: false,
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'Unable to load your nutrition profile right now.\n\n'
                'Please try again later.',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
    }

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
              // Add these actions to NutritionScreen,
              // for example below the introductory text.
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        context.pushNamed(AppRoutes.customMeals);
                      },
                      icon: const Icon(Icons.restaurant_menu),
                      label: const Text('My Meals'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        context.pushNamed(AppRoutes.calorieTracking);
                      },
                      icon: const Icon(Icons.local_fire_department),
                      label: const Text('Calories'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              //
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
