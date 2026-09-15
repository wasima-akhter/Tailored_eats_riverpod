import 'friend_consistency.dart';
import 'friend_progress_image.dart';

class FriendDetail {
  final String id;
  final String name;
  final String mainGoal;
  final List<FriendConsistency> consistency;
  final List<FriendProgressImage> images;

  const FriendDetail({
    required this.id,
    required this.name,
    required this.mainGoal,
    required this.consistency,
    required this.images,
  });
}
