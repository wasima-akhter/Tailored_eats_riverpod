import '../../../../core/network/api_client.dart';

abstract class FriendsRemoteDataSource {
  Future<Map<String, dynamic>> getFriendSuggestions({
    int page = 1,
    int limit = 20,
    String? search,
  });

  Future<Map<String, dynamic>> sendFriendRequest({required String receiverId});

  Future<List<Map<String, dynamic>>> searchFriends({
    required String searchName,
  });

  Future<List<Map<String, dynamic>>> getAllFriends();

  Future<Map<String, dynamic>> getFriendDetails({required String userId});

  Future<List<Map<String, dynamic>>> getFriendRequests();

  Future<Map<String, dynamic>> acceptFriendRequest({required String friendId});

  Future<Map<String, dynamic>> rejectFriendRequest({required String friendId});

  Future<Map<String, dynamic>> unfriend({required String friendId});
}

class FriendsRemoteDataSourceImpl implements FriendsRemoteDataSource {
  const FriendsRemoteDataSourceImpl({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<Map<String, dynamic>> getFriendSuggestions({
    int page = 1,
    int limit = 20,
    String? search,
  }) async {
    final queryParameters = <String, dynamic>{'page': page, 'limit': limit};

    if (search != null && search.trim().isNotEmpty) {
      queryParameters['search'] = search.trim();
    }

    final response = await apiClient.get(
      '/friend/get-friend-suggestions',
      queryParameters: queryParameters,
    );

    if (response.data is Map<String, dynamic>) {
      return response.data as Map<String, dynamic>;
    }

    return const {};
  }

  @override
  Future<Map<String, dynamic>> sendFriendRequest({
    required String receiverId,
  }) async {
    final response = await apiClient.post(
      '/friend/add-friend',
      data: {'receiverId': receiverId},
    );

    return _extractDataMap(response.data);
  }

  @override
  Future<List<Map<String, dynamic>>> searchFriends({
    required String searchName,
  }) async {
    final response = await apiClient.get(
      '/friend/search-friend',
      queryParameters: {'searchName': searchName.trim()},
    );

    return _extractDataList(response.data);
  }

  @override
  Future<List<Map<String, dynamic>>> getAllFriends() async {
    final response = await apiClient.get('/friend/get-all-friend');

    return _extractDataList(response.data);
  }

  @override
  Future<Map<String, dynamic>> getFriendDetails({
    required String userId,
  }) async {
    final response = await apiClient.get('/friend/friend-detail/$userId');

    return _extractDataMap(response.data);
  }

  @override
  Future<List<Map<String, dynamic>>> getFriendRequests() async {
    final response = await apiClient.get('/friend/get-all-friend-request');

    return _extractDataList(response.data);
  }

  @override
  Future<Map<String, dynamic>> acceptFriendRequest({
    required String friendId,
  }) async {
    final response = await apiClient.patch(
      '/friend/accept-request',
      data: {'friendId': friendId},
    );

    return _extractDataMap(response.data);
  }

  @override
  Future<Map<String, dynamic>> rejectFriendRequest({
    required String friendId,
  }) async {
    final response = await apiClient.patch(
      '/friend/reject-request',
      data: {'friendId': friendId},
    );

    return _extractDataMap(response.data);
  }

  @override
  Future<Map<String, dynamic>> unfriend({required String friendId}) async {
    final response = await apiClient.delete('/friend/make-unfriend/$friendId');

    return _extractDataMap(response.data);
  }

  Map<String, dynamic> _extractDataMap(dynamic responseData) {
    if (responseData is! Map<String, dynamic>) {
      return const {};
    }

    final data = responseData['data'];

    if (data is Map<String, dynamic>) {
      return data;
    }

    return const {};
  }

  List<Map<String, dynamic>> _extractDataList(dynamic responseData) {
    if (responseData is! Map<String, dynamic>) {
      return const [];
    }

    final data = responseData['data'];

    if (data is! List) {
      return const [];
    }

    return data.whereType<Map<String, dynamic>>().toList();
  }
}
