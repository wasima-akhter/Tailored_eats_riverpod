import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tailored_eats_riverpod/features/consistency/presentation/screens/consistency_screen.dart';
import 'package:tailored_eats_riverpod/features/friends/presentation/screens/friends_screen.dart';
import 'package:tailored_eats_riverpod/features/goals/presentation/screens/goals_screen.dart';
import 'package:tailored_eats_riverpod/features/profile/presentation/screens/complete_profile_screen.dart';
import 'package:tailored_eats_riverpod/features/profile/presentation/screens/profile_screen.dart';
import 'package:tailored_eats_riverpod/features/profile/presentation/screens/update_profile_screen.dart';

import '../../features/authentication/presentation/controllers/auth_controller.dart';
import '../../features/authentication/presentation/controllers/auth_state.dart';
import '../../features/authentication/presentation/screens/email_verification_screen.dart';
import '../../features/authentication/presentation/screens/forgot_password_otp_screen.dart';
import '../../features/authentication/presentation/screens/forgot_password_screen.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/authentication/presentation/screens/register_screen.dart';
import '../../features/authentication/presentation/screens/reset_password_screen.dart';
import '../../features/calorie_tracking/presentation/screens/calorie_tracking_screen.dart';
import '../../features/custom_meals/domain/entities/custom_meal.dart';
import '../../features/custom_meals/presentation/screens/add_custom_meal_screen.dart';
import '../../features/custom_meals/presentation/screens/custom_meal_details_screen.dart';
import '../../features/custom_meals/presentation/screens/custom_meals_screen.dart';
import '../../features/custom_meals/presentation/screens/edit_custom_meal_screen.dart';
import '../../features/entry/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/entry/splash/presentation/screens/splash_screen.dart';
import '../../features/friends/presentation/screens/friend_detail_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/navigation/presentation/screens/main_navigation_screen.dart';
import '../../features/nutrition/presentation/screens/nutrition_screen.dart';
import 'app_router_provider.dart';
import 'route_paths.dart';

