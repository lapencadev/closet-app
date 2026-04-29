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
  static const VerificationMeta _colourMeta = const VerificationMeta('colour');
  @override
  late final GeneratedColumn<String> colour = GeneratedColumn<String>(
    'colour',
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
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    type,
    colour,
    season,
    size,
    imagePath,
    isFavorite,
    wardrobeId,
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
    if (data.containsKey('colour')) {
      context.handle(
        _colourMeta,
        colour.isAcceptableOrUnknown(data['colour']!, _colourMeta),
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
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('wardrobe_id')) {
      context.handle(
        _wardrobeIdMeta,
        wardrobeId.isAcceptableOrUnknown(data['wardrobe_id']!, _wardrobeIdMeta),
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
      colour: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}colour'],
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
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      wardrobeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wardrobe_id'],
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
  final String? colour;
  final String? season;
  final String? size;
  final String? imagePath;
  final bool isFavorite;
  final int? wardrobeId;
  const Item({
    required this.id,
    required this.name,
    required this.type,
    this.colour,
    this.season,
    this.size,
    this.imagePath,
    required this.isFavorite,
    this.wardrobeId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || colour != null) {
      map['colour'] = Variable<String>(colour);
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
    map['is_favorite'] = Variable<bool>(isFavorite);
    if (!nullToAbsent || wardrobeId != null) {
      map['wardrobe_id'] = Variable<int>(wardrobeId);
    }
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      colour: colour == null && nullToAbsent
          ? const Value.absent()
          : Value(colour),
      season: season == null && nullToAbsent
          ? const Value.absent()
          : Value(season),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      isFavorite: Value(isFavorite),
      wardrobeId: wardrobeId == null && nullToAbsent
          ? const Value.absent()
          : Value(wardrobeId),
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
      colour: serializer.fromJson<String?>(json['colour']),
      season: serializer.fromJson<String?>(json['season']),
      size: serializer.fromJson<String?>(json['size']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      wardrobeId: serializer.fromJson<int?>(json['wardrobeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'colour': serializer.toJson<String?>(colour),
      'season': serializer.toJson<String?>(season),
      'size': serializer.toJson<String?>(size),
      'imagePath': serializer.toJson<String?>(imagePath),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'wardrobeId': serializer.toJson<int?>(wardrobeId),
    };
  }

  Item copyWith({
    int? id,
    String? name,
    String? type,
    Value<String?> colour = const Value.absent(),
    Value<String?> season = const Value.absent(),
    Value<String?> size = const Value.absent(),
    Value<String?> imagePath = const Value.absent(),
    bool? isFavorite,
    Value<int?> wardrobeId = const Value.absent(),
  }) => Item(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    colour: colour.present ? colour.value : this.colour,
    season: season.present ? season.value : this.season,
    size: size.present ? size.value : this.size,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    isFavorite: isFavorite ?? this.isFavorite,
    wardrobeId: wardrobeId.present ? wardrobeId.value : this.wardrobeId,
  );
  Item copyWithCompanion(ItemsCompanion data) {
    return Item(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      colour: data.colour.present ? data.colour.value : this.colour,
      season: data.season.present ? data.season.value : this.season,
      size: data.size.present ? data.size.value : this.size,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      wardrobeId: data.wardrobeId.present
          ? data.wardrobeId.value
          : this.wardrobeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Item(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('colour: $colour, ')
          ..write('season: $season, ')
          ..write('size: $size, ')
          ..write('imagePath: $imagePath, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('wardrobeId: $wardrobeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    type,
    colour,
    season,
    size,
    imagePath,
    isFavorite,
    wardrobeId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.colour == this.colour &&
          other.season == this.season &&
          other.size == this.size &&
          other.imagePath == this.imagePath &&
          other.isFavorite == this.isFavorite &&
          other.wardrobeId == this.wardrobeId);
}

class ItemsCompanion extends UpdateCompanion<Item> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  final Value<String?> colour;
  final Value<String?> season;
  final Value<String?> size;
  final Value<String?> imagePath;
  final Value<bool> isFavorite;
  final Value<int?> wardrobeId;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.colour = const Value.absent(),
    this.season = const Value.absent(),
    this.size = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.wardrobeId = const Value.absent(),
  });
  ItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String type,
    this.colour = const Value.absent(),
    this.season = const Value.absent(),
    this.size = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.wardrobeId = const Value.absent(),
  }) : name = Value(name),
       type = Value(type);
  static Insertable<Item> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? colour,
    Expression<String>? season,
    Expression<String>? size,
    Expression<String>? imagePath,
    Expression<bool>? isFavorite,
    Expression<int>? wardrobeId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (colour != null) 'colour': colour,
      if (season != null) 'season': season,
      if (size != null) 'size': size,
      if (imagePath != null) 'image_path': imagePath,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (wardrobeId != null) 'wardrobe_id': wardrobeId,
    });
  }

  ItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? type,
    Value<String?>? colour,
    Value<String?>? season,
    Value<String?>? size,
    Value<String?>? imagePath,
    Value<bool>? isFavorite,
    Value<int?>? wardrobeId,
  }) {
    return ItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      colour: colour ?? this.colour,
      season: season ?? this.season,
      size: size ?? this.size,
      imagePath: imagePath ?? this.imagePath,
      isFavorite: isFavorite ?? this.isFavorite,
      wardrobeId: wardrobeId ?? this.wardrobeId,
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
    if (colour.present) {
      map['colour'] = Variable<String>(colour.value);
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
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (wardrobeId.present) {
      map['wardrobe_id'] = Variable<int>(wardrobeId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('colour: $colour, ')
          ..write('season: $season, ')
          ..write('size: $size, ')
          ..write('imagePath: $imagePath, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('wardrobeId: $wardrobeId')
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    itemId,
    borrowerName,
    dateLoaned,
    dateReturned,
    isReturned,
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
    if (data.containsKey('is_returned')) {
      context.handle(
        _isReturnedMeta,
        isReturned.isAcceptableOrUnknown(data['is_returned']!, _isReturnedMeta),
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
      isReturned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_returned'],
      )!,
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
  final bool isReturned;
  const Loan({
    required this.id,
    required this.itemId,
    required this.borrowerName,
    required this.dateLoaned,
    this.dateReturned,
    required this.isReturned,
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
    map['is_returned'] = Variable<bool>(isReturned);
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
      isReturned: Value(isReturned),
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
      isReturned: serializer.fromJson<bool>(json['isReturned']),
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
      'isReturned': serializer.toJson<bool>(isReturned),
    };
  }

  Loan copyWith({
    int? id,
    int? itemId,
    String? borrowerName,
    DateTime? dateLoaned,
    Value<DateTime?> dateReturned = const Value.absent(),
    bool? isReturned,
  }) => Loan(
    id: id ?? this.id,
    itemId: itemId ?? this.itemId,
    borrowerName: borrowerName ?? this.borrowerName,
    dateLoaned: dateLoaned ?? this.dateLoaned,
    dateReturned: dateReturned.present ? dateReturned.value : this.dateReturned,
    isReturned: isReturned ?? this.isReturned,
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
      isReturned: data.isReturned.present
          ? data.isReturned.value
          : this.isReturned,
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
          ..write('isReturned: $isReturned')
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
    isReturned,
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
          other.isReturned == this.isReturned);
}

class LoansCompanion extends UpdateCompanion<Loan> {
  final Value<int> id;
  final Value<int> itemId;
  final Value<String> borrowerName;
  final Value<DateTime> dateLoaned;
  final Value<DateTime?> dateReturned;
  final Value<bool> isReturned;
  const LoansCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.borrowerName = const Value.absent(),
    this.dateLoaned = const Value.absent(),
    this.dateReturned = const Value.absent(),
    this.isReturned = const Value.absent(),
  });
  LoansCompanion.insert({
    this.id = const Value.absent(),
    required int itemId,
    required String borrowerName,
    required DateTime dateLoaned,
    this.dateReturned = const Value.absent(),
    this.isReturned = const Value.absent(),
  }) : itemId = Value(itemId),
       borrowerName = Value(borrowerName),
       dateLoaned = Value(dateLoaned);
  static Insertable<Loan> custom({
    Expression<int>? id,
    Expression<int>? itemId,
    Expression<String>? borrowerName,
    Expression<DateTime>? dateLoaned,
    Expression<DateTime>? dateReturned,
    Expression<bool>? isReturned,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (borrowerName != null) 'borrower_name': borrowerName,
      if (dateLoaned != null) 'date_loaned': dateLoaned,
      if (dateReturned != null) 'date_returned': dateReturned,
      if (isReturned != null) 'is_returned': isReturned,
    });
  }

  LoansCompanion copyWith({
    Value<int>? id,
    Value<int>? itemId,
    Value<String>? borrowerName,
    Value<DateTime>? dateLoaned,
    Value<DateTime?>? dateReturned,
    Value<bool>? isReturned,
  }) {
    return LoansCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      borrowerName: borrowerName ?? this.borrowerName,
      dateLoaned: dateLoaned ?? this.dateLoaned,
      dateReturned: dateReturned ?? this.dateReturned,
      isReturned: isReturned ?? this.isReturned,
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
    if (isReturned.present) {
      map['is_returned'] = Variable<bool>(isReturned.value);
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
          ..write('isReturned: $isReturned')
          ..write(')'))
        .toString();
  }
}

abstract class _$ClosetDatabase extends GeneratedDatabase {
  _$ClosetDatabase(QueryExecutor e) : super(e);
  $ClosetDatabaseManager get managers => $ClosetDatabaseManager(this);
  late final $ItemsTable items = $ItemsTable(this);
  late final $LoansTable loans = $LoansTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [items, loans];
}

typedef $$ItemsTableCreateCompanionBuilder =
    ItemsCompanion Function({
      Value<int> id,
      required String name,
      required String type,
      Value<String?> colour,
      Value<String?> season,
      Value<String?> size,
      Value<String?> imagePath,
      Value<bool> isFavorite,
      Value<int?> wardrobeId,
    });
typedef $$ItemsTableUpdateCompanionBuilder =
    ItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> type,
      Value<String?> colour,
      Value<String?> season,
      Value<String?> size,
      Value<String?> imagePath,
      Value<bool> isFavorite,
      Value<int?> wardrobeId,
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

  ColumnFilters<String> get colour => $composableBuilder(
    column: $table.colour,
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

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wardrobeId => $composableBuilder(
    column: $table.wardrobeId,
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

  ColumnOrderings<String> get colour => $composableBuilder(
    column: $table.colour,
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

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wardrobeId => $composableBuilder(
    column: $table.wardrobeId,
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

  GeneratedColumn<String> get colour =>
      $composableBuilder(column: $table.colour, builder: (column) => column);

  GeneratedColumn<String> get season =>
      $composableBuilder(column: $table.season, builder: (column) => column);

  GeneratedColumn<String> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<int> get wardrobeId => $composableBuilder(
    column: $table.wardrobeId,
    builder: (column) => column,
  );

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
                Value<String?> colour = const Value.absent(),
                Value<String?> season = const Value.absent(),
                Value<String?> size = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int?> wardrobeId = const Value.absent(),
              }) => ItemsCompanion(
                id: id,
                name: name,
                type: type,
                colour: colour,
                season: season,
                size: size,
                imagePath: imagePath,
                isFavorite: isFavorite,
                wardrobeId: wardrobeId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String type,
                Value<String?> colour = const Value.absent(),
                Value<String?> season = const Value.absent(),
                Value<String?> size = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<int?> wardrobeId = const Value.absent(),
              }) => ItemsCompanion.insert(
                id: id,
                name: name,
                type: type,
                colour: colour,
                season: season,
                size: size,
                imagePath: imagePath,
                isFavorite: isFavorite,
                wardrobeId: wardrobeId,
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
      Value<bool> isReturned,
    });
typedef $$LoansTableUpdateCompanionBuilder =
    LoansCompanion Function({
      Value<int> id,
      Value<int> itemId,
      Value<String> borrowerName,
      Value<DateTime> dateLoaned,
      Value<DateTime?> dateReturned,
      Value<bool> isReturned,
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

  ColumnFilters<bool> get isReturned => $composableBuilder(
    column: $table.isReturned,
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

  ColumnOrderings<bool> get isReturned => $composableBuilder(
    column: $table.isReturned,
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

  GeneratedColumn<bool> get isReturned => $composableBuilder(
    column: $table.isReturned,
    builder: (column) => column,
  );

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
                Value<bool> isReturned = const Value.absent(),
              }) => LoansCompanion(
                id: id,
                itemId: itemId,
                borrowerName: borrowerName,
                dateLoaned: dateLoaned,
                dateReturned: dateReturned,
                isReturned: isReturned,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int itemId,
                required String borrowerName,
                required DateTime dateLoaned,
                Value<DateTime?> dateReturned = const Value.absent(),
                Value<bool> isReturned = const Value.absent(),
              }) => LoansCompanion.insert(
                id: id,
                itemId: itemId,
                borrowerName: borrowerName,
                dateLoaned: dateLoaned,
                dateReturned: dateReturned,
                isReturned: isReturned,
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

class $ClosetDatabaseManager {
  final _$ClosetDatabase _db;
  $ClosetDatabaseManager(this._db);
  $$ItemsTableTableManager get items =>
      $$ItemsTableTableManager(_db, _db.items);
  $$LoansTableTableManager get loans =>
      $$LoansTableTableManager(_db, _db.loans);
}
