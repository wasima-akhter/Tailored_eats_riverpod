import '../repositories/friends_repository.dart';

class AcceptFriendRequest {
  const AcceptFriendRequest({required this.repository});

  final FriendsRepository repository;

  Future<void> call({required String friendId}) {
    return repository.acceptFriendRequest(friendId: friendId);
  }
}
