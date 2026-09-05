import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/goals_state.dart';
import '../providers/goals_provider.dart';
import '../widgets/goal_error.dart';
import '../widgets/goal_list.dart';
import '../widgets/goal_loading.dart';

class GoalsScreen extends ConsumerStatefulWidget {
  const GoalsScreen({super.key});

  @override
  ConsumerState<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends ConsumerState<GoalsScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (!mounted) return;

      ref.read(goalsControllerProvider.notifier).loadGoals();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(goalsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Goals')),
      body: _buildBody(state),
    );
  }

  Widget _buildBody(GoalsState state) {
    switch (state.status) {
      case GoalsStatus.initial:
      case GoalsStatus.loading:
        return const GoalLoading();

      case GoalsStatus.failure:
        return GoalError(
          message:
              state.errorMessage ??
              'Unable to load your goals. Please try again.',
          onRetry: () {
            ref.read(goalsControllerProvider.notifier).retry();
          },
        );

      case GoalsStatus.success:
        return RefreshIndicator(
          onRefresh: () {
            return ref.read(goalsControllerProvider.notifier).loadGoals();
          },
          child: GoalList(
            goals: state.goals,
            completingGoalId: state.completingGoalId,
            onComplete: (goalId) {
              ref
                  .read(goalsControllerProvider.notifier)
                  .markGoalCompleted(goalId: goalId);
            },
          ),
        );
    }
  }
}
