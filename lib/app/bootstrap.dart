import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/database/database_provider.dart';
import '../../core/storage/storage_provider.dart';
import '../../core/sync/sync_provider.dart';

Future<void> bootstrap({required Widget app}) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (details) {
        FlutterError.presentError(details);

        if (kDebugMode) {
          debugPrint('Flutter error: ${details.exception}');
          debugPrintStack(stackTrace: details.stack);
        }
      };

      // Initialize SharedPreferences BEFORE creating ProviderContainer.
      final sharedPreferences = await SharedPreferences.getInstance();

      final container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        ],
      );

      try {
        // Initialize the local database.
        container.read(databaseProvider);

        // Initialize the sync manager.
        container.read(syncManagerProvider);

        runApp(UncontrolledProviderScope(container: container, child: app));
      } catch (error, stackTrace) {
        debugPrint('Bootstrap error: $error');
        debugPrintStack(stackTrace: stackTrace);

        container.dispose();

        rethrow;
      }
    },
    (error, stackTrace) {
      debugPrint('Uncaught application error: $error');
      debugPrintStack(stackTrace: stackTrace);
    },
  );
}
