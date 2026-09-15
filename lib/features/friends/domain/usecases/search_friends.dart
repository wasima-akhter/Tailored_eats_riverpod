import '../entities/friend_search_result.dart';
import '../repositories/friends_repository.dart';

class SearchFriends {
  const SearchFriends({required this.repository});

  final FriendsRepository repository;

  Future<List<FriendSearchResult>> call({required String searchName}) {
    return repository.searchFriends(searchName: searchName);
  }
}
