import '../entities/home_consistency.dart';
import '../repositories/home_repository.dart';

class GetHomeConsistency {
  final HomeRepository _repository;

  const GetHomeConsistency({required this._repository});

  Future<HomeConsistency> call() {
    return _repository.getHomeConsistency();
  }
}
