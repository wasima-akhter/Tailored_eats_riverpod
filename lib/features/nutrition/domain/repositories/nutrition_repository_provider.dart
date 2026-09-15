import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/nutrition_repository_impl.dart';
import '../../presentation/providers/nutrition_provider.dart';
import 'nutrition_repository.dart';

final nutritionRepositoryProvider = Provider<NutritionRepository>((ref) {
  return NutritionRepositoryImpl(
    remoteDataSource: ref.watch(nutritionAiRemoteDataSourceProvider),
  );
});
