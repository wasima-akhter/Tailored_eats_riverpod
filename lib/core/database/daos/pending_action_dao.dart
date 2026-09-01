import 'dart:convert';

import 'package:drift/drift.dart';

import '../../sync/models/pending_action.dart' as sync_model;
import '../app_database.dart';
import '../tables/pending_actions_table.dart';

part 'pending_action_dao.g.dart';

@DriftAccessor(tables: [PendingActions])
class PendingActionDao extends DatabaseAccessor<AppDatabase>
    with _$PendingActionDaoMixin {
  PendingActionDao(super.db);

  /// Get all actions waiting to be synchronized.
  Future<List<sync_model.PendingAction>> getAllPendingActions() async {
    final rows =
        await (select(pendingActions)
              ..where(
                (table) =>
                    table.status.equals('pending') |
                    table.status.equals('failed'),
              )
              ..orderBy([(table) => OrderingTerm.asc(table.createdAt)]))
            .get();

    return rows.map(_toModel).toList();
  }

  /// Insert a new pending action.
  Future<void> insertPendingAction(sync_model.PendingAction action) async {
    await into(pendingActions).insert(_toCompanion(action));
  }

  /// Update an existing pending action.
  ///
  /// This does not change the status. The sync system controls
  /// the pending/failed state separately.
  Future<void> updatePendingAction(sync_model.PendingAction action) async {
    await (update(
      pendingActions,
    )..where((table) => table.id.equals(action.id))).write(
      PendingActionsCompanion(
        endpoint: Value(action.endpoint),
        method: Value(action.method),
        type: Value(action.type.name),
        data: Value(_encodeMap(action.data)),
        queryParameters: Value(_encodeMap(action.queryParameters)),
        retryCount: Value(action.retryCount),
        createdAt: Value(action.createdAt),
      ),
    );
  }

  /// Delete a pending action.
  Future<void> deletePendingAction(String id) async {
    await (delete(pendingActions)..where((table) => table.id.equals(id))).go();
  }

  /// Update only the action status.
  Future<void> updateStatus({
    required String id,
    required String status,
  }) async {
    await (update(pendingActions)..where((table) => table.id.equals(id))).write(
      PendingActionsCompanion(status: Value(status)),
    );
  }

  /// Convert Drift row → domain model.
  sync_model.PendingAction _toModel(PendingAction row) {
    return sync_model.PendingAction(
      id: row.id,
      endpoint: row.endpoint,
      method: row.method,
      type: sync_model.PendingActionType.values.firstWhere(
        (value) => value.name == row.type,
        orElse: () => sync_model.PendingActionType.create,
      ),
      data: _decodeMap(row.data),
      queryParameters: _decodeMap(row.queryParameters),
      retryCount: row.retryCount,
      createdAt: row.createdAt,
    );
  }

  /// Convert domain model → Drift companion.
  PendingActionsCompanion _toCompanion(sync_model.PendingAction action) {
    return PendingActionsCompanion(
      id: Value(action.id),
      endpoint: Value(action.endpoint),
      method: Value(action.method),
      type: Value(action.type.name),
      data: Value(_encodeMap(action.data)),
      queryParameters: Value(_encodeMap(action.queryParameters)),
      retryCount: Value(action.retryCount),
      createdAt: Value(action.createdAt),
      status: const Value('pending'),
    );
  }

  /// Encode a map as JSON for Drift's TextColumn.
  String? _encodeMap(Map<String, dynamic>? value) {
    if (value == null) {
      return null;
    }

    return jsonEncode(value);
  }

  /// Decode JSON from Drift's TextColumn back to a map.
  Map<String, dynamic>? _decodeMap(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    final decoded = jsonDecode(value);

    if (decoded is Map) {
      return Map<String, dynamic>.from(decoded);
    }

    return null;
  }
}
