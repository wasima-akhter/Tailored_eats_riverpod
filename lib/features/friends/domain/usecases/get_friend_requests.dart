import '../entities/friend_request.dart';
import '../repositories/friends_repository.dart';

class GetFriendRequests {
  const GetFriendRequests({required this.repository});

  final FriendsRepository repository;

  Future<List<FriendRequest>> call() {
    return repository.getFriendRequests();
  }
}
