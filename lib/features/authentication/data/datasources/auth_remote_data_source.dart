//
import 'package:tailored_eats_riverpod/core/constants/api_constants.dart';

import '../../../../core/network/api_client.dart';
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

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  const AuthRemoteDataSourceImpl({required this._apiClient});

  @override
  Future<AuthResponseModel> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      ApiConstants.register,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
      },
    );

    return AuthResponseModel.fromJson(response.data!);
  }

  @override
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      ApiConstants.login,
      data: {'email': email, 'password': password},
    );

    return AuthResponseModel.fromJson(response.data!);
  }

  @override
  Future<String> sendEmailOtp({required String email}) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      ApiConstants.sendEmailOtp,
      data: {'email': email},
    );

    final data = response.data?['data'] as Map<String, dynamic>?;

    return data?['email'] as String? ?? email;
  }

  @override
  Future<bool> verifyEmailOtp({
    required String email,
    required String otp,
  }) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      ApiConstants.checkEmailOtp,
      data: {'email': email, 'code': otp},
    );

    final data = response.data?['data'] as Map<String, dynamic>?;

    return data?['isVerified'] as bool? ?? false;
  }

  @override
  Future<void> requestPasswordReset({required String email}) async {
    await _apiClient.post<Map<String, dynamic>>(
      ApiConstants.forgotPassword,
      data: {'email': email},
    );
  }

  @override
  Future<ForgotPasswordOtpResponseModel> verifyPasswordResetOtp({
    required String email,
    required String otp,
  }) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      ApiConstants.checkForgotPasswordOtp,
      data: {'email': email, 'code': otp},
    );

    return ForgotPasswordOtpResponseModel.fromJson(response.data!);
  }

  @override
  Future<void> resetPassword({
    required String email,
    required String token,
    required String newPassword,
    required String confirmPassword,
  }) async {
    await _apiClient.patch<Map<String, dynamic>>(
      ApiConstants.resetPassword,
      data: {
        'email': email,
        'token': token,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword,
      },
    );
  }
}
