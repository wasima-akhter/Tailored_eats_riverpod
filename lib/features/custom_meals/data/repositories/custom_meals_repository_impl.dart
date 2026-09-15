import '../../domain/entities/custom_meal.dart';
import '../../domain/repositories/custom_meals_repository.dart';
import '../datasources/custom_meals_remote_data_source.dart';
import '../models/custom_meal_model.dart';

class CustomMealsRepositoryImpl implements CustomMealsRepository {
  CustomMealsRepositoryImpl({required this.remoteDataSource});

  final CustomMealsRemoteDataSource remoteDataSource;

  @override
  Future<CustomMealsPage> getCustomMeals({
    String? mealType,
    String? search,
    int page = 1,
    int limit = 20,
  }) async {
    final response = await remoteDataSource.getCustomMeals(
      mealType: mealType,
      search: search,
      page: page,
      limit: limit,
    );

    final rawItems = response['data'];
    final rawMeta = response['meta'];

    final items = rawItems is List
        ? rawItems
              .whereType<Map<String, dynamic>>()
              .map(CustomMealModel.fromJson)
              .toList()
        : <CustomMealModel>[];

    final meta = rawMeta is Map<String, dynamic>
        ? rawMeta
        : const <String, dynamic>{};

    return CustomMealsPage(
      items: items,
      page: _int(meta['page'], fallback: page),
      limit: _int(meta['limit'], fallback: limit),
      total: _int(meta['total']),
      totalPage: _int(meta['totalPage'], fallback: page),
    );
  }

  @override
  Future<CustomMeal> addCustomMeal({required Map<String, dynamic> data}) async {
    final response = await remoteDataSource.addCustomMeal(data: data);

    final rawData = response['data'];

    if (rawData is! Map<String, dynamic>) {
      throw Exception('Invalid custom meal response.');
    }

    return CustomMealModel.fromJson(rawData);
  }

  @override
  Future<CustomMeal> updateCustomMeal({
    required String mealId,
    required Map<String, dynamic> data,
  }) async {
    final response = await remoteDataSource.updateCustomMeal(
      mealId: mealId,
      data: data,
    );

    final rawData = response['data'];

    if (rawData is! Map<String, dynamic>) {
      throw Exception('Invalid custom meal response.');
    }

    return CustomMealModel.fromJson(rawData);
  }

  @override
  Future<String> deleteCustomMeal({required String mealId}) async {
    final response = await remoteDataSource.deleteCustomMeal(mealId: mealId);

    final rawData = response['data'];

    if (rawData is Map<String, dynamic>) {
      return rawData['_id']?.toString() ?? mealId;
    }

    return mealId;
  }

  int _int(dynamic value, {int fallback = 0}) {
    if (value is int) {
      return value;
    }

    if (value is num) {
      return value.toInt();
    }

    return int.tryParse(value?.toString() ?? '') ?? fallback;
  }
}
