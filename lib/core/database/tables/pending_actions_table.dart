import 'package:drift/drift.dart';

class PendingActions extends Table {
  TextColumn get id => text()();

  TextColumn get endpoint => text()();

  TextColumn get method => text()();

  TextColumn get type => text()();

  TextColumn get data => text().nullable()();

  TextColumn get queryParameters => text().nullable()();

  IntColumn get retryCount => integer().withDefault(const Constant(0))();

  DateTimeColumn get createdAt => dateTime()();

  TextColumn get status => text().withDefault(const Constant('pending'))();

  @override
  Set<Column> get primaryKey => {id};
}
