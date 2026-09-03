import '../../domain/entities/auth_user.dart';

class AuthUserModel {
  final String? id;
  final String name;
  final String email;

  const AuthUserModel({this.id, required this.name, required this.email});

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: json['_id'] as String?,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );
  }

  AuthUser toEntity() {
    return AuthUser(id: id, name: name, email: email);
  }
}
