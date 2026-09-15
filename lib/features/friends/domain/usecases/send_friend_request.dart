import '../repositories/friends_repository.dart';

class SendFriendRequest {
  const SendFriendRequest({required this.repository});

  final FriendsRepository repository;

  Future<void> call({required String receiverId}) {
    return repository.sendFriendRequest(receiverId: receiverId);
  }
}
