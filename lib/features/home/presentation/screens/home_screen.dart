import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/home_state.dart';
import '../providers/home_provider.dart';
import '../widgets/calories_remaining.dart';
import '../widgets/circular_progress.dart';
import '../widgets/friends_progress.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/nutrient_card.dart';
import '../widgets/self_consistency.dart';
import '../widgets/task_list.dart';
import '../widgets/top_text_header.dart';
import '../widgets/weight_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(homeControllerProvider.notifier).loadHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeControllerProvider);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HomeAppBarWidget(),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return ref.read(homeControllerProvider.notifier).refreshHome();
          },
          child: _buildBody(state),
        ),
      ),
    );
  }

  Widget _buildBody(HomeState state) {
    if (state.isLoading && state.profile == null) {
      return ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 500,
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      );
    }

    if (state.errorMessage != null &&
        state.profile == null &&
        state.consistency == null) {
      return _buildErrorState(state.errorMessage!);
    }

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        TopTextHeaderWidget(profile: state.profile),

        const SizedBox(height: 20),

        const Text(
          'Your Total Daily Nutrition',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        NutrientCardWidget(profile: state.profile),

        const SizedBox(height: 15),

        CaloriesRemainingWidget(profile: state.profile),

        const SizedBox(height: 28),

        const Text(
          "Today's Consistency",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 15),

        CircularProgressWidget(
          percentage: state.consistency?.todayCompleted.percentage ?? 0,
        ),

        const SizedBox(height: 25),

        const Text(
          'How Steady Have You Been?',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        SelfConsistencyWidget(consistency: state.consistency),

        const SizedBox(height: 20),

        const Text(
          "Friends' Progress",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        FriendsProgressWidget(
          friends: state.consistency?.friendsData ?? const [],
        ),

        if (state.goals.isNotEmpty) ...[
          const SizedBox(height: 25),

          const Text(
            "Don't Forget Your Daily Goal",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          TaskListWidget(
            goals: state.goals,
            onGoalCompleted: (goalId) {
              return ref
                  .read(homeControllerProvider.notifier)
                  .markGoalCompleted(goalId: goalId);
            },
          ),
        ],

        const SizedBox(height: 25),

        const Text(
          'Track Your Weight',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        WeightWidget(
          currentWeight: state.profile?.weight.first.weightKg ?? 0.0,
          isLoading: state.isSavingWeight,
          onSave: (weight) {
            return ref
                .read(homeControllerProvider.notifier)
                .saveWeight(weight: weight);
          },
        ),

        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildErrorState(String message) {
    debugPrint('error message: $message');
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.7,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 48),
                  const SizedBox(height: 12),
                  const Text(
                    'Unable to load Home',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(message, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(homeControllerProvider.notifier).loadHome();
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
