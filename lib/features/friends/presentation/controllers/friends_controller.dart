import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/error_handler.dart';
import '../../domain/usecases/accept_friend_request.dart';
import '../../domain/usecases/get_all_friends.dart';
import '../../domain/usecases/get_friend_details.dart';
import '../../domain/usecases/get_friend_requests.dart';
import '../../domain/usecases/get_friend_suggestions.dart';
import '../../domain/usecases/reject_friend_request.dart';
import '../../domain/usecases/search_friends.dart';
import '../../domain/usecases/send_friend_request.dart';
import '../../domain/usecases/unfriend.dart';
import 'friends_state.dart';

class FriendsController extends StateNotifier<FriendsState> {
  FriendsController({
    required this._getFriendSuggestions,
    required this._sendFriendRequest,
    required this._searchFriends,
    required this._getAllFriends,
    required this._getFriendDetails,
    required this._getFriendRequests,
    required this._acceptFriendRequest,
    required this._rejectFriendRequest,
    required this._unfriend,
  }) : super(const FriendsState());

  final GetFriendSuggestions _getFriendSuggestions;
  final SendFriendRequest _sendFriendRequest;
  final SearchFriends _searchFriends;
  final GetAllFriends _getAllFriends;
  final GetFriendDetails _getFriendDetails;
  final GetFriendRequests _getFriendRequests;
  final AcceptFriendRequest _acceptFriendRequest;
  final RejectFriendRequest _rejectFriendRequest;
  final Unfriend _unfriend;

  Timer? _searchDebounce;

  Future<void> loadSuggestions({String? search, bool loadMore = false}) async {
    if (loadMore) {
      if (state.isLoadingMore || !state.hasMoreSuggestions) {
        return;
      }

      state = state.copyWith(isLoadingMore: true);
    } else {
      state = state.copyWith(status: FriendsStatus.loading, clearError: true);
    }

    try {
      final page = loadMore ? state.currentPage + 1 : 1;

      final result = await _getFriendSuggestions(
        page: page,
        limit: 20,
        search: search,
      );

      final suggestions = loadMore
          ? [...state.suggestions, ...result.suggestions]
          : result.suggestions;

      state = state.copyWith(
        status: FriendsStatus.success,
        suggestions: suggestions,
        currentPage: result.page,
        totalPages: result.totalPage,
        hasMoreSuggestions: result.page < result.totalPage,
        isLoadingMore: false,
        clearError: true,
      );
    } catch (error, stackTrace) {
      debugPrint('[FriendsController] Failed to load suggestions: $error');
      debugPrintStack(stackTrace: stackTrace);

      final failure = ErrorHandler.handle(error);

      state = state.copyWith(
        status: loadMore ? FriendsStatus.success : FriendsStatus.failure,
        isLoadingMore: false,
        errorMessage: failure.userMessage,
      );
    }
  }

  Future<void> search(String query) async {
    _searchDebounce?.cancel();

    final value = query.trim();

    if (value.isEmpty) {
      await loadSuggestions();
      return;
    }

    _searchDebounce = Timer(const Duration(milliseconds: 400), () async {
      await loadSuggestions(search: value);
    });
  }

  Future<void> loadFriends() async {
    state = state.copyWith(isLoadingFriends: true, clearError: true);

    try {
      final friends = await _getAllFriends();

      state = state.copyWith(friends: friends, isLoadingFriends: false);
    } catch (error, stackTrace) {
      debugPrint('[FriendsController] Failed to load friends: $error');
      debugPrintStack(stackTrace: stackTrace);

      state = state.copyWith(
        isLoadingFriends: false,
        errorMessage: ErrorHandler.handle(error).userMessage,
      );
    }
  }

  Future<void> loadFriendRequests() async {
    state = state.copyWith(isLoadingRequests: true, clearError: true);

    try {
      final requests = await _getFriendRequests();

      state = state.copyWith(requests: requests, isLoadingRequests: false);
    } catch (error, stackTrace) {
      debugPrint('[FriendsController] Failed to load friend requests: $error');
      debugPrintStack(stackTrace: stackTrace);

      state = state.copyWith(
        isLoadingRequests: false,
        errorMessage: ErrorHandler.handle(error).userMessage,
      );
    }
  }

