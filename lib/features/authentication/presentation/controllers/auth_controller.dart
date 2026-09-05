import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/storage/storage_provider.dart';
import '../../../../core/storage/storage_service.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/register_user.dart';
import '../providers/auth_provider.dart';
import 'auth_state.dart';

final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  AuthController.new,
);

class AuthController extends Notifier<AuthState> {
  late final LoginUser _loginUser;
  late final RegisterUser _registerUser;
  late final StorageService _storageService;

  @override
  AuthState build() {
    _loginUser = ref.watch(loginUserProvider);
    _registerUser = ref.watch(registerUserProvider);
    _storageService = ref.watch(storageServiceProvider);

    return const AuthState();
  }

  Future<void> login({required String email, required String password}) async {
    state = const AuthState(status: AuthStatus.loading);

    try {
      final AuthSession session = await _loginUser(
        email: email,
        password: password,
      );

      await _storageService.saveAccessToken(session.accessToken);

      state = AuthState(status: AuthStatus.authenticated, session: session);
    } catch (error) {
      state = AuthState(
        status: AuthStatus.error,
        errorMessage: "Failed the following task, Please try again",
      );
    } finally {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    state = const AuthState(status: AuthStatus.loading);

    try {
      final AuthSession session = await _registerUser(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );

      await _storageService.saveAccessToken(session.accessToken);

      state = AuthState(status: AuthStatus.authenticated, session: session);
    } catch (error) {
      state = AuthState(
        status: AuthStatus.error,
        errorMessage: "Failed the following task, Please try again",
      );
    } finally {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  Future<void> logout() async {
    await _storageService.clearAuthentication();

    state = const AuthState(status: AuthStatus.unauthenticated);
  }

  void clearError() {
    state = state.copyWith(errorMessage: null, clearError: true);
  }
}
