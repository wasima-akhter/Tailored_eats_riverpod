import 'package:tailored_eats_riverpod/core/network/api_client.dart';

import 'models/pending_action.dart';

class SyncService {
  final ApiClient _apiClient;

  const SyncService({required this._apiClient});

  Future<void> execute(PendingAction action) async {
    switch (action.method.toUpperCase()) {
      case 'POST':
        await _apiClient.post(
          action.endpoint,
          data: action.data,
          queryParameters: action.queryParameters,
        );
        break;

      case 'PUT':
        await _apiClient.put(
          action.endpoint,
          data: action.data,
          queryParameters: action.queryParameters,
        );
        break;

      case 'PATCH':
        await _apiClient.patch(
          action.endpoint,
          data: action.data,
          queryParameters: action.queryParameters,
        );
        break;

      case 'DELETE':
        await _apiClient.delete(
          action.endpoint,
          data: action.data,
          queryParameters: action.queryParameters,
        );
        break;

      case 'GET':
        await _apiClient.get(
          action.endpoint,
          queryParameters: action.queryParameters,
        );
        break;

      default:
        throw UnsupportedError('Unsupported HTTP method: ${action.method}');
    }
  }
}
