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
        type: 'Shirt',
        colour: 'Blue',
        season: 'Summer',
        size: 'M',
        imagePath: 'path/to/image',
        isFavorite: true,
        wardrobeId: 10,
      );

      final model = ItemModel.fromEntity(entity);

      expect(model.id, 1);
      expect(model.name, 'Test Shirt');
      expect(model.type, 'Shirt');
      expect(model.colour, 'Blue');
      expect(model.season, 'Summer');
      expect(model.size, 'M');
      expect(model.imagePath, 'path/to/image');
      expect(model.isFavorite, true);
      expect(model.wardrobeId, 10);
    });

    test('toCompanion should correctly map ItemModel to ItemsCompanion', () {
      final model = ItemModel(
        name: 'New Item',
        type: 'Pants',
        colour: 'Black',
        isFavorite: false,
      );

      final companion = model.toCompanion();

      expect(companion.name.value, 'New Item');
      expect(companion.type.value, 'Pants');
      expect(companion.colour.value, 'Black');
      expect(companion.isFavorite.value, false);
      expect(
        companion.id,
        isA<Value<int>>(),
      ); // Auto-increment so it's absent or default
    });
  });
}
