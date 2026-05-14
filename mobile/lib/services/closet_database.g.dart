// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closet_database.dart';

// ignore_for_file: type=lint
class $ItemsTable extends Items with TableInfo<$ItemsTable, Item> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subTypeMeta = const VerificationMeta(
    'subType',
  );
  @override
  late final GeneratedColumn<String> subType = GeneratedColumn<String>(
    'sub_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colourMeta = const VerificationMeta('colour');
  @override
  late final GeneratedColumn<String> colour = GeneratedColumn<String>(
    'colour',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _secondaryColourMeta = const VerificationMeta(
    'secondaryColour',
  );
  @override
  late final GeneratedColumn<String> secondaryColour = GeneratedColumn<String>(
    'secondary_colour',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _seasonMeta = const VerificationMeta('season');
  @override
  late final GeneratedColumn<String> season = GeneratedColumn<String>(
    'season',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<String> size = GeneratedColumn<String>(
    'size',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFavouriteMeta = const VerificationMeta(
    'isFavourite',
  );
  @override
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
    'is_favourite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favourite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isBorrowedMeta = const VerificationMeta(
    'isBorrowed',
  );
  @override
  late final GeneratedColumn<bool> isBorrowed = GeneratedColumn<bool>(
    'is_borrowed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_borrowed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isVisibleMeta = const VerificationMeta(
    'isVisible',
  );
  @override
  late final GeneratedColumn<bool> isVisible = GeneratedColumn<bool>(
    'is_visible',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_visible" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _wardrobeIdMeta = const VerificationMeta(
    'wardrobeId',
  );
  @override
  late final GeneratedColumn<int> wardrobeId = GeneratedColumn<int>(
    'wardrobe_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sleeveLengthMeta = const VerificationMeta(
    'sleeveLength',
  );
  @override
  late final GeneratedColumn<String> sleeveLength = GeneratedColumn<String>(
    'sleeve_length',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fabricTypeMeta = const VerificationMeta(
    'fabricType',
  );
  @override
  late final GeneratedColumn<String> fabricType = GeneratedColumn<String>(
    'fabric_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _patternMeta = const VerificationMeta(
    'pattern',
  );
  @override
  late final GeneratedColumn<String> pattern = GeneratedColumn<String>(
    'pattern',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    type,
    subType,
    colour,
    secondaryColour,
    season,
    size,
    imagePath,
    brand,
    description,
    isFavourite,
    isBorrowed,
    isVisible,
    wardrobeId,
    sleeveLength,
    fabricType,
    pattern,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'items';
  @override
  VerificationContext validateIntegrity(
    Insertable<Item> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('sub_type')) {
      context.handle(
        _subTypeMeta,
        subType.isAcceptableOrUnknown(data['sub_type']!, _subTypeMeta),
      );
    }
    if (data.containsKey('colour')) {
      context.handle(
        _colourMeta,
        colour.isAcceptableOrUnknown(data['colour']!, _colourMeta),
      );
    }
    if (data.containsKey('secondary_colour')) {
      context.handle(
        _secondaryColourMeta,
        secondaryColour.isAcceptableOrUnknown(
          data['secondary_colour']!,
          _secondaryColourMeta,
        ),
      );
    }
    if (data.containsKey('season')) {
      context.handle(
        _seasonMeta,
        season.isAcceptableOrUnknown(data['season']!, _seasonMeta),
      );
    }
    if (data.containsKey('size')) {
      context.handle(
        _sizeMeta,
        size.isAcceptableOrUnknown(data['size']!, _sizeMeta),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_favourite')) {
      context.handle(
        _isFavouriteMeta,
        isFavourite.isAcceptableOrUnknown(
          data['is_favourite']!,
          _isFavouriteMeta,
        ),
      );
    }
    if (data.containsKey('is_borrowed')) {
      context.handle(
        _isBorrowedMeta,
        isBorrowed.isAcceptableOrUnknown(data['is_borrowed']!, _isBorrowedMeta),
      );
    }
    if (data.containsKey('is_visible')) {
      context.handle(
        _isVisibleMeta,
        isVisible.isAcceptableOrUnknown(data['is_visible']!, _isVisibleMeta),
      );
    }
    if (data.containsKey('wardrobe_id')) {
      context.handle(
        _wardrobeIdMeta,
        wardrobeId.isAcceptableOrUnknown(data['wardrobe_id']!, _wardrobeIdMeta),
      );
    }
    if (data.containsKey('sleeve_length')) {
      context.handle(
        _sleeveLengthMeta,
        sleeveLength.isAcceptableOrUnknown(
          data['sleeve_length']!,
          _sleeveLengthMeta,
        ),
      );
    }
    if (data.containsKey('fabric_type')) {
      context.handle(
        _fabricTypeMeta,
        fabricType.isAcceptableOrUnknown(data['fabric_type']!, _fabricTypeMeta),
      );
    }
    if (data.containsKey('pattern')) {
      context.handle(
        _patternMeta,
        pattern.isAcceptableOrUnknown(data['pattern']!, _patternMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Item map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Item(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      subType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sub_type'],
      ),
      colour: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}colour'],
      ),
      secondaryColour: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}secondary_colour'],
      ),
      season: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}season'],
      ),
      size: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}size'],
      ),
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isFavourite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favourite'],
      )!,
      isBorrowed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_borrowed'],
      )!,
      isVisible: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_visible'],
      )!,
      wardrobeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wardrobe_id'],
      ),
      sleeveLength: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sleeve_length'],
      ),
      fabricType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fabric_type'],
      ),
      pattern: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pattern'],
      ),
    );
  }

  @override
  $ItemsTable createAlias(String alias) {
    return $ItemsTable(attachedDatabase, alias);
  }
}

