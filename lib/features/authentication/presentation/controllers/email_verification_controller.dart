import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/send_email_otp.dart';
import '../../domain/usecases/verify_email_otp.dart';
import '../providers/auth_provider.dart';
import 'email_verification_state.dart';

final emailVerificationControllerProvider =
    NotifierProvider<EmailVerificationController, EmailVerificationState>(
      EmailVerificationController.new,
    );

class EmailVerificationController extends Notifier<EmailVerificationState> {
  late final SendEmailOtp _sendEmailOtp;
  late final VerifyEmailOtp _verifyEmailOtp;

  @override
  EmailVerificationState build() {
    _sendEmailOtp = ref.watch(sendEmailOtpProvider);
    _verifyEmailOtp = ref.watch(verifyEmailOtpProvider);

    return const EmailVerificationState();
  }

  Future<void> sendOtp({required String email}) async {
    state = EmailVerificationState(
      status: EmailVerificationStatus.sendingOtp,
      email: email,
    );

    try {
      final verifiedEmail = await _sendEmailOtp(email: email);

      state = EmailVerificationState(
        status: EmailVerificationStatus.otpSent,
        email: verifiedEmail,
      );
    } catch (error) {
      state = EmailVerificationState(
        status: EmailVerificationStatus.error,
        email: email,
        errorMessage: "Failed the following task, Please try again",
      );
    }
  }

  Future<void> verifyOtp({required String email, required String otp}) async {
    state = EmailVerificationState(
      status: EmailVerificationStatus.verifyingOtp,
      email: email,
    );

    try {
      final isVerified = await _verifyEmailOtp(email: email, otp: otp);

      if (isVerified) {
        state = EmailVerificationState(
          status: EmailVerificationStatus.verified,
          email: email,
        );
      } else {
        state = EmailVerificationState(
          status: EmailVerificationStatus.error,
          email: email,
          errorMessage: 'Invalid verification code.',
        );
      }
    } catch (error) {
      state = EmailVerificationState(
        status: EmailVerificationStatus.error,
        email: email,
        errorMessage: "Failed the following task, Please try again",
      );
    }
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
