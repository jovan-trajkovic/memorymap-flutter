// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_map_database.dart';

// ignore_for_file: type=lint
class $LocationLogTable extends LocationLog
    with TableInfo<$LocationLogTable, LocationLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationLogTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _logNameMeta = const VerificationMeta(
    'logName',
  );
  @override
  late final GeneratedColumn<String> logName = GeneratedColumn<String>(
    'log_name',
    aliasedName,
    false,
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _thumbnailPathMeta = const VerificationMeta(
    'thumbnailPath',
  );
  @override
  late final GeneratedColumn<String> thumbnailPath = GeneratedColumn<String>(
    'thumbnail_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => '',
  );
  static const VerificationMeta _addDateMeta = const VerificationMeta(
    'addDate',
  );
  @override
  late final GeneratedColumn<DateTime> addDate = GeneratedColumn<DateTime>(
    'add_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    logName,
    description,
    rating,
    latitude,
    longitude,
    thumbnailPath,
    addDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'location_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocationLogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('log_name')) {
      context.handle(
        _logNameMeta,
        logName.isAcceptableOrUnknown(data['log_name']!, _logNameMeta),
      );
    } else if (isInserting) {
      context.missing(_logNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('thumbnail_path')) {
      context.handle(
        _thumbnailPathMeta,
        thumbnailPath.isAcceptableOrUnknown(
          data['thumbnail_path']!,
          _thumbnailPathMeta,
        ),
      );
    }
    if (data.containsKey('add_date')) {
      context.handle(
        _addDateMeta,
        addDate.isAcceptableOrUnknown(data['add_date']!, _addDateMeta),
      );
    } else if (isInserting) {
      context.missing(_addDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationLogData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      logName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}log_name'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      rating:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}rating'],
          )!,
      latitude:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}latitude'],
          )!,
      longitude:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}longitude'],
          )!,
      thumbnailPath:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}thumbnail_path'],
          )!,
      addDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}add_date'],
          )!,
    );
  }

  @override
  $LocationLogTable createAlias(String alias) {
    return $LocationLogTable(attachedDatabase, alias);
  }
}

