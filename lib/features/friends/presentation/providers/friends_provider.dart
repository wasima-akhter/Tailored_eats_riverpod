import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/network_providers.dart';
import '../../data/datasources/friends_remote_data_source.dart';
import '../../data/repositories/friends_repository_impl.dart';
import '../../domain/repositories/friends_repository.dart';
import '../../domain/usecases/accept_friend_request.dart';
import '../../domain/usecases/get_all_friends.dart';
import '../../domain/usecases/get_friend_details.dart';
import '../../domain/usecases/get_friend_requests.dart';
import '../../domain/usecases/get_friend_suggestions.dart';
import '../../domain/usecases/reject_friend_request.dart';
import '../../domain/usecases/search_friends.dart';
import '../../domain/usecases/send_friend_request.dart';
import '../../domain/usecases/unfriend.dart';
import '../controllers/friends_controller.dart';
import '../controllers/friends_state.dart';

final friendsRemoteDataSourceProvider = Provider<FriendsRemoteDataSource>((
  ref,
) {
  return FriendsRemoteDataSourceImpl(apiClient: ref.watch(apiClientProvider));
});

final friendsRepositoryProvider = Provider<FriendsRepository>((ref) {
  return FriendsRepositoryImpl(
    remoteDataSource: ref.watch(friendsRemoteDataSourceProvider),
  );
});

final getFriendSuggestionsProvider = Provider<GetFriendSuggestions>((ref) {
  return GetFriendSuggestions(repository: ref.watch(friendsRepositoryProvider));
});

final sendFriendRequestProvider = Provider<SendFriendRequest>((ref) {
  return SendFriendRequest(repository: ref.watch(friendsRepositoryProvider));
});

final searchFriendsProvider = Provider<SearchFriends>((ref) {
  return SearchFriends(repository: ref.watch(friendsRepositoryProvider));
});

final getAllFriendsProvider = Provider<GetAllFriends>((ref) {
  return GetAllFriends(repository: ref.watch(friendsRepositoryProvider));
});

final getFriendDetailsProvider = Provider<GetFriendDetails>((ref) {
  return GetFriendDetails(repository: ref.watch(friendsRepositoryProvider));
});

final getFriendRequestsProvider = Provider<GetFriendRequests>((ref) {
  return GetFriendRequests(repository: ref.watch(friendsRepositoryProvider));
});

final acceptFriendRequestProvider = Provider<AcceptFriendRequest>((ref) {
  return AcceptFriendRequest(repository: ref.watch(friendsRepositoryProvider));
});

final rejectFriendRequestProvider = Provider<RejectFriendRequest>((ref) {
  return RejectFriendRequest(repository: ref.watch(friendsRepositoryProvider));
});

final unfriendProvider = Provider<Unfriend>((ref) {
  return Unfriend(repository: ref.watch(friendsRepositoryProvider));
});

final friendsControllerProvider =
    StateNotifierProvider<FriendsController, FriendsState>((ref) {
      return FriendsController(
        getFriendSuggestions: ref.watch(getFriendSuggestionsProvider),
        sendFriendRequest: ref.watch(sendFriendRequestProvider),
        searchFriends: ref.watch(searchFriendsProvider),
        getAllFriends: ref.watch(getAllFriendsProvider),
        getFriendDetails: ref.watch(getFriendDetailsProvider),
        getFriendRequests: ref.watch(getFriendRequestsProvider),
        acceptFriendRequest: ref.watch(acceptFriendRequestProvider),
        rejectFriendRequest: ref.watch(rejectFriendRequestProvider),
        unfriend: ref.watch(unfriendProvider),
      );
    });