GoRouter createAppRouter(Ref ref) {
  final refreshNotifier = ref.watch(authRouterRefreshNotifierProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,

    refreshListenable: refreshNotifier,

    redirect: (context, state) {
      final authState = ref.read(authControllerProvider);

      final location = state.matchedLocation;

      final isAuthenticated = authState.isAuthenticated;

      final isAuthRoute =
          location == AppRoutes.login || location == AppRoutes.signup;

      final isPasswordResetRoute =
          location == AppRoutes.forgotPassword ||
          location == AppRoutes.forgotPasswordOtp ||
          location == AppRoutes.resetPassword;

      final isEmailVerificationRoute = location == AppRoutes.emailVerification;

      final isSplashRoute = location == AppRoutes.splash;

      // Let SplashController handle startup navigation for now.
      if (isSplashRoute) {
        return null;
      }

      // Until session restoration is implemented in 17.14,
      // allow the startup flow to reach onboarding/auth screens.
      if (authState.status == AuthStatus.initial ||
          authState.status == AuthStatus.loading) {
        return null;
      }

      if (!isAuthenticated) {
        if (isAuthRoute ||
            isPasswordResetRoute ||
            isEmailVerificationRoute ||
            location == AppRoutes.completeProfile ||
            location == AppRoutes.onboarding) {
          return null;
        }

        return AppRoutes.login;
      }

      if (isAuthenticated) {
        if (isAuthRoute ||
            isPasswordResetRoute ||
            isEmailVerificationRoute ||
            location == AppRoutes.onboarding ||
            isSplashRoute) {
          return AppRoutes.home;
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        builder: (context, state) {
          return const OnboardingScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.signup,
        name: AppRoutes.signup,
        builder: (context, state) {
          return const RegisterScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.emailVerification,
        name: AppRoutes.emailVerification,
        builder: (context, state) {
          final email = state.extra as String?;

          if (email == null || email.isEmpty) {
            return const LoginScreen();
          }

          return EmailVerificationScreen(email: email);
        },
      ),

      GoRoute(
        path: AppRoutes.forgotPassword,
        name: AppRoutes.forgotPassword,
        builder: (context, state) {
          return const ForgotPasswordScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.forgotPasswordOtp,
        name: AppRoutes.forgotPasswordOtp,
        builder: (context, state) {
          final email = state.extra as String?;

          if (email == null || email.isEmpty) {
            return const ForgotPasswordScreen();
          }

          return ForgotPasswordOtpScreen(email: email);
        },
      ),

      GoRoute(
        path: AppRoutes.resetPassword,
        name: AppRoutes.resetPassword,
        builder: (context, state) {
          final extra = state.extra;

          if (extra is! Map<String, dynamic>) {
            return const ForgotPasswordScreen();
          }

          final email = extra['email'] as String?;
          final activationToken = extra['activationToken'] as String?;

          if (email == null ||
              email.isEmpty ||
              activationToken == null ||
              activationToken.isEmpty) {
            return const ForgotPasswordScreen();
          }

          return ResetPasswordScreen(
            email: email,
            activationToken: activationToken,
          );
        },
      ),

      StatefulShellRoute.indexedStack(
        builder:
            (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell navigationShell,
            ) {
              return MainNavigationScreen(navigationShell: navigationShell);
            },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                name: AppRoutes.home,
                builder: (context, state) {
                  return const HomeScreen();
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.nutrition,
                name: AppRoutes.nutrition,
                builder: (context, state) {
                  return const NutritionScreen();
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.goals,
                name: AppRoutes.goals,
                builder: (context, state) {
                  return const GoalsScreen();
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.consistancy,
                name: AppRoutes.consistancy,
                builder: (context, state) {
                  return const ConsistencyScreen();
                },
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.friends,
                name: AppRoutes.friends,
                builder: (context, state) {
                  return const FriendsScreen();
                },
              ),
            ],
          ),
        ],
      ),

      // ------  INDIVIDUAL SCREENS ------ //
      GoRoute(
        path: AppRoutes.profile,
        name: AppRoutes.profile,
        builder: (context, state) {
          return const ProfileScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.completeProfile,
        name: AppRoutes.completeProfile,
        builder: (context, state) {
          return const CompleteProfileScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.updateProfile,
        name: AppRoutes.updateProfile,
        builder: (context, state) {
          return const UpdateProfileScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.friendDetail,
        name: AppRoutes.friendDetail,
        builder: (context, state) {
          final userId = state.pathParameters['userId'];

          if (userId == null || userId.isEmpty) {
            return const FriendsScreen();
          }

          return FriendDetailScreen(userId: userId);
        },
      ),

      //
      // Add these routes inside `routes: [...]`,
      // before the StatefulShellRoute or after it.
      GoRoute(
        path: AppRoutes.customMeals,
        name: AppRoutes.customMeals,
        builder: (context, state) {
          return const CustomMealsScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.addCustomMeal,
        name: AppRoutes.addCustomMeal,
        builder: (context, state) {
          return const AddCustomMealScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.customMealDetails,
        name: AppRoutes.customMealDetails,
        builder: (context, state) {
          final meal = state.extra;

          if (meal is! CustomMeal) {
            return const CustomMealsScreen();
          }

          return CustomMealDetailsScreen(meal: meal);
        },
      ),

      GoRoute(
        path: AppRoutes.editCustomMeal,
        name: AppRoutes.editCustomMeal,
        builder: (context, state) {
          final meal = state.extra;

          if (meal is! CustomMeal) {
            return const CustomMealsScreen();
          }

          return EditCustomMealScreen(meal: meal);
        },
      ),

      GoRoute(
        path: AppRoutes.calorieTracking,
        name: AppRoutes.calorieTracking,
        builder: (context, state) {
          return const CalorieTrackingScreen();
        },
      ),
    ],
  );
}

final appRouterProvider = Provider<GoRouter>((ref) {
  return createAppRouter(ref);
});
