class Goal {
  final String id;
  final String title;
  final String? description;
  final bool isCompleted;

  const Goal({
    required this.id,
    required this.title,
    this.description,
    required this.isCompleted,
  });
}
