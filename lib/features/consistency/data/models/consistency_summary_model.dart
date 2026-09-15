import '../../domain/entities/consistency_summary.dart';
import 'consistency_day_model.dart';
import 'consistency_friend_model.dart';

class ConsistencySummaryModel {
  final int todayPercentage;
  final List<ConsistencyDayModel> consistency;
  final List<ConsistencyFriendModel> friends;

  const ConsistencySummaryModel({
    required this.todayPercentage,
    required this.consistency,
    required this.friends,
  });

  factory ConsistencySummaryModel.fromJson(Map<String, dynamic> json) {
    final consistencyJson = json['consistency'];

    final friendsJson = json['friendsData'];

    return ConsistencySummaryModel(
      todayPercentage: _parseTodayPercentage(json['todayCompleted']),
      consistency: _parseConsistency(consistencyJson),
      friends: _parseFriends(friendsJson),
    );
  }

  ConsistencySummary toEntity() {
    return ConsistencySummary(
      todayPercentage: todayPercentage,
      consistency: consistency.map((item) => item.toEntity()).toList(),
      friends: friends.map((item) => item.toEntity()).toList(),
    );
  }

  static int _parseTodayPercentage(dynamic value) {
    if (value is Map<String, dynamic>) {
      final percentage = value['percentage'];

      if (percentage is int) return percentage;
      if (percentage is num) return percentage.toInt();

      return int.tryParse(percentage?.toString() ?? '') ?? 0;
    }

    return 0;
  }

  static List<ConsistencyDayModel> _parseConsistency(dynamic value) {
    if (value is! List) {
      return const [];
    }

    return value
        .whereType<Map<String, dynamic>>()
        .map(ConsistencyDayModel.fromJson)
        .toList();
  }

  static List<ConsistencyFriendModel> _parseFriends(dynamic value) {
    if (value is! List) {
      return const [];
    }

    return value
        .whereType<Map<String, dynamic>>()
        .map(ConsistencyFriendModel.fromJson)
        .toList();
  }
}
