import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/models/item_model.dart';
import 'package:mobile/services/closet_database.dart';

void main() {
  group('ItemModel', () {
    test('fromEntity should correctly map Item to ItemModel', () {
      final entity = Item(
        id: 1,
        name: 'Test Shirt',
        type: 'CLOTHES',
        subType: 'SHIRT',
        colour: 'Blue',
        secondaryColour: 'White',
        season: 'Summer',
        size: 'M',
        imagePath: 'path/to/image',
        isFavourite: true,
        isBorrowed: false,
        isVisible: true,
        wardrobeId: 10,
      );

      final model = ItemModel.fromEntity(entity);

      expect(model.id, 1);
      expect(model.name, 'Test Shirt');
      expect(model.type, 'CLOTHES');
      expect(model.subType, 'SHIRT');
      expect(model.colour, 'Blue');
      expect(model.secondaryColour, 'White');
      expect(model.season, 'Summer');
      expect(model.size, 'M');
      expect(model.imagePath, 'path/to/image');
      expect(model.isFavourite, true);
      expect(model.isBorrowed, false);
      expect(model.isVisible, true);
      expect(model.wardrobeId, 10);
    });

    test('toCompanion should correctly map ItemModel to ItemsCompanion', () {
      final model = ItemModel(
        name: 'New Item',
        type: 'CLOTHES',
        colour: 'Black',
        isFavourite: false,
      );

      final companion = model.toCompanion();

      expect(companion.name.value, 'New Item');
      expect(companion.type.value, 'CLOTHES');
      expect(companion.colour.value, 'Black');
      expect(companion.isFavourite.value, false);
      expect(companion.id, isA<Value<int>>());
    });
  });
}
