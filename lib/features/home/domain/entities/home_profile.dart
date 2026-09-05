class HomeProfile {
  final String id;
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final String? gender;
  final int? age;
  final double? height;
  final String? activityLevel;
  final String? foodVibe;
  final String? mainGoal;
  final String? result;
  final String? training;
  final String? image;
  final String? profileImage;
  final List<HomeWeightEntry> weight;
  final HomeCalorie? calorie;
  final dynamic subscriptionPlan;
  final bool isTwoFactor;

  const HomeProfile({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.gender,
    this.age,
    this.height,
    this.activityLevel,
    this.foodVibe,
    this.mainGoal,
    this.result,
    this.training,
    this.image,
    this.profileImage,
    this.weight = const [],
    this.calorie,
    this.subscriptionPlan,
    required this.isTwoFactor,
  });
}

class HomeWeightEntry {
  final String? id;
  final double weightKg;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const HomeWeightEntry({
    this.id,
    required this.weightKg,
    this.createdAt,
    this.updatedAt,
  });
}

class HomeCalorie {
  final double consumedCalorie;
  final double calorieGoal;
  final double percentage;
  final double proteinGoal;
  final double fatGoal;
  final double carbGoal;
  final double consumedCarb;
  final double consumedFat;
  final double consumedProtein;
  final double completedGoal;

  const HomeCalorie({
    required this.consumedCalorie,
    required this.calorieGoal,
    required this.percentage,
    required this.proteinGoal,
    required this.fatGoal,
    required this.carbGoal,
    required this.consumedCarb,
    required this.consumedFat,
    required this.consumedProtein,
    required this.completedGoal,
  });
}
