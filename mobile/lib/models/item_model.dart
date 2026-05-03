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
  final String? brand;
  final String? description;
  final String? sleeveLength;
  final String? fabricType;
  final String? pattern;

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
    this.brand,
    this.description,
    this.sleeveLength,
    this.fabricType,
    this.pattern,
  });

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
      brand: entity.brand,
      description: entity.description,
      sleeveLength: entity.sleeveLength,
      fabricType: entity.fabricType,
      pattern: entity.pattern,
    );
  }

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
      brand: Value(brand),
      description: Value(description),
      sleeveLength: Value(sleeveLength),
      fabricType: Value(fabricType),
      pattern: Value(pattern),
    );
  }
}
