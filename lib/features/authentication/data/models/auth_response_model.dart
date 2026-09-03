import '../../domain/entities/auth_session.dart';
import 'auth_user_model.dart';

class AuthResponseModel {
  final AuthUserModel user;
  final String accessToken;

  const AuthResponseModel({required this.user, required this.accessToken});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;

    return AuthResponseModel(
      user: AuthUserModel.fromJson(data['user'] as Map<String, dynamic>),
      accessToken: data['accessToken'] as String,
    );
  }

  AuthSession toEntity() {
    return AuthSession(user: user.toEntity(), accessToken: accessToken);
  }
}
