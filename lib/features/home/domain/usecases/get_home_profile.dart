import '../entities/home_profile.dart';
import '../repositories/home_repository.dart';

class GetHomeProfile {
  final HomeRepository _repository;

  const GetHomeProfile({required this._repository});

  Future<HomeProfile> call() {
    return _repository.getHomeProfile();
  }
}
