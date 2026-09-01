abstract final class ApiConstants {
  // ==============================
  // Authentication
  // ==============================

  static const String register = '/auth/register';
  static const String login = '/auth/login';

  static const String sendEmailOtp = '/auth/send-email-otp';
  static const String checkEmailOtp = '/auth/check-email-otp';

  static const String forgotPassword = '/auth/forget-password';
  static const String checkForgotPasswordOtp =
      '/auth/forget-password-check-otp';

  static const String resetPassword = '/auth/reset-password';

  // ==============================
  // User
  // ==============================

  static const String user = '/user';

  // ==============================
  // Friends
  // ==============================

  static const String friend = '/friend';

  // ==============================
  // Meals
  // ==============================

  static const String meal = '/meal';

  // ==============================
  // Consistency / Progress
  // ==============================

  static const String consistency = '/consistency';

  // ==============================
  // Goals
  // ==============================

  static const String goal = '/goal';

  // ==============================
  // Settings
  // ==============================

  static const String settings = '/settings';

  // ==============================
  // FAQ
  // ==============================

  static const String faq = '/faq';

  // ==============================
  // Notifications
  // ==============================

  static const String notification = '/notification';

  // ==============================
  // Dashboard
  // ==============================

  static const String dashboard = '/dashboard';
}
