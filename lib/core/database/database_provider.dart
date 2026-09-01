import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_database.dart';
import 'daos/friend_dao.dart';
import 'daos/meal_dao.dart';
import 'daos/pending_action_dao.dart';
import 'daos/progress_dao.dart';
import 'daos/user_dao.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase(
    LazyDatabase(() async {
      // The actual database connection will be configured here.
      //
      // We will add the native SQLite implementation in the next
      // step after confirming your Drift package/platform setup.
      throw UnimplementedError(
        'Database connection has not been configured yet.',
      );
    }),
  );

  ref.onDispose(database.close);

  return database;
});

final userDaoProvider = Provider<UserDao>((ref) {
  return ref.watch(databaseProvider).userDao;
});

final mealDaoProvider = Provider<MealDao>((ref) {
  return ref.watch(databaseProvider).mealDao;
});

final progressDaoProvider = Provider<ProgressDao>((ref) {
  return ref.watch(databaseProvider).progressDao;
});

final friendDaoProvider = Provider<FriendDao>((ref) {
  return ref.watch(databaseProvider).friendDao;
});

final pendingActionDaoProvider = Provider<PendingActionDao>((ref) {
  return ref.watch(databaseProvider).pendingActionDao;
});

/*

                    ┌─────────────────┐
                    │      UI         │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │    Riverpod     │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │   Repository    │
                    │    (later)      │
                    └──────┬─────┬────┘
                           │     │
                  ┌────────┘     └─────────┐
                  ▼                        ▼
          ┌──────────────┐         ┌──────────────┐
          │    Drift     │         │   REST API   │
          │    SQLite    │         │     Dio      │
          └──────────────┘         └──────────────┘
                  │
                  ▼
          Pending Actions
                  │
                  ▼
          Offline Sync (#8)


          */
