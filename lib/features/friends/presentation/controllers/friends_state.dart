import '../../domain/entities/friend.dart';
import '../../domain/entities/friend_detail.dart';
import '../../domain/entities/friend_request.dart';
import '../../domain/entities/friend_search_result.dart';
import '../../domain/entities/friend_suggestion.dart';

enum FriendsStatus { initial, loading, success, failure }

class FriendsState {
  final FriendsStatus status;
  final List<Friend> friends;
  final List<FriendSuggestion> suggestions;
  final List<FriendSearchResult> searchResults;
  final List<FriendRequest> requests;
  final FriendDetail? selectedFriend;

  final int currentPage;
  final int totalPages;
  final bool hasMoreSuggestions;
  final bool isLoadingMore;

  final bool isSearching;
  final bool isLoadingRequests;
  final bool isLoadingFriends;
  final bool isLoadingDetail;

  final String? sendingRequestId;
  final String? acceptingRequestId;
  final String? rejectingRequestId;
  final String? unfriendingId;

  final String? errorMessage;

  const FriendsState({
    this.status = FriendsStatus.initial,
    this.friends = const [],
    this.suggestions = const [],
    this.searchResults = const [],
    this.requests = const [],
    this.selectedFriend,
    this.currentPage = 1,
    this.totalPages = 1,
    this.hasMoreSuggestions = true,
    this.isLoadingMore = false,
    this.isSearching = false,
    this.isLoadingRequests = false,
    this.isLoadingFriends = false,
    this.isLoadingDetail = false,
    this.sendingRequestId,
    this.acceptingRequestId,
    this.rejectingRequestId,
    this.unfriendingId,
    this.errorMessage,
  });

  bool get isSendingRequest => sendingRequestId != null;

  bool get isAcceptingRequest => acceptingRequestId != null;

  bool get isRejectingRequest => rejectingRequestId != null;

  bool get isUnfriending => unfriendingId != null;

  FriendsState copyWith({
    FriendsStatus? status,
    List<Friend>? friends,
    List<FriendSuggestion>? suggestions,
    List<FriendSearchResult>? searchResults,
    List<FriendRequest>? requests,
    FriendDetail? selectedFriend,
    bool clearSelectedFriend = false,
    int? currentPage,
    int? totalPages,
    bool? hasMoreSuggestions,
    bool? isLoadingMore,
    bool? isSearching,
    bool? isLoadingRequests,
    bool? isLoadingFriends,
    bool? isLoadingDetail,
    String? sendingRequestId,
    bool clearSendingRequestId = false,
    String? acceptingRequestId,
    bool clearAcceptingRequestId = false,
    String? rejectingRequestId,
    bool clearRejectingRequestId = false,
    String? unfriendingId,
    bool clearUnfriendingId = false,
    String? errorMessage,
    bool clearError = false,
  }) {
    return FriendsState(
      status: status ?? this.status,
      friends: friends ?? this.friends,
      suggestions: suggestions ?? this.suggestions,
      searchResults: searchResults ?? this.searchResults,
      requests: requests ?? this.requests,
      selectedFriend: clearSelectedFriend
          ? null
          : selectedFriend ?? this.selectedFriend,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      hasMoreSuggestions: hasMoreSuggestions ?? this.hasMoreSuggestions,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isSearching: isSearching ?? this.isSearching,
      isLoadingRequests: isLoadingRequests ?? this.isLoadingRequests,
      isLoadingFriends: isLoadingFriends ?? this.isLoadingFriends,
      isLoadingDetail: isLoadingDetail ?? this.isLoadingDetail,
      sendingRequestId: clearSendingRequestId
          ? null
          : sendingRequestId ?? this.sendingRequestId,
      acceptingRequestId: clearAcceptingRequestId
          ? null
          : acceptingRequestId ?? this.acceptingRequestId,
      rejectingRequestId: clearRejectingRequestId
          ? null
          : rejectingRequestId ?? this.rejectingRequestId,
      unfriendingId: clearUnfriendingId
          ? null
          : unfriendingId ?? this.unfriendingId,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}
