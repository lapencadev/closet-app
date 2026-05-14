import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/services/closet_database.dart';
import 'package:drift/drift.dart';

void main() {
  late ClosetDatabase database;

  setUp(() {
    database = ClosetDatabase.withExecutor(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  group('ClosetDatabase', () {
    test('should insert and retrieve an item with v3 fields', () async {
      await database
          .into(database.items)
          .insert(
            ItemsCompanion.insert(
              name: 'Blue Jeans',
              type: 'CLOTHES',
              subType: const Value('PANT'),
              colour: const Value('BLUE'),
              secondaryColour: const Value('WHITE'),
              isFavourite: const Value(true),
              isBorrowed: const Value(false),
            ),
          );

      final allItems = await database.select(database.items).get();

      expect(allItems.length, 1);
      expect(allItems.first.name, 'Blue Jeans');
      expect(allItems.first.subType, 'PANT');
      expect(allItems.first.secondaryColour, 'WHITE');
      expect(allItems.first.isFavourite, true);
    });

    test(
      'should insert and retrieve a loan with notes and expected date',
      () async {
        final itemId = await database
            .into(database.items)
            .insert(
              ItemsCompanion.insert(
                name: 'Leather Jacket',
                type: 'CLOTHES',
                subType: const Value('JACKET'),
              ),
            );

        final now = DateTime.now();
        final expected = DateTime(
          now.year,
          now.month,
          now.day,
          now.hour,
          now.minute,
          now.second,
        ).add(const Duration(days: 7));
        await database
            .into(database.loans)
            .insert(
              LoansCompanion.insert(
                itemId: itemId,
                borrowerName: 'Alice',
                dateLoaned: now,
                expectedReturnDate: Value(expected),
                notes: const Value('Handle with care'),
              ),
            );

        final allLoans = await database.select(database.loans).get();

        expect(allLoans.length, 1);
        expect(allLoans.first.borrowerName, 'Alice');
        expect(allLoans.first.notes, 'Handle with care');
        expect(allLoans.first.expectedReturnDate, expected);
      },
    );

    test('should insert and retrieve a wardrobe', () async {
      await database
          .into(database.wardrobes)
          .insert(
            WardrobesCompanion.insert(
              name: 'Main Wardrobe',
              description: const Value('Bedroom closet'),
              isAutoFavourites: const Value(true),
            ),
          );

      final allWardrobes = await database.select(database.wardrobes).get();

      expect(allWardrobes.length, 1);
      expect(allWardrobes.first.name, 'Main Wardrobe');
      expect(allWardrobes.first.isAutoFavourites, true);
    });
  });
}
