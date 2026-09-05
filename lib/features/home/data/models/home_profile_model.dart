import 'package:flutter/material.dart';

import '../../domain/entities/home_profile.dart';

class HomeProfileModel {
  final String? id;
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
  final List<WeightEntryModel> weight;
  final CalorieModel? calorie;
  final dynamic subscriptionPlan;
  final bool isTwoFactor;

  const HomeProfileModel({
    this.id,
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

  factory HomeProfileModel.fromJson(Map<String, dynamic> json) {
    debugPrint('-->age: ${json['age']} | ${json['age'].runtimeType}');
    debugPrint('-->height: ${json['height']} | ${json['height'].runtimeType}');
    debugPrint('-->weight: ${json['weight']} | ${json['weight'].runtimeType}');
    debugPrint(
      '-->calorie: ${json['calorie']} | ${json['calorie'].runtimeType}',
    );
    return HomeProfileModel(
      id: json['_id'] as String?,
      name: json['name'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      gender: json['gender'] as String?,
      age: (json['age'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toDouble(),
      activityLevel: json['activityLevel'] as String?,
      foodVibe: json['foodVibe'] as String?,
      mainGoal: json['mainGoal'] as String?,
      result: json['result'] as String?,
      training: json['training'] as String?,
      image: json['image'] as String?,
      profileImage: json['profile_image'] as String?,
      weight: (json['weight'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map((item) => WeightEntryModel.fromJson(item))
          .toList(),
      calorie: json['calorie'] is Map<String, dynamic>
          ? CalorieModel.fromJson(json['calorie'] as Map<String, dynamic>)
          : null,
      subscriptionPlan: json['subscriptionPlan'],
      isTwoFactor: json['isTwoFactor'] as bool? ?? false,
    );
  }

  HomeProfile toEntity() {
    return HomeProfile(
      id: id ?? '',
      name: name,
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      age: age,
      height: height,
      activityLevel: activityLevel,
      foodVibe: foodVibe,
      mainGoal: mainGoal,
      result: result,
      training: training,
      image: image,
      profileImage: profileImage,
      weight: weight.map((item) => item.toEntity()).toList(),

      calorie: calorie?.toEntity(),

      subscriptionPlan: subscriptionPlan,
      isTwoFactor: isTwoFactor,
    );
  }
}

class WeightEntryModel {
  final String? id;
  final double weightKg;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const WeightEntryModel({
    this.id,
    required this.weightKg,
    this.createdAt,
    this.updatedAt,
  });

  factory WeightEntryModel.fromJson(Map<String, dynamic> json) {
    return WeightEntryModel(
      id: json['_id'] as String?,
      weightKg: (json['weightKg'] as num?)?.toDouble() ?? 0.0,
      createdAt: DateTime.tryParse(json['createdAt'] as String? ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] as String? ?? ''),
    );
  }
  HomeWeightEntry toEntity() {
    return HomeWeightEntry(
      id: id,
      weightKg: weightKg,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

class CalorieModel {
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

  const CalorieModel({
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

  factory CalorieModel.fromJson(Map<String, dynamic> json) {
    return CalorieModel(
      consumedCalorie: (json['consumedCalorie'] as num?)?.toDouble() ?? 0.0,
      calorieGoal: (json['calorieGoal'] as num?)?.toDouble() ?? 0.0,
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0.0,
      proteinGoal: (json['proteinGoal'] as num?)?.toDouble() ?? 0.0,
      fatGoal: (json['fatGoal'] as num?)?.toDouble() ?? 0.0,
      carbGoal: (json['carbGoal'] as num?)?.toDouble() ?? 0.0,
      consumedCarb: (json['consumedCarb'] as num?)?.toDouble() ?? 0.0,
      consumedFat: (json['consumedFat'] as num?)?.toDouble() ?? 0.0,
      consumedProtein: (json['consumedProtein'] as num?)?.toDouble() ?? 0.0,
      completedGoal: (json['completedGoal'] as num?)?.toDouble() ?? 0.0,
    );
  }
  HomeCalorie toEntity() {
    return HomeCalorie(
      consumedCalorie: consumedCalorie,
      calorieGoal: calorieGoal,
      percentage: percentage,
      proteinGoal: proteinGoal,
      fatGoal: fatGoal,
      carbGoal: carbGoal,
      consumedCarb: consumedCarb,
      consumedFat: consumedFat,
      consumedProtein: consumedProtein,
      completedGoal: completedGoal,
    );
  }
}
