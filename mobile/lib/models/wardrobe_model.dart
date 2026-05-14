import 'package:drift/drift.dart';
import 'package:mobile/services/closet_database.dart';

class WardrobeModel {
  final int? id;
  final String name;
  final String? description;
  final String? location;
  final String? imageUrl;
  final bool isFavourite;
  final bool isAutoFavourites;

  WardrobeModel({
    this.id,
    required this.name,
    this.description,
    this.location,
    this.imageUrl,
    this.isFavourite = false,
    this.isAutoFavourites = false,
  });

  factory WardrobeModel.fromEntity(Wardrobe entity) {
    return WardrobeModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      location: entity.location,
      imageUrl: entity.imageUrl,
      isFavourite: entity.isFavourite,
      isAutoFavourites: entity.isAutoFavourites,
    );
  }

  WardrobesCompanion toCompanion() {
    return WardrobesCompanion.insert(
      name: name,
      description: Value(description),
      location: Value(location),
      imageUrl: Value(imageUrl),
      isFavourite: Value(isFavourite),
      isAutoFavourites: Value(isAutoFavourites),
    );
  }
}
