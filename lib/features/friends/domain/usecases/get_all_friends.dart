import '../entities/friend.dart';
import '../repositories/friends_repository.dart';

class GetAllFriends {
  const GetAllFriends({required this.repository});

  final FriendsRepository repository;

  Future<List<Friend>> call() {
    return repository.getAllFriends();
  }
}
