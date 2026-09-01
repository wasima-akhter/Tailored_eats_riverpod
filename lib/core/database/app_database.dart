import 'package:drift/drift.dart';

import 'daos/friend_dao.dart';
import 'daos/meal_dao.dart';
import 'daos/pending_action_dao.dart';
import 'daos/progress_dao.dart';
import 'daos/user_dao.dart';
import 'tables/cached_friends_table.dart';
import 'tables/cached_meals_table.dart';
import 'tables/cached_progress_table.dart';
import 'tables/cached_user_table.dart';
import 'tables/pending_actions_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    CachedUsers,
    CachedMeals,
    CachedProgress,
    CachedFriends,
    PendingActions,
  ],
  daos: [UserDao, MealDao, ProgressDao, FriendDao, PendingActionDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