  Future<void> loadFriendDetails({required String userId}) async {
    state = state.copyWith(
      isLoadingDetail: true,
      clearSelectedFriend: true,
      clearError: true,
    );

    try {
      final detail = await _getFriendDetails(userId: userId);

      state = state.copyWith(selectedFriend: detail, isLoadingDetail: false);
    } catch (error, stackTrace) {
      debugPrint('[FriendsController] Failed to load friend details: $error');
      debugPrintStack(stackTrace: stackTrace);

      state = state.copyWith(
        isLoadingDetail: false,
        errorMessage: ErrorHandler.handle(error).userMessage,
      );
    }
  }

  Future<bool> sendFriendRequest({required String receiverId}) async {
    if (state.isSendingRequest) {
      return false;
    }

    state = state.copyWith(sendingRequestId: receiverId, clearError: true);

    try {
      await _sendFriendRequest(receiverId: receiverId);

      state = state.copyWith(clearSendingRequestId: true);

      return true;
    } catch (error, stackTrace) {
      debugPrint('[FriendsController] Failed to send friend request: $error');
      debugPrintStack(stackTrace: stackTrace);

      state = state.copyWith(
        clearSendingRequestId: true,
        errorMessage: ErrorHandler.handle(error).userMessage,
      );

      return false;
    }
  }

  Future<bool> acceptFriendRequest({required String friendId}) async {
    if (state.isAcceptingRequest) {
      return false;
    }

    state = state.copyWith(acceptingRequestId: friendId, clearError: true);

    try {
      await _acceptFriendRequest(friendId: friendId);

      state = state.copyWith(
        requests: state.requests
            .where((request) => request.senderId != friendId)
            .toList(),
        clearAcceptingRequestId: true,
      );

      await loadFriends();

      return true;
    } catch (error, stackTrace) {
      debugPrint('[FriendsController] Failed to accept friend request: $error');
      debugPrintStack(stackTrace: stackTrace);

      state = state.copyWith(
        clearAcceptingRequestId: true,
        errorMessage: ErrorHandler.handle(error).userMessage,
      );

      return false;
    }
  }

  Future<bool> rejectFriendRequest({required String friendId}) async {
    if (state.isRejectingRequest) {
      return false;
    }

    state = state.copyWith(rejectingRequestId: friendId, clearError: true);

    try {
      await _rejectFriendRequest(friendId: friendId);

      state = state.copyWith(
        requests: state.requests
            .where((request) => request.senderId != friendId)
            .toList(),
        clearRejectingRequestId: true,
      );

      return true;
    } catch (error, stackTrace) {
      debugPrint('[FriendsController] Failed to reject friend request: $error');
      debugPrintStack(stackTrace: stackTrace);

      state = state.copyWith(
        clearRejectingRequestId: true,
        errorMessage: ErrorHandler.handle(error).userMessage,
      );

      return false;
    }
  }

  Future<bool> unfriend({required String friendId}) async {
    if (state.isUnfriending) {
      return false;
    }

    state = state.copyWith(unfriendingId: friendId, clearError: true);

    try {
      await _unfriend(friendId: friendId);

      state = state.copyWith(
        friends: state.friends
            .where((friend) => friend.friendId != friendId)
            .toList(),
        clearUnfriendingId: true,
      );

      return true;
    } catch (error, stackTrace) {
      debugPrint('[FriendsController] Failed to unfriend: $error');
      debugPrintStack(stackTrace: stackTrace);

      state = state.copyWith(
        clearUnfriendingId: true,
        errorMessage: ErrorHandler.handle(error).userMessage,
      );

      return false;
    }
  }

  Future<void> refresh() async {
    await Future.wait([loadSuggestions(), loadFriends(), loadFriendRequests()]);
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
  }
}
