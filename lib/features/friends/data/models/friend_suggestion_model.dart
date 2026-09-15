import '../../domain/entities/friend_suggestion.dart';

class FriendSuggestionModel {
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

  const FriendSuggestionModel({
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

  factory FriendSuggestionModel.fromJson(Map<String, dynamic> json) {
    return FriendSuggestionModel(
      id: _string(json['_id']),
      userId: _string(json['userId']),
      friendId: _string(json['friendId']),
      name: _string(json['name']),
      firstName: _string(json['firstName']),
      lastName: _string(json['lastName']),
      email: _string(json['email']),
      gender: _string(json['gender']),
      age: _int(json['age']),
      height: _double(json['height']),
      activityLevel: _string(json['activityLevel']),
      foodVibe: _string(json['foodVibe']),
      mainGoal: _string(json['mainGoal']),
      result: _string(json['result']),
      training: _string(json['training']),
      image: _string(json['image']).isNotEmpty
          ? _string(json['image'])
          : _string(json['profile_image']),
      createdAt: _date(json['createdAt']),
    );
  }

  FriendSuggestion toEntity() {
    return FriendSuggestion(
      id: id,
      userId: userId,
      friendId: friendId,
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
      createdAt: createdAt,
    );
  }

  static String _string(dynamic value) => value?.toString() ?? '';

  static int? _int(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value?.toString() ?? '');
  }

  static double? _double(dynamic value) {
    if (value is double) return value;
    if (value is num) return value.toDouble();
    return double.tryParse(value?.toString() ?? '');
  }

  static DateTime _date(dynamic value) {
    return DateTime.tryParse(value?.toString() ?? '') ??
        DateTime.fromMillisecondsSinceEpoch(0);
  }
}
