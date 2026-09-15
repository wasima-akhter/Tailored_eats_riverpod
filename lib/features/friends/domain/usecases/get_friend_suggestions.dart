import '../entities/friend_suggestions_page.dart';
import '../repositories/friends_repository.dart';

class GetFriendSuggestions {
  const GetFriendSuggestions({required this.repository});

  final FriendsRepository repository;

  Future<FriendSuggestionsPage> call({
    int page = 1,
    int limit = 20,
    String? search,
  }) {
    return repository.getFriendSuggestions(
      page: page,
      limit: limit,
      search: search,
    );
  }
}
