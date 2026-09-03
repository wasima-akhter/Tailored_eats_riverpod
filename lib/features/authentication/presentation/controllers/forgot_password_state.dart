enum ForgotPasswordStatus {
  initial,
  requestingOtp,
  otpSent,
  verifyingOtp,
  otpVerified,
  resettingPassword,
  passwordReset,
  error,
}

class ForgotPasswordState {
  final ForgotPasswordStatus status;
  final String? email;
  final String? activationToken;
  final String? errorMessage;

  const ForgotPasswordState({
    this.status = ForgotPasswordStatus.initial,
    this.email,
    this.activationToken,
    this.errorMessage,
  });

  bool get isLoading {
    return status == ForgotPasswordStatus.requestingOtp ||
        status == ForgotPasswordStatus.verifyingOtp ||
        status == ForgotPasswordStatus.resettingPassword;
  }

  bool get isOtpSent {
    return status == ForgotPasswordStatus.otpSent;
  }

  bool get isOtpVerified {
    return status == ForgotPasswordStatus.otpVerified;
  }

  bool get isPasswordReset {
    return status == ForgotPasswordStatus.passwordReset;
  }

  ForgotPasswordState copyWith({
    ForgotPasswordStatus? status,
    String? email,
    String? activationToken,
    String? errorMessage,
    bool clearActivationToken = false,
    bool clearError = false,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
      email: email ?? this.email,
      activationToken: clearActivationToken
          ? null
          : activationToken ?? this.activationToken,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}
