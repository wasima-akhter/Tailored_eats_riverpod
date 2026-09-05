import 'package:dio/dio.dart';

import '../../app/config/app_config.dart';
import '../constants/app_constants.dart';

class AiDioClient {
  AiDioClient({
    required AppConfig config,
    required List<Interceptor> interceptors,
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: config.aiBaseUrl,
           connectTimeout: AppConstants.connectTimeout,
           receiveTimeout: AppConstants.receiveTimeout,
           sendTimeout: AppConstants.sendTimeout,
           headers: const {
             'Accept': 'application/json',
             'Content-Type': 'application/json',
           },
           responseType: ResponseType.json,
         ),
       ) {
    _dio.interceptors.addAll(interceptors);
  }

  final Dio _dio;

  Dio get dio => _dio;
}
