class EmailOtpResponseModel {
  final String email;

  const EmailOtpResponseModel({required this.email});

  factory EmailOtpResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;

    return EmailOtpResponseModel(email: data['email'] as String? ?? '');
  }
}
