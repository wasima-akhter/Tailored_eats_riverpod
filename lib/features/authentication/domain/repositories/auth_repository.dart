import '../entities/auth_session.dart';

abstract class AuthRepository {
  Future<AuthSession> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<AuthSession> login({required String email, required String password});

  Future<String> sendEmailOtp({required String email});

  Future<bool> verifyEmailOtp({required String email, required String otp});

  Future<void> requestPasswordReset({required String email});

  Future<String> verifyPasswordResetOtp({
    required String email,
    required String otp,
  });

  Future<void> resetPassword({
    required String token,
    required String newPassword,
    required String confirmPassword,
  });
}
