import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/services/closet_database.dart';

void main() {
  late ClosetDatabase database;

  setUp(() {
    database = ClosetDatabase.withExecutor(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  group('ClosetDatabase', () {
    test('should insert and retrieve an item', () async {
      await database
          .into(database.items)
          .insert(ItemsCompanion.insert(name: 'Blue Jeans', type: 'Pants'));

      final allItems = await database.select(database.items).get();

      expect(allItems.length, 1);
      expect(allItems.first.name, 'Blue Jeans');
    });

    test('should insert and retrieve a loan', () async {
      final itemId = await database
          .into(database.items)
          .insert(
            ItemsCompanion.insert(name: 'Leather Jacket', type: 'Jacket'),
          );

      final now = DateTime.now();
      await database
          .into(database.loans)
          .insert(
            LoansCompanion.insert(
              itemId: itemId,
              borrowerName: 'Alice',
              dateLoaned: now,
            ),
          );

      final allLoans = await database.select(database.loans).get();

      expect(allLoans.length, 1);
      expect(allLoans.first.borrowerName, 'Alice');
      expect(allLoans.first.itemId, itemId);
    });
  });
}
