import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import 'route_paths.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,

  routes: [
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),

    GoRoute(
      path: AppRoutes.onboarding,
      name: 'onboarding',
      builder: (context, state) {
        return const OnboardingScreen();
      },
    ),

    GoRoute(
      path: AppRoutes.login,
      name: 'login',
      builder: (context, state) {
        return const Placeholder();
      },
    ),

    GoRoute(
      path: AppRoutes.signup,
      name: 'signup',
      builder: (context, state) {
        return const Placeholder();
      },
    ),

    GoRoute(
      path: AppRoutes.main,
      name: 'main',
      builder: (context, state) {
        return const Placeholder();
      },
    ),

    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) {
        return const Placeholder();
      },
    ),

    GoRoute(
      path: AppRoutes.meals,
      name: 'meals',
      builder: (context, state) {
        return const Placeholder();
      },
    ),

    GoRoute(
      path: AppRoutes.progress,
      name: 'progress',
      builder: (context, state) {
        return const Placeholder();
      },
    ),

    GoRoute(
      path: AppRoutes.friends,
      name: 'friends',
      builder: (context, state) {
        return const Placeholder();
      },
    ),

    GoRoute(
      path: AppRoutes.profile,
      name: 'profile',
      builder: (context, state) {
        return const Placeholder();
      },
    ),
  ],
);
