import '../entities/auth_session.dart';
import '../repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository _repository;

  const RegisterUser(this._repository);

  Future<AuthSession> call({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return _repository.register(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
