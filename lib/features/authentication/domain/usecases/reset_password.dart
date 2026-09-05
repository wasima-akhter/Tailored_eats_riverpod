import '../repositories/auth_repository.dart';

class ResetPassword {
  final AuthRepository _repository;

  const ResetPassword(this._repository);

  Future<void> call({
    required String email,
    required String token,
    required String newPassword,
    required String confirmPassword,
  }) {
    return _repository.resetPassword(
      email: email,
      token: token,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
  }
}
