// class Goal {
//   final String id;
//   final String title;
//   final String? description;
//   final bool isCompleted;

//   const Goal({
//     required this.id,
//     required this.title,
//     this.description,
//     required this.isCompleted,
//   });
// }
class Goal {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;

  const Goal({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.createdAt,
  });
}

class GoalPercentage {
  final int totalGoals;
  final int completedGoals;
  final int percentage;

  const GoalPercentage({
    required this.totalGoals,
    required this.completedGoals,
    required this.percentage,
  });
}
