abstract final class AppRoutes {
  static const splash = '/';

  static const onboarding = '/onboarding';

  static const login = '/login';

  static const signup = '/signup';

  static const emailVerification = '/email-verification';

  static const forgotPassword = '/forgot-password';
  static const forgotPasswordOtp = '/forgot-password-otp';
  static const resetPassword = '/reset-password';

  static const main = '/main';

  static const home = '/home';

  static const nutrition = '/nutrition';

  static const goals = '/goals';

  static const consistancy = '/consistancy';

  static const friends = '/friends';

  static const profile = '/profile';
  static const completeProfile = '/complete-profile';
  static const updateProfile = '/update-profile';

  static const friendDetail = '/friend-detail/:userId';

  //
  // Add to route_paths.dart

  static const customMeals = '/custom-meals';
  static const addCustomMeal = '/custom-meals/add';
  static const customMealDetails = '/custom-meals/details';
  static const editCustomMeal = '/custom-meals/edit';
  static const calorieTracking = '/calorie-tracking';
}
