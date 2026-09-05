import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/providers/nutrition_provider.dart';
import 'nutrition_repository.dart';
import 'nutrition_repository_provider.dart';

final nutritionRepositoryProvider = Provider<NutritionRepository>((ref) {
  return NutritionRepositoryImpl(
    remoteDataSource: ref.watch(nutritionAiRemoteDataSourceProvider),
  );
});
