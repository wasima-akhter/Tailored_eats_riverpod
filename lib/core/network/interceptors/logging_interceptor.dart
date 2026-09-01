import 'package:dio/dio.dart';

class ApiLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    assert(() {
      print(
        '[API REQUEST] '
        '${options.method} ${options.uri}',
      );

      if (!_isSensitiveEndpoint(options.path) && options.data != null) {
        print('[API BODY] ${options.data}');
      }

      return true;
    }());

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    assert(() {
      print(
        '[API RESPONSE] '
        '${response.statusCode} '
        '${response.requestOptions.method} '
        '${response.requestOptions.uri}',
      );

      return true;
    }());

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    assert(() {
      print(
        '[API ERROR] '
        '${err.response?.statusCode} '
        '${err.requestOptions.method} '
        '${err.requestOptions.uri}',
      );

      return true;
    }());

    handler.next(err);
  }

  bool _isSensitiveEndpoint(String path) {
    const sensitiveEndpoints = <String>{
      '/auth/login',
      '/auth/register',
      '/auth/forget-password',
      '/auth/reset-password',
    };

    return sensitiveEndpoints.contains(path);
  }
}
