import 'package:flutter/material.dart';

import '../../domain/entities/home_profile.dart';

class TopTextHeaderWidget extends StatelessWidget {
  final HomeProfile? profile;

  const TopTextHeaderWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final name = profile?.firstName.isNotEmpty == true
        ? profile!.firstName
        : profile?.name ?? 'there';

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, $name 👋',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Let’s make today a healthy one.',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
