import '../entities/friend.dart';
import '../entities/friend_detail.dart';
import '../entities/friend_request.dart';
import '../entities/friend_search_result.dart';
import '../entities/friend_suggestions_page.dart';

abstract class FriendsRepository {
  Future<FriendSuggestionsPage> getFriendSuggestions({
    int page = 1,
    int limit = 20,
    String? search,
  });

  Future<void> sendFriendRequest({required String receiverId});

  Future<List<FriendSearchResult>> searchFriends({required String searchName});

  Future<List<Friend>> getAllFriends();

  Future<FriendDetail> getFriendDetails({required String userId});

  Future<List<FriendRequest>> getFriendRequests();

  Future<void> acceptFriendRequest({required String friendId});

  Future<void> rejectFriendRequest({required String friendId});

  Future<void> unfriend({required String friendId});
}
