import '../repositories/friends_repository.dart';

class RejectFriendRequest {
  const RejectFriendRequest({required this.repository});

  final FriendsRepository repository;

  Future<void> call({required String friendId}) {
    return repository.rejectFriendRequest(friendId: friendId);
  }
}
