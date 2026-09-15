import '../entities/friend_detail.dart';
import '../repositories/friends_repository.dart';

class GetFriendDetails {
  const GetFriendDetails({required this.repository});

  final FriendsRepository repository;

  Future<FriendDetail> call({required String userId}) {
    return repository.getFriendDetails(userId: userId);
  }
}
