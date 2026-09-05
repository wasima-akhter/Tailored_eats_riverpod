import 'package:flutter/material.dart';

import '../../domain/entities/home_consistency.dart';

class HomeConsistencyModel {
  final TodayCompletedModel todayCompleted;
  final List<ConsistencyEntryModel> consistency;
  final List<FriendProgressModel> friendsData;

  const HomeConsistencyModel({
    required this.todayCompleted,
    required this.consistency,
    required this.friendsData,
  });

  factory HomeConsistencyModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? {};

    return HomeConsistencyModel(
      todayCompleted: TodayCompletedModel.fromJson(
        data['todayCompleted'] as Map<String, dynamic>? ?? {},
      ),
      consistency: (data['consistency'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(ConsistencyEntryModel.fromJson)
          .toList(),
      friendsData: (data['friendsData'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(FriendProgressModel.fromJson)
          .toList(),
    );
  }

  HomeConsistency toEntity() {
    return HomeConsistency(
      todayCompleted: todayCompleted.toEntity(),
      consistency: consistency.map((item) => item.toEntity()).toList(),
      friendsData: friendsData.map((item) => item.toEntity()).toList(),
    );
  }
}

class TodayCompletedModel {
  final double percentage;

  const TodayCompletedModel({required this.percentage});

  factory TodayCompletedModel.fromJson(Map<String, dynamic> json) {
    debugPrint('TodayCompletedModel percentage value: ${json['percentage']}');
    debugPrint(
      'TodayCompletedModel percentage type: ${json['percentage'].runtimeType}',
    );
    return TodayCompletedModel(
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0.0,
    );
  }

  TodayCompleted toEntity() {
    return TodayCompleted(percentage: percentage);
  }
}

class ConsistencyEntryModel {
  final double completed;
  final DateTime createdAt;

  const ConsistencyEntryModel({
    required this.completed,
    required this.createdAt,
  });

  factory ConsistencyEntryModel.fromJson(Map<String, dynamic> json) {
    debugPrint('ConsistencyEntryModel completed value: ${json['completed']}');
    debugPrint(
      'ConsistencyEntryModel completed type: ${json['completed'].runtimeType}',
    );
    return ConsistencyEntryModel(
      completed: (json['completed'] as num?)?.toDouble() ?? 0.0,
      createdAt:
          DateTime.tryParse(json['createdAt'] as String? ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  ConsistencyEntry toEntity() {
    return ConsistencyEntry(completed: completed, createdAt: createdAt);
  }
}

class FriendProgressModel {
  final String userId;
  final String name;
  final double percentage;
  final String? image;

  const FriendProgressModel({
    required this.userId,
    required this.name,
    required this.percentage,
    this.image,
  });

  factory FriendProgressModel.fromJson(Map<String, dynamic> json) {
    debugPrint('FriendProgressModel percentage value: ${json['percentage']}');
    debugPrint(
      'FriendProgressModel percentage type: ${json['percentage'].runtimeType}',
    );
    return FriendProgressModel(
      userId: json['userId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0.0,
      image: json['image'] as String?,
    );
  }

  FriendProgress toEntity() {
    return FriendProgress(
      userId: userId,
      name: name,
      percentage: percentage,
      image: image,
    );
  }
}
