import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/auth_repository_provider.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/register_user.dart';
import '../../domain/usecases/request_password_reset.dart';
import '../../domain/usecases/reset_password.dart';
import '../../domain/usecases/send_email_otp.dart';
import '../../domain/usecases/verify_email_otp.dart';
import '../../domain/usecases/verify_password_reset_otp.dart';

final loginUserProvider = Provider<LoginUser>((ref) {
  return LoginUser(ref.watch(authRepositoryProvider));
});

final registerUserProvider = Provider<RegisterUser>((ref) {
  return RegisterUser(ref.watch(authRepositoryProvider));
});

final sendEmailOtpProvider = Provider<SendEmailOtp>((ref) {
  return SendEmailOtp(ref.watch(authRepositoryProvider));
});

final verifyEmailOtpProvider = Provider<VerifyEmailOtp>((ref) {
  return VerifyEmailOtp(ref.watch(authRepositoryProvider));
});

final requestPasswordResetProvider = Provider<RequestPasswordReset>((ref) {
  return RequestPasswordReset(ref.watch(authRepositoryProvider));
});

final verifyPasswordResetOtpProvider = Provider<VerifyPasswordResetOtp>((ref) {
  return VerifyPasswordResetOtp(ref.watch(authRepositoryProvider));
});

final resetPasswordProvider = Provider<ResetPassword>((ref) {
  return ResetPassword(ref.watch(authRepositoryProvider));
});
