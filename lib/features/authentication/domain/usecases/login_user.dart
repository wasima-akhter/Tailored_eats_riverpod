import '../entities/auth_session.dart';
import '../repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository _repository;

  const LoginUser(this._repository);

  Future<AuthSession> call({required String email, required String password}) {
    return _repository.login(email: email, password: password);
  }
}
