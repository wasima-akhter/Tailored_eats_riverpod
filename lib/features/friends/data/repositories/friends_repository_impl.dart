import '../../domain/entities/friend.dart';
import '../../domain/entities/friend_detail.dart';
import '../../domain/entities/friend_request.dart';
import '../../domain/entities/friend_search_result.dart';
import '../../domain/entities/friend_suggestions_page.dart';
import '../../domain/repositories/friends_repository.dart';
import '../datasources/friends_remote_data_source.dart';
import '../models/friend_detail_model.dart';
import '../models/friend_model.dart';
import '../models/friend_request_model.dart';
import '../models/friend_search_result_model.dart';
import '../models/friend_suggestions_page_model.dart';

class FriendsRepositoryImpl implements FriendsRepository {
  const FriendsRepositoryImpl({required this.remoteDataSource});

  final FriendsRemoteDataSource remoteDataSource;

  @override
  Future<FriendSuggestionsPage> getFriendSuggestions({
    int page = 1,
    int limit = 20,
    String? search,
  }) async {
    final data = await remoteDataSource.getFriendSuggestions(
      page: page,
      limit: limit,
      search: search,
    );

    final items = data['data'];

    final meta = data['meta'];

    return FriendSuggestionsPageModel.fromJson({
      'items': items is List ? items : const [],
      if (meta is Map<String, dynamic>) ...meta,
    }).toEntity();
  }

  @override
  Future<void> sendFriendRequest({required String receiverId}) async {
    await remoteDataSource.sendFriendRequest(receiverId: receiverId);
  }

  @override
  Future<List<FriendSearchResult>> searchFriends({
    required String searchName,
  }) async {
    final data = await remoteDataSource.searchFriends(searchName: searchName);

    return data
        .map(FriendSearchResultModel.fromJson)
        .map((model) => model.toEntity())
        .toList();
  }

  @override
  Future<List<Friend>> getAllFriends() async {
    final data = await remoteDataSource.getAllFriends();

    return data
        .map(FriendModel.fromJson)
        .map((model) => model.toEntity())
        .toList();
  }

  @override
  Future<FriendDetail> getFriendDetails({required String userId}) async {
    final data = await remoteDataSource.getFriendDetails(userId: userId);

    return FriendDetailModel.fromJson(data).toEntity();
  }

  @override
  Future<List<FriendRequest>> getFriendRequests() async {
    final data = await remoteDataSource.getFriendRequests();

    return data
        .map(FriendRequestModel.fromJson)
        .map((model) => model.toEntity())
        .toList();
  }

  @override
  Future<void> acceptFriendRequest({required String friendId}) async {
    await remoteDataSource.acceptFriendRequest(friendId: friendId);
  }

  @override
  Future<void> rejectFriendRequest({required String friendId}) async {
    await remoteDataSource.rejectFriendRequest(friendId: friendId);
  }

  @override
  Future<void> unfriend({required String friendId}) async {
    await remoteDataSource.unfriend(friendId: friendId);
  }
}
