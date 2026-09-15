// lib/features/profile/presentation/providers/profile_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/network_providers.dart';
import '../../../authentication/presentation/controllers/auth_controller.dart';
import '../../../home/presentation/providers/home_provider.dart';
import '../../data/datasources/profile_remote_data_source.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/usecases/complete_profile.dart';
import '../../domain/usecases/update_profile.dart';
import '../controllers/profile_controller.dart';
import '../controllers/profile_state.dart';

final profileRemoteDataSourceProvider = Provider<ProfileRemoteDataSource>((
  ref,
) {
  return ProfileRemoteDataSourceImpl(apiClient: ref.watch(apiClientProvider));
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl(
    remoteDataSource: ref.watch(profileRemoteDataSourceProvider),
  );
});

final completeProfileProvider = Provider<CompleteProfile>((ref) {
  return CompleteProfile(repository: ref.watch(profileRepositoryProvider));
});

final updateProfileProvider = Provider<UpdateProfile>((ref) {
  return UpdateProfile(repository: ref.watch(profileRepositoryProvider));
});

final profileControllerProvider =
    StateNotifierProvider<ProfileController, ProfileState>((ref) {
      return ProfileController(
        getHomeProfile: ref.watch(getHomeProfileProvider),
        completeProfile: ref.watch(completeProfileProvider),
        updateProfile: ref.watch(updateProfileProvider),
        authenticate: (session) async {
          await ref
              .read(authControllerProvider.notifier)
              .authenticateSession(session);
        },
      );
    });
