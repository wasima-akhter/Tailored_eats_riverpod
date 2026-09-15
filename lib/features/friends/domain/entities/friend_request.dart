class FriendRequest {
  final String senderId;
  final String name;
  final String mainGoal;
  final String image;
  final DateTime createdAt;

  const FriendRequest({
    required this.senderId,
    required this.name,
    required this.mainGoal,
    required this.image,
    required this.createdAt,
  });
}
