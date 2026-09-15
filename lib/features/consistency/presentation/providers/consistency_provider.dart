import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/network_providers.dart';
import '../../data/datasources/consistency_remote_data_source.dart';
import '../../data/repositories/consistency_repository_impl.dart';
import '../../domain/entities/progress_image.dart';
import '../../domain/entities/weight_log.dart';
import '../../domain/repositories/consistency_repository.dart';
import '../../domain/usecases/add_user_progress_image.dart';
import '../../domain/usecases/add_user_weight.dart';
import '../../domain/usecases/get_consistency_summary.dart';
import '../../domain/usecases/get_user_progress_images.dart';
import '../../domain/usecases/get_user_weight.dart';
import 'consistency_state.dart';

final consistencyRemoteDataSourceProvider =
    Provider<ConsistencyRemoteDataSource>((ref) {
      return ConsistencyRemoteDataSourceImpl(
        apiClient: ref.watch(apiClientProvider),
      );
    });

final consistencyRepositoryProvider = Provider<ConsistencyRepository>((ref) {
  return ConsistencyRepositoryImpl(
    remoteDataSource: ref.watch(consistencyRemoteDataSourceProvider),
  );
});

final getConsistencySummaryProvider = Provider<GetConsistencySummary>((ref) {
  return GetConsistencySummary(
    repository: ref.watch(consistencyRepositoryProvider),
  );
});

final addUserWeightProvider = Provider<AddUserWeight>((ref) {
  return AddUserWeight(repository: ref.watch(consistencyRepositoryProvider));
});

final getUserWeightProvider = Provider<GetUserWeight>((ref) {
  return GetUserWeight(repository: ref.watch(consistencyRepositoryProvider));
});

final addUserProgressImageProvider = Provider<AddUserProgressImage>((ref) {
  return AddUserProgressImage(
    repository: ref.watch(consistencyRepositoryProvider),
  );
});

final getUserProgressImagesProvider = Provider<GetUserProgressImages>((ref) {
  return GetUserProgressImages(
    repository: ref.watch(consistencyRepositoryProvider),
  );
});

final consistencyNotifierProvider =
    NotifierProvider<ConsistencyNotifier, ConsistencyState>(
      ConsistencyNotifier.new,
    );

final weightHistoryProvider = FutureProvider<List<WeightLog>>((ref) {
  return ref.read(getUserWeightProvider).call();
});

final progressImagesProvider = FutureProvider<List<ProgressImage>>((ref) {
  return ref.read(getUserProgressImagesProvider).call();
});

class ConsistencyNotifier extends Notifier<ConsistencyState> {
  late final GetConsistencySummary _getConsistencySummary;
  late final AddUserWeight _addUserWeight;
  late final GetUserWeight _getUserWeight;
  late final AddUserProgressImage _addUserProgressImage;
  late final GetUserProgressImages _getUserProgressImages;

  @override
  ConsistencyState build() {
    _getConsistencySummary = ref.read(getConsistencySummaryProvider);
    _addUserWeight = ref.read(addUserWeightProvider);
    _getUserWeight = ref.read(getUserWeightProvider);
    _addUserProgressImage = ref.read(addUserProgressImageProvider);
    _getUserProgressImages = ref.read(getUserProgressImagesProvider);

    Future.microtask(load);

    return const ConsistencyState(isLoading: true);
  }

  Future<void> load() async {
    state = state.copyWith(isLoading: true, clearSummaryError: true);

    try {
      final summary = await _getConsistencySummary.call();

      state = state.copyWith(
        summary: summary,
        isLoading: false,
        clearSummaryError: true,
      );
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        summaryError: 'Consistency data is currently unavailable.',
      );
    }
  }

  Future<void> refresh() async {
    state = state.copyWith(isRefreshing: true, clearSummaryError: true);

    try {
      final results = await Future.wait([
        _getConsistencySummary.call(),
        // _getUserWeight.call(),
        // _getUserProgressImages.call(),
      ]);

      state = state.copyWith(
        summary: results[0],
        isRefreshing: false,
        clearSummaryError: true,
      );

      ref.invalidate(weightHistoryProvider);
      ref.invalidate(progressImagesProvider);
    } catch (_) {
      state = state.copyWith(
        isRefreshing: false,
        summaryError: 'Consistency data is currently unavailable.',
      );
    }
  }

  Future<WeightLog?> addWeight({required double weight}) async {
    try {
      return await _addUserWeight.call(weight: weight);
    } catch (_) {
      return null;
    }
  }

  Future<List<WeightLog>> getWeightHistory() async {
    try {
      return await _getUserWeight.call();
    } catch (_) {
      return const [];
    }
  }

  Future<ProgressImage?> addProgressImage({required String imagePath}) async {
    try {
      return await _addUserProgressImage.call(imagePath: imagePath);
    } catch (_) {
      return null;
    }
  }

  Future<List<ProgressImage>> getProgressImages() async {
    try {
      return await _getUserProgressImages.call();
    } catch (_) {
      return const [];
    }
  }
}
