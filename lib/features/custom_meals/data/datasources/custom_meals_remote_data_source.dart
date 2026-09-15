import '../../../../core/network/api_client.dart';

abstract class CustomMealsRemoteDataSource {
  Future<Map<String, dynamic>> getCustomMeals({
    String? mealType,
    String? search,
    int page = 1,
    int limit = 20,
  });

  Future<Map<String, dynamic>> addCustomMeal({
    required Map<String, dynamic> data,
  });

  Future<Map<String, dynamic>> updateCustomMeal({
    required String mealId,
    required Map<String, dynamic> data,
  });

  Future<Map<String, dynamic>> deleteCustomMeal({required String mealId});
}

class CustomMealsRemoteDataSourceImpl implements CustomMealsRemoteDataSource {
  CustomMealsRemoteDataSourceImpl({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<Map<String, dynamic>> getCustomMeals({
    String? mealType,
    String? search,
    int page = 1,
    int limit = 20,
  }) async {
    final queryParameters = <String, dynamic>{'page': page, 'limit': limit};

    if (mealType != null && mealType.trim().isNotEmpty) {
      queryParameters['mealType'] = mealType.trim();
    }

    if (search != null && search.trim().isNotEmpty) {
      queryParameters['search'] = search.trim();
    }

    final response = await apiClient.get(
      '/meal/get-custom-meal',
      queryParameters: queryParameters,
    );

    if (response.data is Map<String, dynamic>) {
      return response.data as Map<String, dynamic>;
    }

    return const {};
  }

  @override
  Future<Map<String, dynamic>> addCustomMeal({
    required Map<String, dynamic> data,
  }) async {
    final response = await apiClient.post('/meal/add-custom-meal', data: data);

    if (response.data is Map<String, dynamic>) {
      return response.data as Map<String, dynamic>;
    }

    return const {};
  }

  @override
  Future<Map<String, dynamic>> updateCustomMeal({
    required String mealId,
    required Map<String, dynamic> data,
  }) async {
    final response = await apiClient.patch(
      '/meal/update-custom-meal/$mealId',
      data: data,
    );

    if (response.data is Map<String, dynamic>) {
      return response.data as Map<String, dynamic>;
    }

    return const {};
  }

  @override
  Future<Map<String, dynamic>> deleteCustomMeal({
    required String mealId,
  }) async {
    final response = await apiClient.delete('/meal/delete-custom-meal/$mealId');

    if (response.data is Map<String, dynamic>) {
      return response.data as Map<String, dynamic>;
    }

    return const {};
  }
}
