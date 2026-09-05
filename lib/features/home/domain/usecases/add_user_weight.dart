import '../repositories/home_repository.dart';

class AddUserWeight {
  final HomeRepository _repository;

  const AddUserWeight({required this._repository});

  Future<void> call({required double weight}) {
    return _repository.addUserWeight(weight: weight);
  }
}
