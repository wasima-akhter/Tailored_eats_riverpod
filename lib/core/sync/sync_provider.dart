import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/database_provider.dart';
import '../network/network_providers.dart';
import 'sync_manager.dart';
import 'sync_service.dart';

/// Handles execution of pending sync actions through the API client.
final syncServiceProvider = Provider<SyncService>((ref) {
  return SyncService(apiClient: ref.watch(apiClientProvider));
});

/// Manages the synchronization queue and pending actions.
final syncManagerProvider = Provider<SyncManager>((ref) {
  return SyncManager(
    database: ref.watch(databaseProvider),
    syncService: ref.watch(syncServiceProvider),
  );
});

/// Whether synchronization is currently running.
final syncStateProvider = StateProvider<bool>((ref) {
  return false;
});
