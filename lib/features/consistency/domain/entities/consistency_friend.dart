class ConsistencyFriend {
  final String userId;
  final String name;
  final int percentage;
  final String? image;

  const ConsistencyFriend({
    required this.userId,
    required this.name,
    required this.percentage,
    this.image,
  });
}
