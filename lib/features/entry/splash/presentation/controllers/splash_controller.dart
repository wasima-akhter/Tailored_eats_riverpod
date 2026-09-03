import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../app/router/route_paths.dart';

final splashControllerProvider =
    NotifierProvider<SplashController, SplashState>(SplashController.new);

class SplashState {
  final bool isLoading;
  final String? nextRoute;

  const SplashState({this.isLoading = true, this.nextRoute});

  SplashState copyWith({bool? isLoading, String? nextRoute}) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
      nextRoute: nextRoute ?? this.nextRoute,
    );
  }
}

class SplashController extends Notifier<SplashState> {
  @override
  SplashState build() {
    return const SplashState();
  }

  Future<void> initialize() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    final nextRoute = await _getNextRoute();

    state = state.copyWith(isLoading: false, nextRoute: nextRoute);
  }

  Future<String> _getNextRoute() async {
    // This will be replaced with the real startup logic
    // once onboarding and authentication are implemented.
    return AppRoutes.onboarding;
  }
}
