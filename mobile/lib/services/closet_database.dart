import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'closet_database.g.dart';

class Items extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get type => text()();
  TextColumn get colour => text().nullable()();
  TextColumn get season => text().nullable()();
  TextColumn get size => text().nullable()();
  TextColumn get imagePath => text().nullable()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  IntColumn get wardrobeId => integer().nullable()();
  // Added in schema v2
  TextColumn get brand => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get sleeveLength => text().nullable()();
  TextColumn get fabricType => text().nullable()();
  TextColumn get pattern => text().nullable()();
}

class Loans extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemId => integer().references(Items, #id)();
  TextColumn get borrowerName => text()();
  DateTimeColumn get dateLoaned => dateTime()();
  DateTimeColumn get dateReturned => dateTime().nullable()();
  BoolColumn get isReturned => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [Items, Loans])
class ClosetDatabase extends _$ClosetDatabase {
  ClosetDatabase() : super(_openConnection());
  ClosetDatabase.forTesting(super.connection);
  ClosetDatabase.withExecutor(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (migrator, from, to) async {
        if (from < 2) {
          await migrator.addColumn(items, items.brand);
          await migrator.addColumn(items, items.description);
          await migrator.addColumn(items, items.sleeveLength);
          await migrator.addColumn(items, items.fabricType);
          await migrator.addColumn(items, items.pattern);
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}