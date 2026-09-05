import 'package:flutter/material.dart';

import '../../domain/entities/home_consistency.dart';

class FriendsProgressWidget extends StatelessWidget {
  final List<FriendProgress> friends;

  const FriendsProgressWidget({super.key, required this.friends});

  @override
  Widget build(BuildContext context) {
    if (friends.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: const Text(
          'No friends progress available yet.',
          textAlign: TextAlign.center,
        ),
      );
    }

    return SizedBox(
      height: 145,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: friends.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return _FriendProgressCard(friend: friends[index]);
        },
      ),
    );
  }
}

class _FriendProgressCard extends StatelessWidget {
  final FriendProgress friend;

  const _FriendProgressCard({required this.friend});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundImage: friend.image != null && friend.image!.isNotEmpty
                ? NetworkImage(friend.image!)
                : null,
            child: friend.image == null || friend.image!.isEmpty
                ? Text(
                    _initial(friend.name),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                : null,
          ),
          const SizedBox(height: 8),
          Text(
            friend.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Text(
            '${friend.percentage.toStringAsFixed(0)}%',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  String _initial(String name) {
    if (name.trim().isEmpty) return '?';
    return name.trim()[0].toUpperCase();
  }
}
