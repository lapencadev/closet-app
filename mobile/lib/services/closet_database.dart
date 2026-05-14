import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'closet_database.g.dart';

class Items extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get type => text()(); // CLOTHES, ACCESSORY, etc.
  TextColumn get subType => text().nullable()(); // SHIRT, PANT, BAG, etc.
  TextColumn get colour => text().nullable()();
  TextColumn get secondaryColour => text().nullable()();
  TextColumn get season => text().nullable()();
  TextColumn get size => text().nullable()();
  TextColumn get imagePath => text().nullable()();
  TextColumn get brand => text().nullable()();
  TextColumn get description => text().nullable()();

  BoolColumn get isFavourite => boolean().withDefault(const Constant(false))();
  BoolColumn get isBorrowed => boolean().withDefault(const Constant(false))();
  BoolColumn get isVisible => boolean().withDefault(const Constant(true))();

  IntColumn get wardrobeId => integer().nullable()();

  // Clothes specific
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
  DateTimeColumn get expectedReturnDate => dateTime().nullable()();
  BoolColumn get isReturned => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
}

class Wardrobes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get description => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  BoolColumn get isFavourite => boolean().withDefault(const Constant(false))();
  BoolColumn get isAutoFavourites =>
      boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [Items, Loans, Wardrobes])
class ClosetDatabase extends _$ClosetDatabase {
  ClosetDatabase() : super(_openConnection());
  ClosetDatabase.forTesting(super.connection);
  ClosetDatabase.withExecutor(super.e);

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (migrator, from, to) async {
        if (from < 2) {
          await migrator.addColumn(items, items.brand);
          await migrator.addColumn(items, items.description);
          await migrator.addColumn(items, items.sleeveLength);
          await migrator.addColumn(items, items.fabricType);
          await migrator.addColumn(items, items.pattern);
        }
        if (from < 3) {
          await migrator.createTable(wardrobes);
          await migrator.addColumn(items, items.subType);
          await migrator.addColumn(items, items.secondaryColour);
          await migrator.addColumn(items, items.isBorrowed);
          await migrator.addColumn(items, items.isVisible);
          await migrator.addColumn(loans, loans.expectedReturnDate);
          await migrator.addColumn(loans, loans.notes);
        }
        if (from < 4) {
          await customStatement(
            'ALTER TABLE items ADD COLUMN IF NOT EXISTS is_favourite INTEGER NOT NULL DEFAULT 0',
          );
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