class LocationLogData extends DataClass implements Insertable<LocationLogData> {
  final int id;
  final String logName;
  final String description;
  final int rating;
  final double latitude;
  final double longitude;
  final String thumbnailPath;
  final DateTime addDate;
  const LocationLogData({
    required this.id,
    required this.logName,
    required this.description,
    required this.rating,
    required this.latitude,
    required this.longitude,
    required this.thumbnailPath,
    required this.addDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['log_name'] = Variable<String>(logName);
    map['description'] = Variable<String>(description);
    map['rating'] = Variable<int>(rating);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['thumbnail_path'] = Variable<String>(thumbnailPath);
    map['add_date'] = Variable<DateTime>(addDate);
    return map;
  }

  LocationLogCompanion toCompanion(bool nullToAbsent) {
    return LocationLogCompanion(
      id: Value(id),
      logName: Value(logName),
      description: Value(description),
      rating: Value(rating),
      latitude: Value(latitude),
      longitude: Value(longitude),
      thumbnailPath: Value(thumbnailPath),
      addDate: Value(addDate),
    );
  }

  factory LocationLogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationLogData(
      id: serializer.fromJson<int>(json['id']),
      logName: serializer.fromJson<String>(json['logName']),
      description: serializer.fromJson<String>(json['description']),
      rating: serializer.fromJson<int>(json['rating']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      thumbnailPath: serializer.fromJson<String>(json['thumbnailPath']),
      addDate: serializer.fromJson<DateTime>(json['addDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'logName': serializer.toJson<String>(logName),
      'description': serializer.toJson<String>(description),
      'rating': serializer.toJson<int>(rating),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'thumbnailPath': serializer.toJson<String>(thumbnailPath),
      'addDate': serializer.toJson<DateTime>(addDate),
    };
  }

  LocationLogData copyWith({
    int? id,
    String? logName,
    String? description,
    int? rating,
    double? latitude,
    double? longitude,
    String? thumbnailPath,
    DateTime? addDate,
  }) => LocationLogData(
    id: id ?? this.id,
    logName: logName ?? this.logName,
    description: description ?? this.description,
    rating: rating ?? this.rating,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    thumbnailPath: thumbnailPath ?? this.thumbnailPath,
    addDate: addDate ?? this.addDate,
  );
  LocationLogData copyWithCompanion(LocationLogCompanion data) {
    return LocationLogData(
      id: data.id.present ? data.id.value : this.id,
      logName: data.logName.present ? data.logName.value : this.logName,
      description:
          data.description.present ? data.description.value : this.description,
      rating: data.rating.present ? data.rating.value : this.rating,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      thumbnailPath:
          data.thumbnailPath.present
              ? data.thumbnailPath.value
              : this.thumbnailPath,
      addDate: data.addDate.present ? data.addDate.value : this.addDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationLogData(')
          ..write('id: $id, ')
          ..write('logName: $logName, ')
          ..write('description: $description, ')
          ..write('rating: $rating, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('addDate: $addDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    logName,
    description,
    rating,
    latitude,
    longitude,
    thumbnailPath,
    addDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationLogData &&
          other.id == this.id &&
          other.logName == this.logName &&
          other.description == this.description &&
          other.rating == this.rating &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.thumbnailPath == this.thumbnailPath &&
          other.addDate == this.addDate);
}

class LocationLogCompanion extends UpdateCompanion<LocationLogData> {
  final Value<int> id;
  final Value<String> logName;
  final Value<String> description;
  final Value<int> rating;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String> thumbnailPath;
  final Value<DateTime> addDate;
  const LocationLogCompanion({
    this.id = const Value.absent(),
    this.logName = const Value.absent(),
    this.description = const Value.absent(),
    this.rating = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.thumbnailPath = const Value.absent(),
    this.addDate = const Value.absent(),
  });
  LocationLogCompanion.insert({
    this.id = const Value.absent(),
    required String logName,
    required String description,
    required int rating,
    required double latitude,
    required double longitude,
    this.thumbnailPath = const Value.absent(),
    required DateTime addDate,
  }) : logName = Value(logName),
       description = Value(description),
       rating = Value(rating),
       latitude = Value(latitude),
       longitude = Value(longitude),
       addDate = Value(addDate);
  static Insertable<LocationLogData> custom({
    Expression<int>? id,
    Expression<String>? logName,
    Expression<String>? description,
    Expression<int>? rating,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? thumbnailPath,
    Expression<DateTime>? addDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (logName != null) 'log_name': logName,
      if (description != null) 'description': description,
      if (rating != null) 'rating': rating,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (thumbnailPath != null) 'thumbnail_path': thumbnailPath,
      if (addDate != null) 'add_date': addDate,
    });
  }

  LocationLogCompanion copyWith({
    Value<int>? id,
    Value<String>? logName,
    Value<String>? description,
    Value<int>? rating,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<String>? thumbnailPath,
    Value<DateTime>? addDate,
  }) {
    return LocationLogCompanion(
      id: id ?? this.id,
      logName: logName ?? this.logName,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      addDate: addDate ?? this.addDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (logName.present) {
      map['log_name'] = Variable<String>(logName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (thumbnailPath.present) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath.value);
    }
    if (addDate.present) {
      map['add_date'] = Variable<DateTime>(addDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationLogCompanion(')
          ..write('id: $id, ')
          ..write('logName: $logName, ')
          ..write('description: $description, ')
          ..write('rating: $rating, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('addDate: $addDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$MemoryMapDatabase extends GeneratedDatabase {
  _$MemoryMapDatabase(QueryExecutor e) : super(e);
  $MemoryMapDatabaseManager get managers => $MemoryMapDatabaseManager(this);
  late final $LocationLogTable locationLog = $LocationLogTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [locationLog];
}

typedef $$LocationLogTableCreateCompanionBuilder =
    LocationLogCompanion Function({
      Value<int> id,
      required String logName,
      required String description,
      required int rating,
      required double latitude,
      required double longitude,
      Value<String> thumbnailPath,
      required DateTime addDate,
    });
typedef $$LocationLogTableUpdateCompanionBuilder =
    LocationLogCompanion Function({
      Value<int> id,
      Value<String> logName,
      Value<String> description,
      Value<int> rating,
      Value<double> latitude,
      Value<double> longitude,
      Value<String> thumbnailPath,
      Value<DateTime> addDate,
    });

class $$LocationLogTableFilterComposer
    extends Composer<_$MemoryMapDatabase, $LocationLogTable> {
  $$LocationLogTableFilterComposer({
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

  ColumnFilters<String> get logName => $composableBuilder(
    column: $table.logName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addDate => $composableBuilder(
    column: $table.addDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocationLogTableOrderingComposer
    extends Composer<_$MemoryMapDatabase, $LocationLogTable> {
  $$LocationLogTableOrderingComposer({
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

  ColumnOrderings<String> get logName => $composableBuilder(
    column: $table.logName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addDate => $composableBuilder(
    column: $table.addDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocationLogTableAnnotationComposer
    extends Composer<_$MemoryMapDatabase, $LocationLogTable> {
  $$LocationLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get logName =>
      $composableBuilder(column: $table.logName, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get thumbnailPath => $composableBuilder(
    column: $table.thumbnailPath,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get addDate =>
      $composableBuilder(column: $table.addDate, builder: (column) => column);
}

class $$LocationLogTableTableManager
    extends
        RootTableManager<
          _$MemoryMapDatabase,
          $LocationLogTable,
          LocationLogData,
          $$LocationLogTableFilterComposer,
          $$LocationLogTableOrderingComposer,
          $$LocationLogTableAnnotationComposer,
          $$LocationLogTableCreateCompanionBuilder,
          $$LocationLogTableUpdateCompanionBuilder,
          (
            LocationLogData,
            BaseReferences<
              _$MemoryMapDatabase,
              $LocationLogTable,
              LocationLogData
            >,
          ),
          LocationLogData,
          PrefetchHooks Function()
        > {
  $$LocationLogTableTableManager(
    _$MemoryMapDatabase db,
    $LocationLogTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$LocationLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$LocationLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$LocationLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> logName = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> rating = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<String> thumbnailPath = const Value.absent(),
                Value<DateTime> addDate = const Value.absent(),
              }) => LocationLogCompanion(
                id: id,
                logName: logName,
                description: description,
                rating: rating,
                latitude: latitude,
                longitude: longitude,
                thumbnailPath: thumbnailPath,
                addDate: addDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String logName,
                required String description,
                required int rating,
                required double latitude,
                required double longitude,
                Value<String> thumbnailPath = const Value.absent(),
                required DateTime addDate,
              }) => LocationLogCompanion.insert(
                id: id,
                logName: logName,
                description: description,
                rating: rating,
                latitude: latitude,
                longitude: longitude,
                thumbnailPath: thumbnailPath,
                addDate: addDate,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocationLogTableProcessedTableManager =
    ProcessedTableManager<
      _$MemoryMapDatabase,
      $LocationLogTable,
      LocationLogData,
      $$LocationLogTableFilterComposer,
      $$LocationLogTableOrderingComposer,
      $$LocationLogTableAnnotationComposer,
      $$LocationLogTableCreateCompanionBuilder,
      $$LocationLogTableUpdateCompanionBuilder,
      (
        LocationLogData,
        BaseReferences<_$MemoryMapDatabase, $LocationLogTable, LocationLogData>,
      ),
      LocationLogData,
      PrefetchHooks Function()
    >;

class $MemoryMapDatabaseManager {
  final _$MemoryMapDatabase _db;
  $MemoryMapDatabaseManager(this._db);
  $$LocationLogTableTableManager get locationLog =>
      $$LocationLogTableTableManager(_db, _db.locationLog);
}
