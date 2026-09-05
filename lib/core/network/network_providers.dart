import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/config/app_config.dart';
import '../storage/storage_provider.dart';
import 'ai_dio_client.dart';
import 'api_client.dart';
import 'dio_client.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

/// App configuration.
final appConfigProvider = Provider<AppConfig>((ref) {
  return AppConfig.current;
});

/// Authentication interceptor.
final authInterceptorProvider = Provider<AuthInterceptor>((ref) {
  return AuthInterceptor(storageService: ref.watch(storageServiceProvider));
});

/// API logging interceptor.
final apiLogInterceptorProvider = Provider<ApiLogInterceptor>((ref) {
  return ApiLogInterceptor();
});

/// Configured Dio client.
final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient(
    config: ref.watch(appConfigProvider),
    interceptors: [
      ref.watch(authInterceptorProvider),
      ref.watch(apiLogInterceptorProvider),
    ],
  );
});

/// Raw Dio instance.
///
/// Use this only when a lower-level Dio instance is specifically needed.
final dioProvider = Provider<Dio>((ref) {
  return ref.watch(dioClientProvider).dio;
});

final aiDioClientProvider = Provider<AiDioClient>((ref) {
  return AiDioClient(
    config: ref.watch(appConfigProvider),
    interceptors: [ref.watch(apiLogInterceptorProvider)],
  );
});
final aiApiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref.watch(aiDioClientProvider).dio);
});

/// Main API client.
///
/// Features/repositories should normally depend on this
/// instead of accessing Dio directly.
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref.watch(dioProvider));
});
