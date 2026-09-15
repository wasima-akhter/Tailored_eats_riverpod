import '../repositories/friends_repository.dart';

class Unfriend {
  const Unfriend({required this.repository});

  final FriendsRepository repository;

  Future<void> call({required String friendId}) {
    return repository.unfriend(friendId: friendId);
  }
}
