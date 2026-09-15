import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/config/app_config.dart';
import '../../../../app/router/route_paths.dart';
import '../controllers/profile_state.dart';
import '../providers/profile_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final state = ref.read(profileControllerProvider);

      if (state.profile == null) {
        ref.read(profileControllerProvider.notifier).loadProfile();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(AppRoutes.updateProfile);
            },
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Edit Profile',
          ),
        ],
      ),
      body: _buildBody(state),
    );
  }

  Widget _buildBody(ProfileState state) {
    if (state.status == ProfileStatus.loading && state.profile == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == ProfileStatus.failure && state.profile == null) {
      return _ErrorView(
        message: state.errorMessage ?? 'Unable to load your profile.',
        onRetry: () {
          ref.read(profileControllerProvider.notifier).loadProfile();
        },
      );
    }

    final profile = state.profile;

    if (profile == null) {
      return _ErrorView(
        message: 'Profile data is unavailable.',
        onRetry: () {
          ref.read(profileControllerProvider.notifier).loadProfile();
        },
      );
    }

    return RefreshIndicator(
      onRefresh: () {
        return ref.read(profileControllerProvider.notifier).loadProfile();
      },
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          _ProfileHeader(
            name: profile.name,
            email: profile.email,
            image: profile.image,
          ),
          const SizedBox(height: 24),
          _SectionCard(
            title: 'Personal Information',
            children: [
              _InfoRow(
                icon: Icons.person_outline,
                label: 'First Name',
                value: profile.firstName,
              ),
              _InfoRow(
                icon: Icons.person_outline,
                label: 'Last Name',
                value: profile.lastName,
              ),
              _InfoRow(
                icon: Icons.email_outlined,
                label: 'Email',
                value: profile.email,
              ),
              _InfoRow(
                icon: Icons.wc_outlined,
                label: 'Gender',
                value: profile.gender ?? '',
              ),
              _InfoRow(
                icon: Icons.cake_outlined,
                label: 'Age',
                value: _formatValue(profile.age),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _SectionCard(
            title: 'Body Information',
            children: [
              _InfoRow(
                icon: Icons.height,
                label: 'Height',
                value: '${_formatValue(profile.height)} cm',
              ),
              _InfoRow(
                icon: Icons.monitor_weight_outlined,
                label: 'Weight',
                value: '${_formatValue(profile.weight.first.weightKg)} kg',
              ),
              _InfoRow(
                icon: Icons.local_fire_department_outlined,
                label: 'Daily Calories',
                value:
                    '${_formatValue(profile.calorie?.calorieGoal ?? 0)} kCal',
              ),
            ],
          ),
          const SizedBox(height: 16),
          _SectionCard(
            title: 'Fitness Preferences',
            children: [
              _InfoRow(
                icon: Icons.directions_run_outlined,
                label: 'Activity Level',
                value: profile.activityLevel ?? '',
              ),
              _InfoRow(
                icon: Icons.restaurant_outlined,
                label: 'Food Vibe',
                value: profile.foodVibe ?? '',
              ),
              _InfoRow(
                icon: Icons.flag_outlined,
                label: 'Main Goal',
                value: profile.mainGoal ?? '',
              ),
              _InfoRow(
                icon: Icons.auto_awesome_outlined,
                label: 'Result',
                value: profile.result ?? '',
              ),
              _InfoRow(
                icon: Icons.fitness_center_outlined,
                label: 'Training',
                value: profile.training ?? '',
              ),
            ],
          ),
          const SizedBox(height: 16),
          _SectionCard(
            title: 'Subscription',
            children: [
              _InfoRow(
                icon: Icons.workspace_premium_outlined,
                label: 'Plan',
                value: _formatSubscription(profile.subscriptionPlan),
              ),
              _InfoRow(
                icon: Icons.security_outlined,
                label: 'Two-Factor Authentication',
                value: profile.isTwoFactor == true ? 'Enabled' : 'Disabled',
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  String _formatValue(dynamic value) {
    if (value == null) {
      return 'Not available';
    }

    final text = value.toString().trim();

    if (text.isEmpty) {
      return 'Not available';
    }

    return text;
  }

  String _formatSubscription(dynamic value) {
    if (value == null) {
      return 'Free';
    }

    final text = value.toString().trim();

    if (text.isEmpty || text == 'null') {
      return 'Free';
    }

    return text;
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({
    required this.name,
    required this.email,
    required this.image,
  });

  final String? name;
  final String? email;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final displayName = name?.trim().isNotEmpty == true ? name!.trim() : 'User';

    final displayEmail = email?.trim().isNotEmpty == true
        ? email!.trim()
        : 'No email available';

    return Column(
      children: [
        CircleAvatar(
          radius: 52,
          backgroundImage: _imageProvider(image),
          child: _hasImage(image)
              ? null
              : const Icon(Icons.person_outline, size: 52),
        ),
        const SizedBox(height: 14),
        Text(
          displayName,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        Text(
          displayEmail,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  bool _hasImage(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  ImageProvider<Object>? _imageProvider(String? value) {
    if (!_hasImage(value)) {
      return null;
    }

    final image = value!.trim();

    if (image.startsWith('http://') || image.startsWith('https://')) {
      return NetworkImage(image);
    }

    return NetworkImage('${AppConfig.current.serverBaseUrl}/$image');
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 21),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}
