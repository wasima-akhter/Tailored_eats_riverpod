import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/authentication/presentation/controllers/auth_controller.dart';
import '../../features/authentication/presentation/controllers/auth_state.dart';

class AuthRouterRefreshNotifier extends ChangeNotifier {
  AuthRouterRefreshNotifier(Ref ref) {
    _subscription = ref.listen<AuthState>(authControllerProvider, (
      previous,
      next,
    ) {
      notifyListeners();
    });
  }

  late final ProviderSubscription<AuthState> _subscription;

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}
