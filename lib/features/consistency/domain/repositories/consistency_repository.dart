import '../entities/consistency_summary.dart';
import '../entities/progress_image.dart';
import '../entities/weight_log.dart';

abstract class ConsistencyRepository {
  Future<ConsistencySummary> getConsistencySummary();

  Future<WeightLog> addUserWeight({required double weight});

  Future<List<WeightLog>> getUserWeight();

  Future<ProgressImage> addUserImage({required String imagePath});

  Future<List<ProgressImage>> getUserImages();
}