class Item extends DataClass implements Insertable<Item> {
  final int id;
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
  const Item({
    required this.id,
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
    required this.isFavourite,
    required this.isBorrowed,
    required this.isVisible,
    this.wardrobeId,
    this.sleeveLength,
    this.fabricType,
    this.pattern,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || subType != null) {
      map['sub_type'] = Variable<String>(subType);
    }
    if (!nullToAbsent || colour != null) {
      map['colour'] = Variable<String>(colour);
    }
    if (!nullToAbsent || secondaryColour != null) {
      map['secondary_colour'] = Variable<String>(secondaryColour);
    }
    if (!nullToAbsent || season != null) {
      map['season'] = Variable<String>(season);
    }
    if (!nullToAbsent || size != null) {
      map['size'] = Variable<String>(size);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_favourite'] = Variable<bool>(isFavourite);
    map['is_borrowed'] = Variable<bool>(isBorrowed);
    map['is_visible'] = Variable<bool>(isVisible);
    if (!nullToAbsent || wardrobeId != null) {
      map['wardrobe_id'] = Variable<int>(wardrobeId);
    }
    if (!nullToAbsent || sleeveLength != null) {
      map['sleeve_length'] = Variable<String>(sleeveLength);
    }
    if (!nullToAbsent || fabricType != null) {
      map['fabric_type'] = Variable<String>(fabricType);
    }
    if (!nullToAbsent || pattern != null) {
      map['pattern'] = Variable<String>(pattern);
    }
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      subType: subType == null && nullToAbsent
          ? const Value.absent()
          : Value(subType),
      colour: colour == null && nullToAbsent
          ? const Value.absent()
          : Value(colour),
      secondaryColour: secondaryColour == null && nullToAbsent
          ? const Value.absent()
          : Value(secondaryColour),
      season: season == null && nullToAbsent
          ? const Value.absent()
          : Value(season),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      brand: brand == null && nullToAbsent
          ? const Value.absent()
          : Value(brand),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isFavourite: Value(isFavourite),
      isBorrowed: Value(isBorrowed),
      isVisible: Value(isVisible),
      wardrobeId: wardrobeId == null && nullToAbsent
          ? const Value.absent()
          : Value(wardrobeId),
      sleeveLength: sleeveLength == null && nullToAbsent
          ? const Value.absent()
          : Value(sleeveLength),
      fabricType: fabricType == null && nullToAbsent
          ? const Value.absent()
          : Value(fabricType),
      pattern: pattern == null && nullToAbsent
          ? const Value.absent()
          : Value(pattern),
    );
  }

