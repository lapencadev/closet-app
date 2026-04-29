import 'package:drift/drift.dart';
import 'package:mobile/services/closet_database.dart';

class ItemModel {
  final int? id;
  final String name;
  final String type;
  final String? colour;
  final String? season;
  final String? size;
  final String? imagePath;
  final bool isFavorite;
  final int? wardrobeId;

  ItemModel({
    this.id,
    required this.name,
    required this.type,
    this.colour,
    this.season,
    this.size,
    this.imagePath,
    this.isFavorite = false,
    this.wardrobeId,
  });

  // Convert from Database Entity (Drift) to UI Model
  factory ItemModel.fromEntity(Item entity) {
    return ItemModel(
      id: entity.id,
      name: entity.name,
      type: entity.type,
      colour: entity.colour,
      season: entity.season,
      size: entity.size,
      imagePath: entity.imagePath,
      isFavorite: entity.isFavorite,
      wardrobeId: entity.wardrobeId,
    );
  }

  // Convert from UI Model to Database Companion (for inserts/updates)
  ItemsCompanion toCompanion() {
    return ItemsCompanion.insert(
      name: name,
      type: type,
      colour: Value(colour),
      season: Value(season),
      size: Value(size),
      imagePath: Value(imagePath),
      isFavorite: Value(isFavorite),
      wardrobeId: Value(wardrobeId),
    );
  }
}
