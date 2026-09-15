import '../entities/consistency_summary.dart';
import '../repositories/consistency_repository.dart';

class GetConsistencySummary {
  final ConsistencyRepository repository;

  const GetConsistencySummary({required this.repository});

  Future<ConsistencySummary> call() {
    return repository.getConsistencySummary();
  }
}
