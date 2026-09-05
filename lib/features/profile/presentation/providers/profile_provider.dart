import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home/presentation/providers/home_provider.dart';
import '../controllers/profile_controller.dart';
import '../controllers/profile_state.dart';

final profileControllerProvider =
    StateNotifierProvider<ProfileController, ProfileState>((ref) {
      return ProfileController(
        getHomeProfile: ref.watch(getHomeProfileProvider),
      );
    });
