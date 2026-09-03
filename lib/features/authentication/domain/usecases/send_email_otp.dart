import '../repositories/auth_repository.dart';

class SendEmailOtp {
  final AuthRepository _repository;

  const SendEmailOtp(this._repository);

  Future<String> call({required String email}) {
    return _repository.sendEmailOtp(email: email);
  }
}
