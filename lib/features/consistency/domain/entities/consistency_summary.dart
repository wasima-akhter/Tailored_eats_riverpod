import 'consistency_day.dart';
import 'consistency_friend.dart';

class ConsistencySummary {
  final int todayPercentage;
  final List<ConsistencyDay> consistency;
  final List<ConsistencyFriend> friends;

  const ConsistencySummary({
    required this.todayPercentage,
    required this.consistency,
    required this.friends,
  });
}
