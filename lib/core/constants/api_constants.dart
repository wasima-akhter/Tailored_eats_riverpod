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
  // Home
  // ==============================

  static const String userDetail = '/user/user-detail';

  static const String userConsistencyDetails =
      '/consistency/user-consistency-details';

  static const String getAllGoal = '/goal/get-all-goal';

  static const String addUserWeight = '/consistency/add-user-weight';

  static const String markGoalCompleted = '/goal/mark-goal-completed';

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
