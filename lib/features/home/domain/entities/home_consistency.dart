class HomeConsistency {
  final TodayCompleted todayCompleted;
  final List<ConsistencyEntry> consistency;
  final List<FriendProgress> friendsData;

  const HomeConsistency({
    required this.todayCompleted,
    required this.consistency,
    required this.friendsData,
  });
}

class TodayCompleted {
  final double percentage;

  const TodayCompleted({required this.percentage});
}

class ConsistencyEntry {
  final double completed;
  final DateTime createdAt;

  const ConsistencyEntry({required this.completed, required this.createdAt});
}

class FriendProgress {
  final String userId;
  final String name;
  final double percentage;
  final String? image;

  const FriendProgress({
    required this.userId,
    required this.name,
    required this.percentage,
    this.image,
  });
}
