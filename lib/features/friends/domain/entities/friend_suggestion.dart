class FriendSuggestion {
  final String id;
  final String userId;
  final String friendId;
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final int? age;
  final double? height;
  final String activityLevel;
  final String foodVibe;
  final String mainGoal;
  final String result;
  final String training;
  final String image;
  final DateTime createdAt;

  const FriendSuggestion({
    required this.id,
    required this.userId,
    required this.friendId,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.age,
    required this.height,
    required this.activityLevel,
    required this.foodVibe,
    required this.mainGoal,
    required this.result,
    required this.training,
    required this.image,
    required this.createdAt,
  });
}
