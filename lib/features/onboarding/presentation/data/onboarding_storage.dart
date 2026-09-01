import 'package:shared_preferences/shared_preferences.dart';

class OnboardingStorage {
  final SharedPreferences sharedPreferences;

  const OnboardingStorage({required this.sharedPreferences});

  static const String _onboardingCompletedKey = 'onboarding_completed';

  bool hasCompletedOnboarding() {
    return sharedPreferences.getBool(_onboardingCompletedKey) ?? false;
  }

  Future<void> setOnboardingCompleted() async {
    await sharedPreferences.setBool(_onboardingCompletedKey, true);
  }
}
