import 'package:drift/drift.dart';
import 'package:mobile/services/closet_database.dart';

class ItemModel {
  final int? id;
  final String name;
  final String type;
  final String? subType;
  final String? colour;
  final String? secondaryColour;
  final String? season;
  final String? size;
  final String? imagePath;
  final String? brand;
  final String? description;
  final bool isFavourite;
  final bool isBorrowed;
  final bool isVisible;
  final int? wardrobeId;
  final String? sleeveLength;
  final String? fabricType;
  final String? pattern;

  ItemModel({
    this.id,
    required this.name,
    required this.type,
    this.subType,
    this.colour,
    this.secondaryColour,
    this.season,
    this.size,
    this.imagePath,
    this.brand,
    this.description,
    this.isFavourite = false,
    this.isBorrowed = false,
    this.isVisible = true,
    this.wardrobeId,
    this.sleeveLength,
    this.fabricType,
    this.pattern,
  });

  factory ItemModel.fromEntity(Item entity) {
    return ItemModel(
      id: entity.id,
      name: entity.name,
      type: entity.type,
      subType: entity.subType,
      colour: entity.colour,
      secondaryColour: entity.secondaryColour,
      season: entity.season,
      size: entity.size,
      imagePath: entity.imagePath,
      brand: entity.brand,
      description: entity.description,
      isFavourite: entity.isFavourite,
      isBorrowed: entity.isBorrowed,
      isVisible: entity.isVisible,
      wardrobeId: entity.wardrobeId,
      sleeveLength: entity.sleeveLength,
      fabricType: entity.fabricType,
      pattern: entity.pattern,
    );
  }

  ItemsCompanion toCompanion() {
    return ItemsCompanion.insert(
      name: name,
      type: type,
      subType: Value(subType),
      colour: Value(colour),
      secondaryColour: Value(secondaryColour),
      season: Value(season),
      size: Value(size),
      imagePath: Value(imagePath),
      brand: Value(brand),
      description: Value(description),
      isFavourite: Value(isFavourite),
      isBorrowed: Value(isBorrowed),
      isVisible: Value(isVisible),
      wardrobeId: Value(wardrobeId),
      sleeveLength: Value(sleeveLength),
      fabricType: Value(fabricType),
      pattern: Value(pattern),
    );
  }
}