  factory Item.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Item(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      subType: serializer.fromJson<String?>(json['subType']),
      colour: serializer.fromJson<String?>(json['colour']),
      secondaryColour: serializer.fromJson<String?>(json['secondaryColour']),
      season: serializer.fromJson<String?>(json['season']),
      size: serializer.fromJson<String?>(json['size']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      brand: serializer.fromJson<String?>(json['brand']),
      description: serializer.fromJson<String?>(json['description']),
      isFavourite: serializer.fromJson<bool>(json['isFavourite']),
      isBorrowed: serializer.fromJson<bool>(json['isBorrowed']),
      isVisible: serializer.fromJson<bool>(json['isVisible']),
      wardrobeId: serializer.fromJson<int?>(json['wardrobeId']),
      sleeveLength: serializer.fromJson<String?>(json['sleeveLength']),
      fabricType: serializer.fromJson<String?>(json['fabricType']),
      pattern: serializer.fromJson<String?>(json['pattern']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'subType': serializer.toJson<String?>(subType),
      'colour': serializer.toJson<String?>(colour),
      'secondaryColour': serializer.toJson<String?>(secondaryColour),
      'season': serializer.toJson<String?>(season),
      'size': serializer.toJson<String?>(size),
      'imagePath': serializer.toJson<String?>(imagePath),
      'brand': serializer.toJson<String?>(brand),
      'description': serializer.toJson<String?>(description),
      'isFavourite': serializer.toJson<bool>(isFavourite),
      'isBorrowed': serializer.toJson<bool>(isBorrowed),
      'isVisible': serializer.toJson<bool>(isVisible),
      'wardrobeId': serializer.toJson<int?>(wardrobeId),
      'sleeveLength': serializer.toJson<String?>(sleeveLength),
      'fabricType': serializer.toJson<String?>(fabricType),
      'pattern': serializer.toJson<String?>(pattern),
    };
  }

  Item copyWith({
    int? id,
    String? name,
    String? type,
    Value<String?> subType = const Value.absent(),
    Value<String?> colour = const Value.absent(),
    Value<String?> secondaryColour = const Value.absent(),
    Value<String?> season = const Value.absent(),
    Value<String?> size = const Value.absent(),
    Value<String?> imagePath = const Value.absent(),
    Value<String?> brand = const Value.absent(),
    Value<String?> description = const Value.absent(),
    bool? isFavourite,
    bool? isBorrowed,
    bool? isVisible,
    Value<int?> wardrobeId = const Value.absent(),
    Value<String?> sleeveLength = const Value.absent(),
    Value<String?> fabricType = const Value.absent(),
    Value<String?> pattern = const Value.absent(),
  }) => Item(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    subType: subType.present ? subType.value : this.subType,
    colour: colour.present ? colour.value : this.colour,
    secondaryColour: secondaryColour.present
        ? secondaryColour.value
        : this.secondaryColour,
    season: season.present ? season.value : this.season,
    size: size.present ? size.value : this.size,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    brand: brand.present ? brand.value : this.brand,
    description: description.present ? description.value : this.description,
    isFavourite: isFavourite ?? this.isFavourite,
    isBorrowed: isBorrowed ?? this.isBorrowed,
    isVisible: isVisible ?? this.isVisible,
    wardrobeId: wardrobeId.present ? wardrobeId.value : this.wardrobeId,
    sleeveLength: sleeveLength.present ? sleeveLength.value : this.sleeveLength,
    fabricType: fabricType.present ? fabricType.value : this.fabricType,
    pattern: pattern.present ? pattern.value : this.pattern,
  );
  Item copyWithCompanion(ItemsCompanion data) {
    return Item(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      subType: data.subType.present ? data.subType.value : this.subType,
      colour: data.colour.present ? data.colour.value : this.colour,
      secondaryColour: data.secondaryColour.present
          ? data.secondaryColour.value
          : this.secondaryColour,
      season: data.season.present ? data.season.value : this.season,
      size: data.size.present ? data.size.value : this.size,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      brand: data.brand.present ? data.brand.value : this.brand,
      description: data.description.present
          ? data.description.value
          : this.description,
      isFavourite: data.isFavourite.present
          ? data.isFavourite.value
          : this.isFavourite,
      isBorrowed: data.isBorrowed.present
          ? data.isBorrowed.value
          : this.isBorrowed,
      isVisible: data.isVisible.present ? data.isVisible.value : this.isVisible,
      wardrobeId: data.wardrobeId.present
          ? data.wardrobeId.value
          : this.wardrobeId,
      sleeveLength: data.sleeveLength.present
          ? data.sleeveLength.value
          : this.sleeveLength,
      fabricType: data.fabricType.present
          ? data.fabricType.value
          : this.fabricType,
      pattern: data.pattern.present ? data.pattern.value : this.pattern,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Item(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('subType: $subType, ')
          ..write('colour: $colour, ')
          ..write('secondaryColour: $secondaryColour, ')
          ..write('season: $season, ')
          ..write('size: $size, ')
          ..write('imagePath: $imagePath, ')
          ..write('brand: $brand, ')
          ..write('description: $description, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('isBorrowed: $isBorrowed, ')
          ..write('isVisible: $isVisible, ')
          ..write('wardrobeId: $wardrobeId, ')
          ..write('sleeveLength: $sleeveLength, ')
          ..write('fabricType: $fabricType, ')
          ..write('pattern: $pattern')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    type,
    subType,
    colour,
    secondaryColour,
    season,
    size,
    imagePath,
    brand,
    description,
    isFavourite,
    isBorrowed,
    isVisible,
    wardrobeId,
    sleeveLength,
    fabricType,
    pattern,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.subType == this.subType &&
          other.colour == this.colour &&
          other.secondaryColour == this.secondaryColour &&
          other.season == this.season &&
          other.size == this.size &&
          other.imagePath == this.imagePath &&
          other.brand == this.brand &&
          other.description == this.description &&
          other.isFavourite == this.isFavourite &&
          other.isBorrowed == this.isBorrowed &&
          other.isVisible == this.isVisible &&
          other.wardrobeId == this.wardrobeId &&
          other.sleeveLength == this.sleeveLength &&
          other.fabricType == this.fabricType &&
          other.pattern == this.pattern);
}

class ItemsCompanion extends UpdateCompanion<Item> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  final Value<String?> subType;
  final Value<String?> colour;
  final Value<String?> secondaryColour;
  final Value<String?> season;
  final Value<String?> size;
  final Value<String?> imagePath;
  final Value<String?> brand;
  final Value<String?> description;
  final Value<bool> isFavourite;
  final Value<bool> isBorrowed;
  final Value<bool> isVisible;
  final Value<int?> wardrobeId;
  final Value<String?> sleeveLength;
  final Value<String?> fabricType;
  final Value<String?> pattern;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.subType = const Value.absent(),
    this.colour = const Value.absent(),
    this.secondaryColour = const Value.absent(),
    this.season = const Value.absent(),
    this.size = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.brand = const Value.absent(),
    this.description = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.isBorrowed = const Value.absent(),
    this.isVisible = const Value.absent(),
    this.wardrobeId = const Value.absent(),
    this.sleeveLength = const Value.absent(),
    this.fabricType = const Value.absent(),
    this.pattern = const Value.absent(),
  });
  ItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String type,
    this.subType = const Value.absent(),
    this.colour = const Value.absent(),
    this.secondaryColour = const Value.absent(),
    this.season = const Value.absent(),
    this.size = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.brand = const Value.absent(),
    this.description = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.isBorrowed = const Value.absent(),
    this.isVisible = const Value.absent(),
    this.wardrobeId = const Value.absent(),
    this.sleeveLength = const Value.absent(),
    this.fabricType = const Value.absent(),
    this.pattern = const Value.absent(),
  }) : name = Value(name),
       type = Value(type);
  static Insertable<Item> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? subType,
    Expression<String>? colour,
    Expression<String>? secondaryColour,
    Expression<String>? season,
    Expression<String>? size,
    Expression<String>? imagePath,
    Expression<String>? brand,
    Expression<String>? description,
    Expression<bool>? isFavourite,
    Expression<bool>? isBorrowed,
    Expression<bool>? isVisible,
    Expression<int>? wardrobeId,
    Expression<String>? sleeveLength,
    Expression<String>? fabricType,
    Expression<String>? pattern,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (subType != null) 'sub_type': subType,
      if (colour != null) 'colour': colour,
      if (secondaryColour != null) 'secondary_colour': secondaryColour,
      if (season != null) 'season': season,
      if (size != null) 'size': size,
      if (imagePath != null) 'image_path': imagePath,
      if (brand != null) 'brand': brand,
      if (description != null) 'description': description,
      if (isFavourite != null) 'is_favourite': isFavourite,
      if (isBorrowed != null) 'is_borrowed': isBorrowed,
      if (isVisible != null) 'is_visible': isVisible,
      if (wardrobeId != null) 'wardrobe_id': wardrobeId,
      if (sleeveLength != null) 'sleeve_length': sleeveLength,
      if (fabricType != null) 'fabric_type': fabricType,
      if (pattern != null) 'pattern': pattern,
    });
  }

  ItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? type,
    Value<String?>? subType,
    Value<String?>? colour,
    Value<String?>? secondaryColour,
    Value<String?>? season,
    Value<String?>? size,
    Value<String?>? imagePath,
    Value<String?>? brand,
    Value<String?>? description,
    Value<bool>? isFavourite,
    Value<bool>? isBorrowed,
    Value<bool>? isVisible,
    Value<int?>? wardrobeId,
    Value<String?>? sleeveLength,
    Value<String?>? fabricType,
    Value<String?>? pattern,
  }) {
    return ItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      subType: subType ?? this.subType,
      colour: colour ?? this.colour,
      secondaryColour: secondaryColour ?? this.secondaryColour,
      season: season ?? this.season,
      size: size ?? this.size,
      imagePath: imagePath ?? this.imagePath,
      brand: brand ?? this.brand,
      description: description ?? this.description,
      isFavourite: isFavourite ?? this.isFavourite,
      isBorrowed: isBorrowed ?? this.isBorrowed,
      isVisible: isVisible ?? this.isVisible,
      wardrobeId: wardrobeId ?? this.wardrobeId,
      sleeveLength: sleeveLength ?? this.sleeveLength,
      fabricType: fabricType ?? this.fabricType,
      pattern: pattern ?? this.pattern,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (subType.present) {
      map['sub_type'] = Variable<String>(subType.value);
    }
    if (colour.present) {
      map['colour'] = Variable<String>(colour.value);
    }
    if (secondaryColour.present) {
      map['secondary_colour'] = Variable<String>(secondaryColour.value);
    }
    if (season.present) {
      map['season'] = Variable<String>(season.value);
    }
    if (size.present) {
      map['size'] = Variable<String>(size.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isFavourite.present) {
      map['is_favourite'] = Variable<bool>(isFavourite.value);
    }
    if (isBorrowed.present) {
      map['is_borrowed'] = Variable<bool>(isBorrowed.value);
    }
    if (isVisible.present) {
      map['is_visible'] = Variable<bool>(isVisible.value);
    }
    if (wardrobeId.present) {
      map['wardrobe_id'] = Variable<int>(wardrobeId.value);
    }
    if (sleeveLength.present) {
      map['sleeve_length'] = Variable<String>(sleeveLength.value);
    }
    if (fabricType.present) {
      map['fabric_type'] = Variable<String>(fabricType.value);
    }
    if (pattern.present) {
      map['pattern'] = Variable<String>(pattern.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('subType: $subType, ')
          ..write('colour: $colour, ')
          ..write('secondaryColour: $secondaryColour, ')
          ..write('season: $season, ')
          ..write('size: $size, ')
          ..write('imagePath: $imagePath, ')
          ..write('brand: $brand, ')
          ..write('description: $description, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('isBorrowed: $isBorrowed, ')
          ..write('isVisible: $isVisible, ')
          ..write('wardrobeId: $wardrobeId, ')
          ..write('sleeveLength: $sleeveLength, ')
          ..write('fabricType: $fabricType, ')
          ..write('pattern: $pattern')
          ..write(')'))
        .toString();
  }
}

class $LoansTable extends Loans with TableInfo<$LoansTable, Loan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES items (id)',
    ),
  );
  static const VerificationMeta _borrowerNameMeta = const VerificationMeta(
    'borrowerName',
  );
  @override
  late final GeneratedColumn<String> borrowerName = GeneratedColumn<String>(
    'borrower_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateLoanedMeta = const VerificationMeta(
    'dateLoaned',
  );
  @override
  late final GeneratedColumn<DateTime> dateLoaned = GeneratedColumn<DateTime>(
    'date_loaned',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateReturnedMeta = const VerificationMeta(
    'dateReturned',
  );
  @override
  late final GeneratedColumn<DateTime> dateReturned = GeneratedColumn<DateTime>(
    'date_returned',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expectedReturnDateMeta =
      const VerificationMeta('expectedReturnDate');
  @override
  late final GeneratedColumn<DateTime> expectedReturnDate =
      GeneratedColumn<DateTime>(
        'expected_return_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _isReturnedMeta = const VerificationMeta(
    'isReturned',
  );
  @override
  late final GeneratedColumn<bool> isReturned = GeneratedColumn<bool>(
    'is_returned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_returned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    itemId,
    borrowerName,
    dateLoaned,
    dateReturned,
    expectedReturnDate,
    isReturned,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loans';
  @override
  VerificationContext validateIntegrity(
    Insertable<Loan> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('borrower_name')) {
      context.handle(
        _borrowerNameMeta,
        borrowerName.isAcceptableOrUnknown(
          data['borrower_name']!,
          _borrowerNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_borrowerNameMeta);
    }
    if (data.containsKey('date_loaned')) {
      context.handle(
        _dateLoanedMeta,
        dateLoaned.isAcceptableOrUnknown(data['date_loaned']!, _dateLoanedMeta),
      );
    } else if (isInserting) {
      context.missing(_dateLoanedMeta);
    }
    if (data.containsKey('date_returned')) {
      context.handle(
        _dateReturnedMeta,
        dateReturned.isAcceptableOrUnknown(
          data['date_returned']!,
          _dateReturnedMeta,
        ),
      );
    }
    if (data.containsKey('expected_return_date')) {
      context.handle(
        _expectedReturnDateMeta,
        expectedReturnDate.isAcceptableOrUnknown(
          data['expected_return_date']!,
          _expectedReturnDateMeta,
        ),
      );
    }
    if (data.containsKey('is_returned')) {
      context.handle(
        _isReturnedMeta,
        isReturned.isAcceptableOrUnknown(data['is_returned']!, _isReturnedMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Loan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Loan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}item_id'],
      )!,
      borrowerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}borrower_name'],
      )!,
      dateLoaned: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_loaned'],
      )!,
      dateReturned: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_returned'],
      ),
      expectedReturnDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expected_return_date'],
      ),
      isReturned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_returned'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $LoansTable createAlias(String alias) {
    return $LoansTable(attachedDatabase, alias);
  }
}

