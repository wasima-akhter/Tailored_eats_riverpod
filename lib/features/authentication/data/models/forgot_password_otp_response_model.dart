class ForgotPasswordOtpResponseModel {
  final String email;
  final String activationToken;

  const ForgotPasswordOtpResponseModel({
    required this.email,
    required this.activationToken,
  });

  factory ForgotPasswordOtpResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;

    return ForgotPasswordOtpResponseModel(
      email: data['email'] as String? ?? '',
      activationToken: data['activationToken'] as String? ?? '',
    );
  }
}
