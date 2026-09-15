import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../models/consistency_summary_model.dart';
import '../models/progress_image_model.dart';
import '../models/weight_log_model.dart';

abstract class ConsistencyRemoteDataSource {
  Future<ConsistencySummaryModel> getConsistencySummary();

  Future<WeightLogModel> addUserWeight({required double weight});

  Future<List<WeightLogModel>> getUserWeight();

  Future<ProgressImageModel> addUserImage({required String imagePath});

  Future<List<ProgressImageModel>> getUserImages();
}

class ConsistencyRemoteDataSourceImpl implements ConsistencyRemoteDataSource {
  final ApiClient apiClient;

  const ConsistencyRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<ConsistencySummaryModel> getConsistencySummary() async {
    final response = await apiClient.get(
      '/consistency/user-consistency-details',
    );

    return ConsistencySummaryModel.fromJson(_extractDataMap(response.data));
  }

  @override
  Future<WeightLogModel> addUserWeight({required double weight}) async {
    final response = await apiClient.post(
      '/consistency/add-user-weight',
      data: {'weight': weight},
    );

    return WeightLogModel.fromJson(_extractDataMap(response.data));
  }

  @override
  Future<List<WeightLogModel>> getUserWeight() async {
    final response = await apiClient.get('/consistency/get-user-weight');

    return _extractDataList(
      response.data,
    ).map(WeightLogModel.fromJson).toList();
  }

  @override
  Future<ProgressImageModel> addUserImage({required String imagePath}) async {
    final formData = FormData.fromMap({
      'profile-image': await MultipartFile.fromFile(imagePath),
    });

    final response = await apiClient.post(
      '/consistency/add-user-image',
      data: formData,
    );

    return ProgressImageModel.fromJson(_extractDataMap(response.data));
  }

  @override
  Future<List<ProgressImageModel>> getUserImages() async {
    final response = await apiClient.get('/consistency/get-user-image');

    return _extractDataList(
      response.data,
    ).map(ProgressImageModel.fromJson).toList();
  }

  Map<String, dynamic> _extractDataMap(dynamic responseData) {
    if (responseData is! Map<String, dynamic>) {
      return const {};
    }

    final data = responseData['data'];

    if (data is Map<String, dynamic>) {
      return data;
    }

    return const {};
  }

  List<Map<String, dynamic>> _extractDataList(dynamic responseData) {
    if (responseData is! Map<String, dynamic>) {
      return const [];
    }

    final data = responseData['data'];

    if (data is! List) {
      return const [];
    }

    return data.whereType<Map<String, dynamic>>().toList();
  }
}
