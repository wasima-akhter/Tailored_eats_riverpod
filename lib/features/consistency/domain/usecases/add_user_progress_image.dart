import '../entities/progress_image.dart';
import '../repositories/consistency_repository.dart';

class AddUserProgressImage {
  final ConsistencyRepository repository;

  const AddUserProgressImage({required this.repository});

  Future<ProgressImage> call({required String imagePath}) {
    return repository.addUserImage(imagePath: imagePath);
  }
}
