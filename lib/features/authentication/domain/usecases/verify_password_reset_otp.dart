import '../repositories/auth_repository.dart';

class VerifyPasswordResetOtp {
  final AuthRepository _repository;

  const VerifyPasswordResetOtp(this._repository);

  Future<String> call({required String email, required String otp}) {
    return _repository.verifyPasswordResetOtp(email: email, otp: otp);
  }
}
