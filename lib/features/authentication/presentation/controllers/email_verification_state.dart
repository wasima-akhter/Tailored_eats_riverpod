enum EmailVerificationStatus {
  initial,
  sendingOtp,
  otpSent,
  verifyingOtp,
  verified,
  error,
}

class EmailVerificationState {
  final EmailVerificationStatus status;
  final String? email;
  final String? errorMessage;

  const EmailVerificationState({
    this.status = EmailVerificationStatus.initial,
    this.email,
    this.errorMessage,
  });

  bool get isLoading {
    return status == EmailVerificationStatus.sendingOtp ||
        status == EmailVerificationStatus.verifyingOtp;
  }

  EmailVerificationState copyWith({
    EmailVerificationStatus? status,
    String? email,
    String? errorMessage,
    bool clearError = false,
  }) {
    return EmailVerificationState(
      status: status ?? this.status,
      email: email ?? this.email,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}
