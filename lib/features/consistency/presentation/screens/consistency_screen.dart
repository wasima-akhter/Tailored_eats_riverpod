import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/consistency_provider.dart';
import '../widgets/add_progress_image_card.dart';
import '../widgets/add_weight_card.dart';
import '../widgets/consistancy_goal_progress_card.dart';
import '../widgets/daily_calorie_summary.dart';
import '../widgets/meal_summary_card.dart';
import '../widgets/progress_image_gallery.dart';
import '../widgets/suggestion_card.dart';
import '../widgets/weight_history_card.dart';

class ConsistencyScreen extends ConsumerWidget {
  const ConsistencyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(consistencyNotifierProvider);
    final weightState = ref.watch(weightHistoryProvider);
    final progressImageState = ref.watch(progressImagesProvider);

    final summary = state.summary;

    return Scaffold(
      appBar: AppBar(title: const Text('Consistency')),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return ref.read(consistencyNotifierProvider.notifier).refresh();
          },
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            children: [
              ConsistancyGoalProgressCard(percentage: summary?.todayPercentage),
              const SizedBox(height: 16),

              DailyCalorieSummary(days: summary?.consistency ?? const []),
              const SizedBox(height: 16),

              MealSummaryCard(percentage: summary?.todayPercentage),
              const SizedBox(height: 16),

              SuggestionCard(percentage: summary?.todayPercentage),
              const SizedBox(height: 16),

              _FriendsConsistencyCard(friends: summary?.friends ?? const []),
              const SizedBox(height: 16),

              AddWeightCard(
                onAdd: (weight) async {
                  final result = await ref
                      .read(consistencyNotifierProvider.notifier)
                      .addWeight(weight: weight);

                  if (result == null) {
                    throw Exception('Unable to add weight.');
                  }

                  ref.invalidate(weightHistoryProvider);
                },
              ),
              const SizedBox(height: 16),

              weightState.when(
                loading: () {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Weight history is currently unavailable.'),
                    ),
                  );
                },
                data: (weights) {
                  if (weights.isEmpty) {
                    return const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('No weight history available yet.'),
                      ),
                    );
                  }

                  return WeightHistoryCard(weights: weights);
                },
              ),

              const SizedBox(height: 16),

              AddProgressImageCard(
                onUpload: (imagePath) async {
                  final result = await ref
                      .read(consistencyNotifierProvider.notifier)
                      .addProgressImage(imagePath: imagePath);

                  if (result == null) {
                    return false;
                  }

                  ref.invalidate(progressImagesProvider);

                  return true;
                },
              ),
              const SizedBox(height: 16),

              progressImageState.when(
                loading: () {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Progress images are currently unavailable.'),
                    ),
                  );
                },
                data: (images) {
                  if (images.isEmpty) {
                    return const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('No progress images added yet.'),
                      ),
                    );
                  }

                  return ProgressImageGallery(images: images);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FriendsConsistencyCard extends StatelessWidget {
  final List<dynamic> friends;

  const _FriendsConsistencyCard({required this.friends});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Friends',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            if (friends.isEmpty)
              const Text('No friends consistency data available yet.')
            else
              ...friends.map(
                (friend) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Text(
                          friend.name.isNotEmpty
                              ? friend.name[0].toUpperCase()
                              : '?',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          friend.name.isEmpty ? 'Unknown user' : friend.name,
                        ),
                      ),
                      Text(
                        '${friend.percentage}%',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
