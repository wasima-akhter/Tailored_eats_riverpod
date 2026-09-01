import 'package:dio/dio.dart';

import '../../storage/storage_service.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({required this._storageService});

  final StorageService _storageService;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _storageService.getAccessToken();

    if (accessToken != null &&
        accessToken.isNotEmpty &&
        _requiresAuthentication(options)) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  bool _requiresAuthentication(RequestOptions options) {
    const publicEndpoints = <String>{
      '/auth/register',
      '/auth/login',
      '/auth/send-email-otp',
      '/auth/check-email-otp',
      '/auth/forget-password',
      '/auth/forget-password-check-otp',
      '/auth/reset-password',
    };

    return !publicEndpoints.contains(options.path);
  }
}
