import '../../domain/entities/auth_session.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState {
  final AuthStatus status;
  final AuthSession? session;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.session,
    this.errorMessage,
  });

  bool get isLoading => status == AuthStatus.loading;

  bool get isAuthenticated => status == AuthStatus.authenticated;

  AuthState copyWith({
    AuthStatus? status,
    AuthSession? session,
    String? errorMessage,
    bool clearSession = false,
    bool clearError = false,
  }) {
    return AuthState(
      status: status ?? this.status,
      session: clearSession ? null : session ?? this.session,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}
