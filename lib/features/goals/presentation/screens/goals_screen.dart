import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../profile/presentation/providers/profile_provider.dart';
import '../controllers/goals_state.dart';
import '../providers/goals_provider.dart';
import '../widgets/add_goal_dialog.dart';
import '../widgets/goal_error.dart';
import '../widgets/goal_list.dart';
import '../widgets/goal_loading.dart';
import '../widgets/goals_progress_card.dart';

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

      final controller = ref.read(goalsControllerProvider.notifier);

      controller.loadGoals();
      controller.loadCompletedGoalPercentage();

      ref.read(profileControllerProvider.notifier).loadProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(goalsControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Goals'),
        actions: [
          IconButton(
            tooltip: 'Add Goal',
            onPressed: state.isCreatingGoal
                ? null
                : () => _showAddGoalDialog(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
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
          onRefresh: () async {
            final controller = ref.read(goalsControllerProvider.notifier);

            await controller.loadGoals();
            await controller.loadCompletedGoalPercentage();
          },
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              GoalProgressCard(
                percentage: state.goalPercentage?.percentage ?? 0,
                completedGoals: state.goalPercentage?.completedGoals ?? 0,
                totalGoals: state.goalPercentage?.totalGoals ?? 0,
                // isLoading: state.isLoadingGoalPercentage,
              ),

              const SizedBox(height: 16),

              // ChangeGoalTypeCard(
              //   currentGoalType: state.mainGoalType,
              //   isLoading: state.isChangingGoalType,
              //   onChanged: (value) {
              //     ref
              //         .read(goalsControllerProvider.notifier)
              //         .changeGoalType(mainGoal: value);
              //   },
              // ),

              // const SizedBox(height: 16),
              GoalList(
                goals: state.goals,
                completingGoalId: state.completingGoalId,
                updatingGoalId: state.updatingGoalId,
                deletingGoalId: state.deletingGoalId,
                onComplete: (goalId) {
                  ref
                      .read(goalsControllerProvider.notifier)
                      .markGoalCompleted(goalId: goalId);
                },
                onEdit: (goal) {
                  _showEditGoalDialog(context, goal.id, goal.title);
                },
                onDelete: (goalId) {
                  _confirmDeleteGoal(context, goalId);
                },
              ),
            ],
          ),
        );
    }
  }

  Future<void> _showAddGoalDialog(BuildContext context) async {
    final title = await showDialog<String>(
      context: context,
      builder: (_) => const AddGoalDialog(),
    );

    if (!mounted || title == null || title.trim().isEmpty) {
      return;
    }

    //
    final profileState = ref.watch(profileControllerProvider);

    // Replace this with your actual authenticated user ID.
    final userId = profileState.profile?.id ?? '';

    await ref
        .read(goalsControllerProvider.notifier)
        .createGoal(userId: userId, title: title);

    if (!mounted) return;

    final state = ref.read(goalsControllerProvider);

    if (state.errorMessage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Goal created successfully.')),
      );
    }
  }

  Future<void> _showEditGoalDialog(
    BuildContext context,
    String goalId,
    String currentTitle,
  ) async {
    final title = await showDialog<String>(
      context: context,
      builder: (_) => AddGoalDialog(
        initialTitle: currentTitle,
        title: 'Edit Goal',
        buttonText: 'Update',
      ),
    );

    if (!mounted || title == null || title.trim().isEmpty) {
      return;
    }

    await ref
        .read(goalsControllerProvider.notifier)
        .updateGoal(goalId: goalId, title: title);

    if (!mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Goal updated successfully.')));
  }

  Future<void> _confirmDeleteGoal(BuildContext context, String goalId) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Delete Goal'),
          content: const Text('Are you sure you want to delete this goal?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (!mounted || shouldDelete != true) {
      return;
    }

    await ref.read(goalsControllerProvider.notifier).deleteGoal(goalId: goalId);

    if (!mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Goal deleted successfully.')));
  }
}
