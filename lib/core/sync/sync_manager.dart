import 'package:flutter/foundation.dart';
import 'package:tailored_eats_riverpod/core/sync/models/pending_action.dart'
    as sync_model;

import '../database/app_database.dart';
import 'sync_service.dart';

class SyncManager {
  final AppDatabase _database;
  final SyncService _syncService;

  bool _isSyncing = false;

  SyncManager({required this._database, required this._syncService});

  bool get isSyncing => _isSyncing;

  Future<void> sync() async {
    if (_isSyncing) {
      return;
    }

    _isSyncing = true;

    try {
      final pendingActions = await _database.pendingActionDao
          .getAllPendingActions();

      for (final action in pendingActions) {
        await _processAction(action);
      }
    } catch (e, stackTrace) {
      debugPrint('Sync error: $e');
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      _isSyncing = false;
    }
  }

  Future<void> _processAction(sync_model.PendingAction action) async {
    try {
      await _syncService.execute(action);

      await _database.pendingActionDao.deletePendingAction(action.id);
    } catch (e, stackTrace) {
      debugPrint('Failed to sync action ${action.id}: $e');
      debugPrintStack(stackTrace: stackTrace);

      await _handleFailedAction(action);
    }
  }

  Future<void> _handleFailedAction(sync_model.PendingAction action) async {
    final updatedAction = action.copyWith(retryCount: action.retryCount + 1);

    await _database.pendingActionDao.updatePendingAction(updatedAction);
  }
}
