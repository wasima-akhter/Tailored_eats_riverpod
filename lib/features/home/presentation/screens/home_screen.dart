import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_paths.dart';
import '../../../authentication/presentation/controllers/auth_controller.dart';
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

  Future<void> _logout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !mounted) {
      return;
    }

    await ref.read(authControllerProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeControllerProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HomeAppBarWidget(
          onLogout: _logout,
          onProfile: () {
            context.pushNamed(AppRoutes.profile);
          },
        ),
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
    if (state.isLoading && !state.hasAnyContent) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [
          SizedBox(
            height: 500,
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      );
    }

    if (_hasFullPageError(state)) {
      return _buildFullPageError(state);
    }

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        _buildProfileSection(state),

        const SizedBox(height: 20),

        ElevatedButton(
          onPressed: () {
            context.pushNamed(AppRoutes.completeProfile);
          },
          child: Text("Completed Profile"),
        ),
        const Text(
          'Your Total Daily Nutrition',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        if (state.profileError != null)
          _buildSectionError(
            message: state.profileError!,
            onRetry: () {
              ref.read(homeControllerProvider.notifier).loadHome();
            },
          )
        else ...[
          NutrientCardWidget(profile: state.profile),
          const SizedBox(height: 15),
          CaloriesRemainingWidget(profile: state.profile),
        ],

        const SizedBox(height: 28),

        const Text(
          "Today's Consistency",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 15),

        CircularProgressWidget(
          percentage: state.consistencyError != null
              ? null
              : state.consistency?.todayCompleted.percentage,
        ),

        const SizedBox(height: 25),

        const Text(
          'How Steady Have You Been?',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        SelfConsistencyWidget(
          consistency: state.consistencyError != null
              ? null
              : state.consistency,
        ),

        const SizedBox(height: 20),

        const Text(
          "Friends' Progress",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        FriendsProgressWidget(
          friends: state.consistencyError != null
              ? const []
              : state.consistency?.friendsData ?? const [],
        ),
        const SizedBox(height: 25),

        _buildGoalsSection(state),

        const SizedBox(height: 25),

        const Text(
          'Track Your Weight',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        if (state.profileError != null)
          _buildSectionError(
            message: state.profileError!,
            onRetry: () {
              ref.read(homeControllerProvider.notifier).loadHome();
            },
          )
        else
          WeightWidget(
            currentWeight: state.profile?.weight.isNotEmpty == true
                ? state.profile!.weight.first.weightKg
                : 0.0,
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

  Widget _buildProfileSection(HomeState state) {
    if (state.profileError != null) {
      return _buildSectionError(
        message: state.profileError!,
        onRetry: () {
          ref.read(homeControllerProvider.notifier).loadHome();
        },
      );
    }

    return TopTextHeaderWidget(profile: state.profile);
  }

  Widget _buildGoalsSection(HomeState state) {
    if (state.goalsError != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Don't Forget Your Daily Goal",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildSectionError(
            message: state.goalsError!,
            onRetry: () {
              ref.read(homeControllerProvider.notifier).loadHome();
            },
          ),
        ],
      );
    }

    if (state.goals.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }

  bool _hasFullPageError(HomeState state) {
    return !state.hasAnyContent &&
        state.profileError != null &&
        state.consistencyError != null &&
        state.goalsError != null;
  }

  Widget _buildFullPageError(HomeState state) {
    final messages = <String>[
      if (state.profileError != null) state.profileError!,
      if (state.consistencyError != null) state.consistencyError!,
      if (state.goalsError != null) state.goalsError!,
    ];

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
                  const Icon(Icons.cloud_off_outlined, size: 52),
                  const SizedBox(height: 16),
                  const Text(
                    'Unable to load Home',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(messages.join('\n'), textAlign: TextAlign.center),
                  const SizedBox(height: 20),
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

  Widget _buildSectionError({
    required String message,
    required VoidCallback onRetry,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          const Icon(Icons.cloud_off_outlined, size: 32),
          const SizedBox(height: 8),
          const Text(
            'Unable to load this section',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 10),
          TextButton(onPressed: onRetry, child: const Text('Try Again')),
        ],
      ),
    );
  }
}
