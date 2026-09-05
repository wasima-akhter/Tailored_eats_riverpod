import '../../data/datasources/auth_remote_data_source.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  const AuthRepositoryImpl({required this._remoteDataSource});

  @override
  Future<AuthSession> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await _remoteDataSource.register(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    return response.toEntity();
  }

  @override
  Future<AuthSession> login({
    required String email,
    required String password,
  }) async {
    final response = await _remoteDataSource.login(
      email: email,
      password: password,
    );

    return response.toEntity();
  }

  @override
  Future<String> sendEmailOtp({required String email}) {
    return _remoteDataSource.sendEmailOtp(email: email);
  }

  @override
  Future<bool> verifyEmailOtp({required String email, required String otp}) {
    return _remoteDataSource.verifyEmailOtp(email: email, otp: otp);
  }

  @override
  Future<void> requestPasswordReset({required String email}) {
    return _remoteDataSource.requestPasswordReset(email: email);
  }

  @override
  Future<String> verifyPasswordResetOtp({
    required String email,
    required String otp,
  }) async {
    final response = await _remoteDataSource.verifyPasswordResetOtp(
      email: email,
      otp: otp,
    );

    return response.activationToken;
  }

  @override
  Future<void> resetPassword({
    required String email,
    required String token,
    required String newPassword,
    required String confirmPassword,
  }) {
    return _remoteDataSource.resetPassword(
      email: email,
      token: token,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
  }
}
