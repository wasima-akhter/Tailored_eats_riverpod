class HomeGoal {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;

  const HomeGoal({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.createdAt,
  });
}