class Loan extends DataClass implements Insertable<Loan> {
  final int id;
  final int itemId;
  final String borrowerName;
  final DateTime dateLoaned;
  final DateTime? dateReturned;
  final DateTime? expectedReturnDate;
  final bool isReturned;
  final String? notes;
  const Loan({
    required this.id,
    required this.itemId,
    required this.borrowerName,
    required this.dateLoaned,
    this.dateReturned,
    this.expectedReturnDate,
    required this.isReturned,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_id'] = Variable<int>(itemId);
    map['borrower_name'] = Variable<String>(borrowerName);
    map['date_loaned'] = Variable<DateTime>(dateLoaned);
    if (!nullToAbsent || dateReturned != null) {
      map['date_returned'] = Variable<DateTime>(dateReturned);
    }
    if (!nullToAbsent || expectedReturnDate != null) {
      map['expected_return_date'] = Variable<DateTime>(expectedReturnDate);
    }
    map['is_returned'] = Variable<bool>(isReturned);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  LoansCompanion toCompanion(bool nullToAbsent) {
    return LoansCompanion(
      id: Value(id),
      itemId: Value(itemId),
      borrowerName: Value(borrowerName),
      dateLoaned: Value(dateLoaned),
      dateReturned: dateReturned == null && nullToAbsent
          ? const Value.absent()
          : Value(dateReturned),
      expectedReturnDate: expectedReturnDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedReturnDate),
      isReturned: Value(isReturned),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Loan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Loan(
      id: serializer.fromJson<int>(json['id']),
      itemId: serializer.fromJson<int>(json['itemId']),
      borrowerName: serializer.fromJson<String>(json['borrowerName']),
      dateLoaned: serializer.fromJson<DateTime>(json['dateLoaned']),
      dateReturned: serializer.fromJson<DateTime?>(json['dateReturned']),
      expectedReturnDate: serializer.fromJson<DateTime?>(
        json['expectedReturnDate'],
      ),
      isReturned: serializer.fromJson<bool>(json['isReturned']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemId': serializer.toJson<int>(itemId),
      'borrowerName': serializer.toJson<String>(borrowerName),
      'dateLoaned': serializer.toJson<DateTime>(dateLoaned),
      'dateReturned': serializer.toJson<DateTime?>(dateReturned),
      'expectedReturnDate': serializer.toJson<DateTime?>(expectedReturnDate),
      'isReturned': serializer.toJson<bool>(isReturned),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Loan copyWith({
    int? id,
    int? itemId,
    String? borrowerName,
    DateTime? dateLoaned,
    Value<DateTime?> dateReturned = const Value.absent(),
    Value<DateTime?> expectedReturnDate = const Value.absent(),
    bool? isReturned,
    Value<String?> notes = const Value.absent(),
  }) => Loan(
    id: id ?? this.id,
    itemId: itemId ?? this.itemId,
    borrowerName: borrowerName ?? this.borrowerName,
    dateLoaned: dateLoaned ?? this.dateLoaned,
    dateReturned: dateReturned.present ? dateReturned.value : this.dateReturned,
    expectedReturnDate: expectedReturnDate.present
        ? expectedReturnDate.value
        : this.expectedReturnDate,
    isReturned: isReturned ?? this.isReturned,
    notes: notes.present ? notes.value : this.notes,
  );
  Loan copyWithCompanion(LoansCompanion data) {
    return Loan(
      id: data.id.present ? data.id.value : this.id,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      borrowerName: data.borrowerName.present
          ? data.borrowerName.value
          : this.borrowerName,
      dateLoaned: data.dateLoaned.present
          ? data.dateLoaned.value
          : this.dateLoaned,
      dateReturned: data.dateReturned.present
          ? data.dateReturned.value
          : this.dateReturned,
      expectedReturnDate: data.expectedReturnDate.present
          ? data.expectedReturnDate.value
          : this.expectedReturnDate,
      isReturned: data.isReturned.present
          ? data.isReturned.value
          : this.isReturned,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Loan(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('borrowerName: $borrowerName, ')
          ..write('dateLoaned: $dateLoaned, ')
          ..write('dateReturned: $dateReturned, ')
          ..write('expectedReturnDate: $expectedReturnDate, ')
          ..write('isReturned: $isReturned, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    itemId,
    borrowerName,
    dateLoaned,
    dateReturned,
    expectedReturnDate,
    isReturned,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Loan &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.borrowerName == this.borrowerName &&
          other.dateLoaned == this.dateLoaned &&
          other.dateReturned == this.dateReturned &&
          other.expectedReturnDate == this.expectedReturnDate &&
          other.isReturned == this.isReturned &&
          other.notes == this.notes);
}

class LoansCompanion extends UpdateCompanion<Loan> {
  final Value<int> id;
  final Value<int> itemId;
  final Value<String> borrowerName;
  final Value<DateTime> dateLoaned;
  final Value<DateTime?> dateReturned;
  final Value<DateTime?> expectedReturnDate;
  final Value<bool> isReturned;
  final Value<String?> notes;
  const LoansCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.borrowerName = const Value.absent(),
    this.dateLoaned = const Value.absent(),
    this.dateReturned = const Value.absent(),
    this.expectedReturnDate = const Value.absent(),
    this.isReturned = const Value.absent(),
    this.notes = const Value.absent(),
  });
  LoansCompanion.insert({
    this.id = const Value.absent(),
    required int itemId,
    required String borrowerName,
    required DateTime dateLoaned,
    this.dateReturned = const Value.absent(),
    this.expectedReturnDate = const Value.absent(),
    this.isReturned = const Value.absent(),
    this.notes = const Value.absent(),
  }) : itemId = Value(itemId),
       borrowerName = Value(borrowerName),
       dateLoaned = Value(dateLoaned);
  static Insertable<Loan> custom({
    Expression<int>? id,
    Expression<int>? itemId,
    Expression<String>? borrowerName,
    Expression<DateTime>? dateLoaned,
    Expression<DateTime>? dateReturned,
    Expression<DateTime>? expectedReturnDate,
    Expression<bool>? isReturned,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (borrowerName != null) 'borrower_name': borrowerName,
      if (dateLoaned != null) 'date_loaned': dateLoaned,
      if (dateReturned != null) 'date_returned': dateReturned,
      if (expectedReturnDate != null)
        'expected_return_date': expectedReturnDate,
      if (isReturned != null) 'is_returned': isReturned,
      if (notes != null) 'notes': notes,
    });
  }

  LoansCompanion copyWith({
    Value<int>? id,
    Value<int>? itemId,
    Value<String>? borrowerName,
    Value<DateTime>? dateLoaned,
    Value<DateTime?>? dateReturned,
    Value<DateTime?>? expectedReturnDate,
    Value<bool>? isReturned,
    Value<String?>? notes,
  }) {
    return LoansCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      borrowerName: borrowerName ?? this.borrowerName,
      dateLoaned: dateLoaned ?? this.dateLoaned,
      dateReturned: dateReturned ?? this.dateReturned,
      expectedReturnDate: expectedReturnDate ?? this.expectedReturnDate,
      isReturned: isReturned ?? this.isReturned,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (borrowerName.present) {
      map['borrower_name'] = Variable<String>(borrowerName.value);
    }
    if (dateLoaned.present) {
      map['date_loaned'] = Variable<DateTime>(dateLoaned.value);
    }
    if (dateReturned.present) {
      map['date_returned'] = Variable<DateTime>(dateReturned.value);
    }
    if (expectedReturnDate.present) {
      map['expected_return_date'] = Variable<DateTime>(
        expectedReturnDate.value,
      );
    }
    if (isReturned.present) {
      map['is_returned'] = Variable<bool>(isReturned.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoansCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('borrowerName: $borrowerName, ')
          ..write('dateLoaned: $dateLoaned, ')
          ..write('dateReturned: $dateReturned, ')
          ..write('expectedReturnDate: $expectedReturnDate, ')
          ..write('isReturned: $isReturned, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $WardrobesTable extends Wardrobes
    with TableInfo<$WardrobesTable, Wardrobe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WardrobesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFavouriteMeta = const VerificationMeta(
    'isFavourite',
  );
  @override
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
    'is_favourite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favourite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isAutoFavouritesMeta = const VerificationMeta(
    'isAutoFavourites',
  );
  @override
  late final GeneratedColumn<bool> isAutoFavourites = GeneratedColumn<bool>(
    'is_auto_favourites',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_auto_favourites" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    location,
    imageUrl,
    isFavourite,
    isAutoFavourites,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wardrobes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Wardrobe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('is_favourite')) {
      context.handle(
        _isFavouriteMeta,
        isFavourite.isAcceptableOrUnknown(
          data['is_favourite']!,
          _isFavouriteMeta,
        ),
      );
    }
    if (data.containsKey('is_auto_favourites')) {
      context.handle(
        _isAutoFavouritesMeta,
        isAutoFavourites.isAcceptableOrUnknown(
          data['is_auto_favourites']!,
          _isAutoFavouritesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Wardrobe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Wardrobe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      isFavourite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favourite'],
      )!,
      isAutoFavourites: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_auto_favourites'],
      )!,
    );
  }

  @override
  $WardrobesTable createAlias(String alias) {
    return $WardrobesTable(attachedDatabase, alias);
  }
}

class Wardrobe extends DataClass implements Insertable<Wardrobe> {
  final int id;
  final String name;
  final String? description;
  final String? location;
  final String? imageUrl;
  final bool isFavourite;
  final bool isAutoFavourites;
  const Wardrobe({
    required this.id,
    required this.name,
    this.description,
    this.location,
    this.imageUrl,
    required this.isFavourite,
    required this.isAutoFavourites,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['is_favourite'] = Variable<bool>(isFavourite);
    map['is_auto_favourites'] = Variable<bool>(isAutoFavourites);
    return map;
  }

  WardrobesCompanion toCompanion(bool nullToAbsent) {
    return WardrobesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      isFavourite: Value(isFavourite),
      isAutoFavourites: Value(isAutoFavourites),
    );
  }

  factory Wardrobe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Wardrobe(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      location: serializer.fromJson<String?>(json['location']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      isFavourite: serializer.fromJson<bool>(json['isFavourite']),
      isAutoFavourites: serializer.fromJson<bool>(json['isAutoFavourites']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'location': serializer.toJson<String?>(location),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'isFavourite': serializer.toJson<bool>(isFavourite),
      'isAutoFavourites': serializer.toJson<bool>(isAutoFavourites),
    };
  }

  Wardrobe copyWith({
    int? id,
    String? name,
    Value<String?> description = const Value.absent(),
    Value<String?> location = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    bool? isFavourite,
    bool? isAutoFavourites,
  }) => Wardrobe(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    location: location.present ? location.value : this.location,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    isFavourite: isFavourite ?? this.isFavourite,
    isAutoFavourites: isAutoFavourites ?? this.isAutoFavourites,
  );
  Wardrobe copyWithCompanion(WardrobesCompanion data) {
    return Wardrobe(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      location: data.location.present ? data.location.value : this.location,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      isFavourite: data.isFavourite.present
          ? data.isFavourite.value
          : this.isFavourite,
      isAutoFavourites: data.isAutoFavourites.present
          ? data.isAutoFavourites.value
          : this.isAutoFavourites,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Wardrobe(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('location: $location, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('isAutoFavourites: $isAutoFavourites')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    location,
    imageUrl,
    isFavourite,
    isAutoFavourites,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Wardrobe &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.location == this.location &&
          other.imageUrl == this.imageUrl &&
          other.isFavourite == this.isFavourite &&
          other.isAutoFavourites == this.isAutoFavourites);
}

class WardrobesCompanion extends UpdateCompanion<Wardrobe> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> location;
  final Value<String?> imageUrl;
  final Value<bool> isFavourite;
  final Value<bool> isAutoFavourites;
  const WardrobesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.location = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.isAutoFavourites = const Value.absent(),
  });
  WardrobesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.location = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.isAutoFavourites = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Wardrobe> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? location,
    Expression<String>? imageUrl,
    Expression<bool>? isFavourite,
    Expression<bool>? isAutoFavourites,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (location != null) 'location': location,
      if (imageUrl != null) 'image_url': imageUrl,
      if (isFavourite != null) 'is_favourite': isFavourite,
      if (isAutoFavourites != null) 'is_auto_favourites': isAutoFavourites,
    });
  }

  WardrobesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String?>? location,
    Value<String?>? imageUrl,
    Value<bool>? isFavourite,
    Value<bool>? isAutoFavourites,
  }) {
    return WardrobesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavourite: isFavourite ?? this.isFavourite,
      isAutoFavourites: isAutoFavourites ?? this.isAutoFavourites,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (isFavourite.present) {
      map['is_favourite'] = Variable<bool>(isFavourite.value);
    }
    if (isAutoFavourites.present) {
      map['is_auto_favourites'] = Variable<bool>(isAutoFavourites.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WardrobesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('location: $location, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('isAutoFavourites: $isAutoFavourites')
          ..write(')'))
        .toString();
  }
}

abstract class _$ClosetDatabase extends GeneratedDatabase {
  _$ClosetDatabase(QueryExecutor e) : super(e);
  $ClosetDatabaseManager get managers => $ClosetDatabaseManager(this);
  late final $ItemsTable items = $ItemsTable(this);
  late final $LoansTable loans = $LoansTable(this);
  late final $WardrobesTable wardrobes = $WardrobesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [items, loans, wardrobes];
}

typedef $$ItemsTableCreateCompanionBuilder =
    ItemsCompanion Function({
      Value<int> id,
      required String name,
      required String type,
      Value<String?> subType,
      Value<String?> colour,
      Value<String?> secondaryColour,
      Value<String?> season,
      Value<String?> size,
      Value<String?> imagePath,
      Value<String?> brand,
      Value<String?> description,
      Value<bool> isFavourite,
      Value<bool> isBorrowed,
      Value<bool> isVisible,
      Value<int?> wardrobeId,
      Value<String?> sleeveLength,
      Value<String?> fabricType,
      Value<String?> pattern,
    });
typedef $$ItemsTableUpdateCompanionBuilder =
    ItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> type,
      Value<String?> subType,
      Value<String?> colour,
      Value<String?> secondaryColour,
      Value<String?> season,
      Value<String?> size,
      Value<String?> imagePath,
      Value<String?> brand,
      Value<String?> description,
      Value<bool> isFavourite,
      Value<bool> isBorrowed,
      Value<bool> isVisible,
      Value<int?> wardrobeId,
      Value<String?> sleeveLength,
      Value<String?> fabricType,
      Value<String?> pattern,
    });

final class $$ItemsTableReferences
    extends BaseReferences<_$ClosetDatabase, $ItemsTable, Item> {
  $$ItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LoansTable, List<Loan>> _loansRefsTable(
    _$ClosetDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.loans,
    aliasName: $_aliasNameGenerator(db.items.id, db.loans.itemId),
  );

  $$LoansTableProcessedTableManager get loansRefs {
    final manager = $$LoansTableTableManager(
      $_db,
      $_db.loans,
    ).filter((f) => f.itemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_loansRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ItemsTableFilterComposer
    extends Composer<_$ClosetDatabase, $ItemsTable> {
  $$ItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subType => $composableBuilder(
    column: $table.subType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colour => $composableBuilder(
    column: $table.colour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get secondaryColour => $composableBuilder(
    column: $table.secondaryColour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get season => $composableBuilder(
    column: $table.season,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavourite => $composableBuilder(
    column: $table.isFavourite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBorrowed => $composableBuilder(
    column: $table.isBorrowed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isVisible => $composableBuilder(
    column: $table.isVisible,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wardrobeId => $composableBuilder(
    column: $table.wardrobeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sleeveLength => $composableBuilder(
    column: $table.sleeveLength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fabricType => $composableBuilder(
    column: $table.fabricType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pattern => $composableBuilder(
    column: $table.pattern,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> loansRefs(
    Expression<bool> Function($$LoansTableFilterComposer f) f,
  ) {
    final $$LoansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.loans,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoansTableFilterComposer(
            $db: $db,
            $table: $db.loans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ItemsTableOrderingComposer
    extends Composer<_$ClosetDatabase, $ItemsTable> {
  $$ItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subType => $composableBuilder(
    column: $table.subType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colour => $composableBuilder(
    column: $table.colour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get secondaryColour => $composableBuilder(
    column: $table.secondaryColour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get season => $composableBuilder(
    column: $table.season,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavourite => $composableBuilder(
    column: $table.isFavourite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBorrowed => $composableBuilder(
    column: $table.isBorrowed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isVisible => $composableBuilder(
    column: $table.isVisible,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wardrobeId => $composableBuilder(
    column: $table.wardrobeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sleeveLength => $composableBuilder(
    column: $table.sleeveLength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fabricType => $composableBuilder(
    column: $table.fabricType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pattern => $composableBuilder(
    column: $table.pattern,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItemsTableAnnotationComposer
    extends Composer<_$ClosetDatabase, $ItemsTable> {
  $$ItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get subType =>
      $composableBuilder(column: $table.subType, builder: (column) => column);

  GeneratedColumn<String> get colour =>
      $composableBuilder(column: $table.colour, builder: (column) => column);

  GeneratedColumn<String> get secondaryColour => $composableBuilder(
    column: $table.secondaryColour,
    builder: (column) => column,
  );

  GeneratedColumn<String> get season =>
      $composableBuilder(column: $table.season, builder: (column) => column);

  GeneratedColumn<String> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isFavourite => $composableBuilder(
    column: $table.isFavourite,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isBorrowed => $composableBuilder(
    column: $table.isBorrowed,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isVisible =>
      $composableBuilder(column: $table.isVisible, builder: (column) => column);

  GeneratedColumn<int> get wardrobeId => $composableBuilder(
    column: $table.wardrobeId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sleeveLength => $composableBuilder(
    column: $table.sleeveLength,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fabricType => $composableBuilder(
    column: $table.fabricType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pattern =>
      $composableBuilder(column: $table.pattern, builder: (column) => column);

  Expression<T> loansRefs<T extends Object>(
    Expression<T> Function($$LoansTableAnnotationComposer a) f,
  ) {
    final $$LoansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.loans,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoansTableAnnotationComposer(
            $db: $db,
            $table: $db.loans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ItemsTableTableManager
    extends
        RootTableManager<
          _$ClosetDatabase,
          $ItemsTable,
          Item,
          $$ItemsTableFilterComposer,
          $$ItemsTableOrderingComposer,
          $$ItemsTableAnnotationComposer,
          $$ItemsTableCreateCompanionBuilder,
          $$ItemsTableUpdateCompanionBuilder,
          (Item, $$ItemsTableReferences),
          Item,
          PrefetchHooks Function({bool loansRefs})
        > {
  $$ItemsTableTableManager(_$ClosetDatabase db, $ItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> subType = const Value.absent(),
                Value<String?> colour = const Value.absent(),
                Value<String?> secondaryColour = const Value.absent(),
                Value<String?> season = const Value.absent(),
                Value<String?> size = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isFavourite = const Value.absent(),
                Value<bool> isBorrowed = const Value.absent(),
                Value<bool> isVisible = const Value.absent(),
                Value<int?> wardrobeId = const Value.absent(),
                Value<String?> sleeveLength = const Value.absent(),
                Value<String?> fabricType = const Value.absent(),
                Value<String?> pattern = const Value.absent(),
              }) => ItemsCompanion(
                id: id,
                name: name,
                type: type,
                subType: subType,
                colour: colour,
                secondaryColour: secondaryColour,
                season: season,
                size: size,
                imagePath: imagePath,
                brand: brand,
                description: description,
                isFavourite: isFavourite,
                isBorrowed: isBorrowed,
                isVisible: isVisible,
                wardrobeId: wardrobeId,
                sleeveLength: sleeveLength,
                fabricType: fabricType,
                pattern: pattern,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String type,
                Value<String?> subType = const Value.absent(),
                Value<String?> colour = const Value.absent(),
                Value<String?> secondaryColour = const Value.absent(),
                Value<String?> season = const Value.absent(),
                Value<String?> size = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isFavourite = const Value.absent(),
                Value<bool> isBorrowed = const Value.absent(),
                Value<bool> isVisible = const Value.absent(),
                Value<int?> wardrobeId = const Value.absent(),
                Value<String?> sleeveLength = const Value.absent(),
                Value<String?> fabricType = const Value.absent(),
                Value<String?> pattern = const Value.absent(),
              }) => ItemsCompanion.insert(
                id: id,
                name: name,
                type: type,
                subType: subType,
                colour: colour,
                secondaryColour: secondaryColour,
                season: season,
                size: size,
                imagePath: imagePath,
                brand: brand,
                description: description,
                isFavourite: isFavourite,
                isBorrowed: isBorrowed,
                isVisible: isVisible,
                wardrobeId: wardrobeId,
                sleeveLength: sleeveLength,
                fabricType: fabricType,
                pattern: pattern,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$ItemsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({loansRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (loansRefs) db.loans],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (loansRefs)
                    await $_getPrefetchedData<Item, $ItemsTable, Loan>(
                      currentTable: table,
                      referencedTable: $$ItemsTableReferences._loansRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$ItemsTableReferences(db, table, p0).loansRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.itemId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$ClosetDatabase,
      $ItemsTable,
      Item,
      $$ItemsTableFilterComposer,
      $$ItemsTableOrderingComposer,
      $$ItemsTableAnnotationComposer,
      $$ItemsTableCreateCompanionBuilder,
      $$ItemsTableUpdateCompanionBuilder,
      (Item, $$ItemsTableReferences),
      Item,
      PrefetchHooks Function({bool loansRefs})
    >;
typedef $$LoansTableCreateCompanionBuilder =
    LoansCompanion Function({
      Value<int> id,
      required int itemId,
      required String borrowerName,
      required DateTime dateLoaned,
      Value<DateTime?> dateReturned,
      Value<DateTime?> expectedReturnDate,
      Value<bool> isReturned,
      Value<String?> notes,
    });
typedef $$LoansTableUpdateCompanionBuilder =
    LoansCompanion Function({
      Value<int> id,
      Value<int> itemId,
      Value<String> borrowerName,
      Value<DateTime> dateLoaned,
      Value<DateTime?> dateReturned,
      Value<DateTime?> expectedReturnDate,
      Value<bool> isReturned,
      Value<String?> notes,
    });

final class $$LoansTableReferences
    extends BaseReferences<_$ClosetDatabase, $LoansTable, Loan> {
  $$LoansTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ItemsTable _itemIdTable(_$ClosetDatabase db) =>
      db.items.createAlias($_aliasNameGenerator(db.loans.itemId, db.items.id));

  $$ItemsTableProcessedTableManager get itemId {
    final $_column = $_itemColumn<int>('item_id')!;

    final manager = $$ItemsTableTableManager(
      $_db,
      $_db.items,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LoansTableFilterComposer
    extends Composer<_$ClosetDatabase, $LoansTable> {
  $$LoansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get borrowerName => $composableBuilder(
    column: $table.borrowerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateLoaned => $composableBuilder(
    column: $table.dateLoaned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateReturned => $composableBuilder(
    column: $table.dateReturned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expectedReturnDate => $composableBuilder(
    column: $table.expectedReturnDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isReturned => $composableBuilder(
    column: $table.isReturned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$ItemsTableFilterComposer get itemId {
    final $$ItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.items,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsTableFilterComposer(
            $db: $db,
            $table: $db.items,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoansTableOrderingComposer
    extends Composer<_$ClosetDatabase, $LoansTable> {
  $$LoansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get borrowerName => $composableBuilder(
    column: $table.borrowerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateLoaned => $composableBuilder(
    column: $table.dateLoaned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateReturned => $composableBuilder(
    column: $table.dateReturned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expectedReturnDate => $composableBuilder(
    column: $table.expectedReturnDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isReturned => $composableBuilder(
    column: $table.isReturned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$ItemsTableOrderingComposer get itemId {
    final $$ItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.items,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsTableOrderingComposer(
            $db: $db,
            $table: $db.items,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoansTableAnnotationComposer
    extends Composer<_$ClosetDatabase, $LoansTable> {
  $$LoansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get borrowerName => $composableBuilder(
    column: $table.borrowerName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateLoaned => $composableBuilder(
    column: $table.dateLoaned,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateReturned => $composableBuilder(
    column: $table.dateReturned,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get expectedReturnDate => $composableBuilder(
    column: $table.expectedReturnDate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isReturned => $composableBuilder(
    column: $table.isReturned,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$ItemsTableAnnotationComposer get itemId {
    final $$ItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.items,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.items,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LoansTableTableManager
    extends
        RootTableManager<
          _$ClosetDatabase,
          $LoansTable,
          Loan,
          $$LoansTableFilterComposer,
          $$LoansTableOrderingComposer,
          $$LoansTableAnnotationComposer,
          $$LoansTableCreateCompanionBuilder,
          $$LoansTableUpdateCompanionBuilder,
          (Loan, $$LoansTableReferences),
          Loan,
          PrefetchHooks Function({bool itemId})
        > {
  $$LoansTableTableManager(_$ClosetDatabase db, $LoansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LoansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> itemId = const Value.absent(),
                Value<String> borrowerName = const Value.absent(),
                Value<DateTime> dateLoaned = const Value.absent(),
                Value<DateTime?> dateReturned = const Value.absent(),
                Value<DateTime?> expectedReturnDate = const Value.absent(),
                Value<bool> isReturned = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => LoansCompanion(
                id: id,
                itemId: itemId,
                borrowerName: borrowerName,
                dateLoaned: dateLoaned,
                dateReturned: dateReturned,
                expectedReturnDate: expectedReturnDate,
                isReturned: isReturned,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int itemId,
                required String borrowerName,
                required DateTime dateLoaned,
                Value<DateTime?> dateReturned = const Value.absent(),
                Value<DateTime?> expectedReturnDate = const Value.absent(),
                Value<bool> isReturned = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => LoansCompanion.insert(
                id: id,
                itemId: itemId,
                borrowerName: borrowerName,
                dateLoaned: dateLoaned,
                dateReturned: dateReturned,
                expectedReturnDate: expectedReturnDate,
                isReturned: isReturned,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$LoansTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({itemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (itemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.itemId,
                                referencedTable: $$LoansTableReferences
                                    ._itemIdTable(db),
                                referencedColumn: $$LoansTableReferences
                                    ._itemIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LoansTableProcessedTableManager =
    ProcessedTableManager<
      _$ClosetDatabase,
      $LoansTable,
      Loan,
      $$LoansTableFilterComposer,
      $$LoansTableOrderingComposer,
      $$LoansTableAnnotationComposer,
      $$LoansTableCreateCompanionBuilder,
      $$LoansTableUpdateCompanionBuilder,
      (Loan, $$LoansTableReferences),
      Loan,
      PrefetchHooks Function({bool itemId})
    >;
typedef $$WardrobesTableCreateCompanionBuilder =
    WardrobesCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> description,
      Value<String?> location,
      Value<String?> imageUrl,
      Value<bool> isFavourite,
      Value<bool> isAutoFavourites,
    });
typedef $$WardrobesTableUpdateCompanionBuilder =
    WardrobesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> description,
      Value<String?> location,
      Value<String?> imageUrl,
      Value<bool> isFavourite,
      Value<bool> isAutoFavourites,
    });

class $$WardrobesTableFilterComposer
    extends Composer<_$ClosetDatabase, $WardrobesTable> {
  $$WardrobesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavourite => $composableBuilder(
    column: $table.isFavourite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAutoFavourites => $composableBuilder(
    column: $table.isAutoFavourites,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WardrobesTableOrderingComposer
    extends Composer<_$ClosetDatabase, $WardrobesTable> {
  $$WardrobesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavourite => $composableBuilder(
    column: $table.isFavourite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAutoFavourites => $composableBuilder(
    column: $table.isAutoFavourites,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WardrobesTableAnnotationComposer
    extends Composer<_$ClosetDatabase, $WardrobesTable> {
  $$WardrobesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<bool> get isFavourite => $composableBuilder(
    column: $table.isFavourite,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAutoFavourites => $composableBuilder(
    column: $table.isAutoFavourites,
    builder: (column) => column,
  );
}

class $$WardrobesTableTableManager
    extends
        RootTableManager<
          _$ClosetDatabase,
          $WardrobesTable,
          Wardrobe,
          $$WardrobesTableFilterComposer,
          $$WardrobesTableOrderingComposer,
          $$WardrobesTableAnnotationComposer,
          $$WardrobesTableCreateCompanionBuilder,
          $$WardrobesTableUpdateCompanionBuilder,
          (
            Wardrobe,
            BaseReferences<_$ClosetDatabase, $WardrobesTable, Wardrobe>,
          ),
          Wardrobe,
          PrefetchHooks Function()
        > {
  $$WardrobesTableTableManager(_$ClosetDatabase db, $WardrobesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WardrobesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WardrobesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WardrobesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<bool> isFavourite = const Value.absent(),
                Value<bool> isAutoFavourites = const Value.absent(),
              }) => WardrobesCompanion(
                id: id,
                name: name,
                description: description,
                location: location,
                imageUrl: imageUrl,
                isFavourite: isFavourite,
                isAutoFavourites: isAutoFavourites,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<bool> isFavourite = const Value.absent(),
                Value<bool> isAutoFavourites = const Value.absent(),
              }) => WardrobesCompanion.insert(
                id: id,
                name: name,
                description: description,
                location: location,
                imageUrl: imageUrl,
                isFavourite: isFavourite,
                isAutoFavourites: isAutoFavourites,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WardrobesTableProcessedTableManager =
    ProcessedTableManager<
      _$ClosetDatabase,
      $WardrobesTable,
      Wardrobe,
      $$WardrobesTableFilterComposer,
      $$WardrobesTableOrderingComposer,
      $$WardrobesTableAnnotationComposer,
      $$WardrobesTableCreateCompanionBuilder,
      $$WardrobesTableUpdateCompanionBuilder,
      (Wardrobe, BaseReferences<_$ClosetDatabase, $WardrobesTable, Wardrobe>),
      Wardrobe,
      PrefetchHooks Function()
    >;

class $ClosetDatabaseManager {
  final _$ClosetDatabase _db;
  $ClosetDatabaseManager(this._db);
  $$ItemsTableTableManager get items =>
      $$ItemsTableTableManager(_db, _db.items);
  $$LoansTableTableManager get loans =>
      $$LoansTableTableManager(_db, _db.loans);
  $$WardrobesTableTableManager get wardrobes =>
      $$WardrobesTableTableManager(_db, _db.wardrobes);
}
