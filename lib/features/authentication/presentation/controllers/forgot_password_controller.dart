import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/request_password_reset.dart';
import '../../domain/usecases/reset_password.dart';
import '../../domain/usecases/verify_password_reset_otp.dart';
import '../providers/auth_provider.dart';
import 'forgot_password_state.dart';

final forgotPasswordControllerProvider =
    NotifierProvider<ForgotPasswordController, ForgotPasswordState>(
      ForgotPasswordController.new,
    );

class ForgotPasswordController extends Notifier<ForgotPasswordState> {
  late final RequestPasswordReset _requestPasswordReset;
  late final VerifyPasswordResetOtp _verifyPasswordResetOtp;
  late final ResetPassword _resetPassword;

  @override
  ForgotPasswordState build() {
    _requestPasswordReset = ref.watch(requestPasswordResetProvider);

    _verifyPasswordResetOtp = ref.watch(verifyPasswordResetOtpProvider);

    _resetPassword = ref.watch(resetPasswordProvider);

    return const ForgotPasswordState();
  }

  Future<void> requestOtp({required String email}) async {
    state = ForgotPasswordState(
      status: ForgotPasswordStatus.requestingOtp,
      email: email,
    );

    try {
      await _requestPasswordReset(email: email);

      state = ForgotPasswordState(
        status: ForgotPasswordStatus.otpSent,
        email: email,
      );
    } catch (error) {
      state = ForgotPasswordState(
        status: ForgotPasswordStatus.error,
        email: email,
        errorMessage: "Failed the following task, Please try again",
      );
    }
  }

  Future<void> verifyOtp({required String email, required String otp}) async {
    state = ForgotPasswordState(
      status: ForgotPasswordStatus.verifyingOtp,
      email: email,
    );

    try {
      final activationToken = await _verifyPasswordResetOtp(
        email: email,
        otp: otp,
      );

      state = ForgotPasswordState(
        status: ForgotPasswordStatus.otpVerified,
        email: email,
        activationToken: activationToken,
      );
    } catch (error) {
      state = ForgotPasswordState(
        status: ForgotPasswordStatus.error,
        email: email,
        errorMessage: "Failed the following task, Please try again",
      );
    }
  }

  Future<void> resetPassword({
    required String email,
    required String token,
    required String newPassword,
    required String confirmPassword,
  }) async {
    state = ForgotPasswordState(
      status: ForgotPasswordStatus.resettingPassword,
      email: state.email,
      activationToken: token,
    );

    try {
      await _resetPassword(
        email: email,
        token: token,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );

      state = ForgotPasswordState(
        status: ForgotPasswordStatus.passwordReset,
        email: state.email,
      );
    } catch (error) {
      state = ForgotPasswordState(
        status: ForgotPasswordStatus.error,
        email: state.email,
        activationToken: token,
        errorMessage: "Failed the following task, Please try again",
      );
    }
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }

  void resetState() {
    state = const ForgotPasswordState();
  }
}
