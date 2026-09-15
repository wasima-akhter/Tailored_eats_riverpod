import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
    required this.onLogout,
    required this.onProfile,
  });

  final VoidCallback onLogout;
  final VoidCallback onProfile;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: onProfile,
          icon: const Icon(Icons.person_outline),
          tooltip: 'Profile',
        ),
        IconButton(
          tooltip: 'Logout',
          onPressed: onLogout,
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }
}
