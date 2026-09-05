import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      ref.read(profileControllerProvider.notifier).loadProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: _buildBody(state),
    );
  }

  Widget _buildBody(ProfileState state) {
    switch (state.status) {
      case ProfileStatus.initial:
      case ProfileStatus.loading:
        return const Center(child: CircularProgressIndicator());

      case ProfileStatus.failure:
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.person_outline, size: 48),
                const SizedBox(height: 16),
                Text(
                  state.errorMessage ?? 'Unable to load your profile.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () {
                    ref.read(profileControllerProvider.notifier).retry();
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Try Again'),
                ),
              ],
            ),
          ),
        );

      case ProfileStatus.success:
        final profile = state.profile;

        if (profile == null) {
          return const Center(
            child: Text('Profile information is unavailable.'),
          );
        }

        return _ProfileContent(profile: profile);
    }
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent({required this.profile});

  final dynamic profile;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 48,
            backgroundImage:
                profile.profileImage != null && profile.profileImage!.isNotEmpty
                ? NetworkImage(profile.profileImage!)
                : null,
            child: profile.profileImage == null || profile.profileImage!.isEmpty
                ? const Icon(Icons.person, size: 48)
                : null,
          ),
          const SizedBox(height: 16),
          Text(
            profile.name,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(profile.email, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 24),
          _ProfileInfoTile(title: 'First Name', value: profile.firstName),
          _ProfileInfoTile(title: 'Last Name', value: profile.lastName),
          _ProfileInfoTile(
            title: 'Gender',
            value: profile.gender ?? 'Not provided',
          ),
          _ProfileInfoTile(
            title: 'Age',
            value: profile.age?.toString() ?? 'Not provided',
          ),
          _ProfileInfoTile(
            title: 'Height',
            value: profile.height != null
                ? '${profile.height} cm'
                : 'Not provided',
          ),
          _ProfileInfoTile(
            title: 'Activity Level',
            value: profile.activityLevel ?? 'Not provided',
          ),
          _ProfileInfoTile(
            title: 'Main Goal',
            value: profile.mainGoal ?? 'Not provided',
          ),
          _ProfileInfoTile(
            title: 'Food Vibe',
            value: profile.foodVibe ?? 'Not provided',
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoTile extends StatelessWidget {
  const _ProfileInfoTile({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      subtitle: Text(value),
    );
  }
}
