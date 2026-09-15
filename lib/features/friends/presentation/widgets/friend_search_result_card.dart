import 'package:flutter/material.dart';

import '../../domain/entities/friend_search_result.dart';

class FriendSearchResultCard extends StatelessWidget {
  const FriendSearchResultCard({
    super.key,
    required this.result,
    required this.onTap,
  });

  final FriendSearchResult result;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          child: Text(
            result.name.isNotEmpty ? result.name[0].toUpperCase() : '?',
          ),
        ),
        title: Text(
          result.name.isEmpty ? 'Unknown user' : result.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          result.mainGoal.isEmpty ? 'No goal specified' : result.mainGoal,
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
