import '../../domain/entities/consistency_summary.dart';
import '../../domain/entities/progress_image.dart';
import '../../domain/entities/weight_log.dart';
import '../../domain/repositories/consistency_repository.dart';
import '../datasources/consistency_remote_data_source.dart';

class ConsistencyRepositoryImpl implements ConsistencyRepository {
  final ConsistencyRemoteDataSource remoteDataSource;

  const ConsistencyRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ConsistencySummary> getConsistencySummary() async {
    final model = await remoteDataSource.getConsistencySummary();

    return model.toEntity();
  }

  @override
  Future<WeightLog> addUserWeight({required double weight}) async {
    final model = await remoteDataSource.addUserWeight(weight: weight);

    return model.toEntity();
  }

  @override
  Future<List<WeightLog>> getUserWeight() async {
    final models = await remoteDataSource.getUserWeight();

    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<ProgressImage> addUserImage({required String imagePath}) async {
    final model = await remoteDataSource.addUserImage(imagePath: imagePath);

    return model.toEntity();
  }

  @override
  Future<List<ProgressImage>> getUserImages() async {
    final models = await remoteDataSource.getUserImages();

    return models.map((model) => model.toEntity()).toList();
  }
}
