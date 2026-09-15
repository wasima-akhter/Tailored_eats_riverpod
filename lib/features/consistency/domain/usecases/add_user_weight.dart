import 'package:tailored_eats_riverpod/features/consistency/domain/entities/weight_log.dart';
import 'package:tailored_eats_riverpod/features/consistency/domain/repositories/consistency_repository.dart';

class AddUserWeight {
  final ConsistencyRepository repository;
  AddUserWeight({required this.repository});

  Future<WeightLog> call({required double weight}) {
    return repository.addUserWeight(weight: weight);
  }
}
