import '../entities/progress_image.dart';
import '../repositories/consistency_repository.dart';

class GetUserProgressImages {
  final ConsistencyRepository repository;

  const GetUserProgressImages({required this.repository});

  Future<List<ProgressImage>> call() {
    return repository.getUserImages();
  }
}
