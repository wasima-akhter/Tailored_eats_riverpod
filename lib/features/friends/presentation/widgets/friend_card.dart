import 'package:flutter/material.dart';

import '../../domain/entities/friend.dart';

class FriendCard extends StatelessWidget {
  const FriendCard({
    super.key,
    required this.friend,
    required this.onTap,
    required this.onUnfriend,
    this.isUnfriending = false,
  });

  final Friend friend;
  final VoidCallback onTap;
  final VoidCallback onUnfriend;
  final bool isUnfriending;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                child: Text(
                  friend.name.isNotEmpty ? friend.name[0].toUpperCase() : '?',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      friend.name.isEmpty ? 'Unknown user' : friend.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      friend.mainGoal.isEmpty
                          ? 'No goal specified'
                          : friend.mainGoal,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${friend.percentage}% consistency',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip: 'Unfriend',
                onPressed: isUnfriending ? null : onUnfriend,
                icon: isUnfriending
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.person_remove_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
