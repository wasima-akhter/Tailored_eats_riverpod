import '../repositories/auth_repository.dart';

class VerifyEmailOtp {
  final AuthRepository _repository;

  const VerifyEmailOtp(this._repository);

  Future<bool> call({required String email, required String otp}) {
    return _repository.verifyEmailOtp(email: email, otp: otp);
  }
}
