import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/storage/storage_provider.dart';
import '../data/onboarding_storage.dart';

final onboardingStorageProvider = Provider<OnboardingStorage>((ref) {
  return OnboardingStorage(
    sharedPreferences: ref.watch(sharedPreferencesProvider),
  );
});

final onboardingProvider = AsyncNotifierProvider<OnboardingNotifier, bool>(
  OnboardingNotifier.new,
);

class OnboardingNotifier extends AsyncNotifier<bool> {
  late final OnboardingStorage _storage;

  @override
  Future<bool> build() async {
    _storage = ref.read(onboardingStorageProvider);

    return _storage.hasCompletedOnboarding();
  }

  Future<void> completeOnboarding() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _storage.setOnboardingCompleted();

      return true;
    });
  }
}
