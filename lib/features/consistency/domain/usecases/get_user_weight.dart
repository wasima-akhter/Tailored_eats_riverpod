import '../entities/weight_log.dart';
import '../repositories/consistency_repository.dart';

class GetUserWeight {
  final ConsistencyRepository repository;

  const GetUserWeight({required this.repository});

  Future<List<WeightLog>> call() {
    return repository.getUserWeight();
  }
}
