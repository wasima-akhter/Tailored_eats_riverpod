//

import '../models/auth_response_model.dart';
import '../models/forgot_password_otp_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<AuthResponseModel> login({
    required String email,
    required String password,
  });

  Future<String> sendEmailOtp({required String email});

  Future<bool> verifyEmailOtp({required String email, required String otp});

  Future<void> requestPasswordReset({required String email});

  Future<ForgotPasswordOtpResponseModel> verifyPasswordResetOtp({
    required String email,
    required String otp,
  });

  Future<void> resetPassword({
    required String email,
    required String token,
    required String newPassword,
    required String confirmPassword,
  });
}

///
///
///
