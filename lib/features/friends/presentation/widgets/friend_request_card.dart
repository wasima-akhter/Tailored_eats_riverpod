import 'package:flutter/material.dart';

import '../../domain/entities/friend_request.dart';

class FriendRequestCard extends StatelessWidget {
  const FriendRequestCard({
    super.key,
    required this.request,
    required this.onAccept,
    required this.onReject,
    this.isAccepting = false,
    this.isRejecting = false,
  });

  final FriendRequest request;
  final VoidCallback onAccept;
  final VoidCallback onReject;
  final bool isAccepting;
  final bool isRejecting;

  @override
  Widget build(BuildContext context) {
    final isLoading = isAccepting || isRejecting;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              child: Text(
                request.name.isNotEmpty ? request.name[0].toUpperCase() : '?',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    request.name.isEmpty ? 'Unknown user' : request.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    request.mainGoal.isEmpty
                        ? 'No goal specified'
                        : request.mainGoal,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: isLoading ? null : onReject,
                          child: isRejecting
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text('Reject'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: isLoading ? null : onAccept,
                          child: isAccepting
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text('Accept'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
