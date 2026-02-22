// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_database.dart';

// ignore_for_file: type=lint
class $SessionRecordsTable extends SessionRecords
    with TableInfo<$SessionRecordsTable, SessionRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionRecordsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _volumeLitersMeta = const VerificationMeta(
    'volumeLiters',
  );
  @override
  late final GeneratedColumn<double> volumeLiters = GeneratedColumn<double>(
    'volume_liters',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentMilliampsMeta = const VerificationMeta(
    'currentMilliamps',
  );
  @override
  late final GeneratedColumn<double> currentMilliamps = GeneratedColumn<double>(
    'current_milliamps',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetPpmMeta = const VerificationMeta(
    'targetPpm',
  );
  @override
  late final GeneratedColumn<double> targetPpm = GeneratedColumn<double>(
    'target_ppm',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    volumeLiters,
    currentMilliamps,
    targetPpm,
    durationSeconds,
    completedAt,
    completed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<SessionRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('volume_liters')) {
      context.handle(
        _volumeLitersMeta,
        volumeLiters.isAcceptableOrUnknown(
          data['volume_liters']!,
          _volumeLitersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_volumeLitersMeta);
    }
    if (data.containsKey('current_milliamps')) {
      context.handle(
        _currentMilliampsMeta,
        currentMilliamps.isAcceptableOrUnknown(
          data['current_milliamps']!,
          _currentMilliampsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentMilliampsMeta);
    }
    if (data.containsKey('target_ppm')) {
      context.handle(
        _targetPpmMeta,
        targetPpm.isAcceptableOrUnknown(data['target_ppm']!, _targetPpmMeta),
      );
    } else if (isInserting) {
      context.missing(_targetPpmMeta);
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationSecondsMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      volumeLiters: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}volume_liters'],
      )!,
      currentMilliamps: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}current_milliamps'],
      )!,
      targetPpm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}target_ppm'],
      )!,
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      )!,
      completed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}completed'],
      )!,
    );
  }

  @override
  $SessionRecordsTable createAlias(String alias) {
    return $SessionRecordsTable(attachedDatabase, alias);
  }
}

class SessionRecord extends DataClass implements Insertable<SessionRecord> {
  final int id;
  final double volumeLiters;
  final double currentMilliamps;
  final double targetPpm;
  final int durationSeconds;
  final DateTime completedAt;
  final bool completed;
  const SessionRecord({
    required this.id,
    required this.volumeLiters,
    required this.currentMilliamps,
    required this.targetPpm,
    required this.durationSeconds,
    required this.completedAt,
    required this.completed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['volume_liters'] = Variable<double>(volumeLiters);
    map['current_milliamps'] = Variable<double>(currentMilliamps);
    map['target_ppm'] = Variable<double>(targetPpm);
    map['duration_seconds'] = Variable<int>(durationSeconds);
    map['completed_at'] = Variable<DateTime>(completedAt);
    map['completed'] = Variable<bool>(completed);
    return map;
  }

  SessionRecordsCompanion toCompanion(bool nullToAbsent) {
    return SessionRecordsCompanion(
      id: Value(id),
      volumeLiters: Value(volumeLiters),
      currentMilliamps: Value(currentMilliamps),
      targetPpm: Value(targetPpm),
      durationSeconds: Value(durationSeconds),
      completedAt: Value(completedAt),
      completed: Value(completed),
    );
  }

  factory SessionRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionRecord(
      id: serializer.fromJson<int>(json['id']),
      volumeLiters: serializer.fromJson<double>(json['volumeLiters']),
      currentMilliamps: serializer.fromJson<double>(json['currentMilliamps']),
      targetPpm: serializer.fromJson<double>(json['targetPpm']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'volumeLiters': serializer.toJson<double>(volumeLiters),
      'currentMilliamps': serializer.toJson<double>(currentMilliamps),
      'targetPpm': serializer.toJson<double>(targetPpm),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
      'completedAt': serializer.toJson<DateTime>(completedAt),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  SessionRecord copyWith({
    int? id,
    double? volumeLiters,
    double? currentMilliamps,
    double? targetPpm,
    int? durationSeconds,
    DateTime? completedAt,
    bool? completed,
  }) => SessionRecord(
    id: id ?? this.id,
    volumeLiters: volumeLiters ?? this.volumeLiters,
    currentMilliamps: currentMilliamps ?? this.currentMilliamps,
    targetPpm: targetPpm ?? this.targetPpm,
    durationSeconds: durationSeconds ?? this.durationSeconds,
    completedAt: completedAt ?? this.completedAt,
    completed: completed ?? this.completed,
  );
  SessionRecord copyWithCompanion(SessionRecordsCompanion data) {
    return SessionRecord(
      id: data.id.present ? data.id.value : this.id,
      volumeLiters: data.volumeLiters.present
          ? data.volumeLiters.value
          : this.volumeLiters,
      currentMilliamps: data.currentMilliamps.present
          ? data.currentMilliamps.value
          : this.currentMilliamps,
      targetPpm: data.targetPpm.present ? data.targetPpm.value : this.targetPpm,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      completed: data.completed.present ? data.completed.value : this.completed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionRecord(')
          ..write('id: $id, ')
          ..write('volumeLiters: $volumeLiters, ')
          ..write('currentMilliamps: $currentMilliamps, ')
          ..write('targetPpm: $targetPpm, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('completedAt: $completedAt, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    volumeLiters,
    currentMilliamps,
    targetPpm,
    durationSeconds,
    completedAt,
    completed,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionRecord &&
          other.id == this.id &&
          other.volumeLiters == this.volumeLiters &&
          other.currentMilliamps == this.currentMilliamps &&
          other.targetPpm == this.targetPpm &&
          other.durationSeconds == this.durationSeconds &&
          other.completedAt == this.completedAt &&
          other.completed == this.completed);
}

class SessionRecordsCompanion extends UpdateCompanion<SessionRecord> {
  final Value<int> id;
  final Value<double> volumeLiters;
  final Value<double> currentMilliamps;
  final Value<double> targetPpm;
  final Value<int> durationSeconds;
  final Value<DateTime> completedAt;
  final Value<bool> completed;
  const SessionRecordsCompanion({
    this.id = const Value.absent(),
    this.volumeLiters = const Value.absent(),
    this.currentMilliamps = const Value.absent(),
    this.targetPpm = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.completed = const Value.absent(),
  });
  SessionRecordsCompanion.insert({
    this.id = const Value.absent(),
    required double volumeLiters,
    required double currentMilliamps,
    required double targetPpm,
    required int durationSeconds,
    required DateTime completedAt,
    this.completed = const Value.absent(),
  }) : volumeLiters = Value(volumeLiters),
       currentMilliamps = Value(currentMilliamps),
       targetPpm = Value(targetPpm),
       durationSeconds = Value(durationSeconds),
       completedAt = Value(completedAt);
  static Insertable<SessionRecord> custom({
    Expression<int>? id,
    Expression<double>? volumeLiters,
    Expression<double>? currentMilliamps,
    Expression<double>? targetPpm,
    Expression<int>? durationSeconds,
    Expression<DateTime>? completedAt,
    Expression<bool>? completed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (volumeLiters != null) 'volume_liters': volumeLiters,
      if (currentMilliamps != null) 'current_milliamps': currentMilliamps,
      if (targetPpm != null) 'target_ppm': targetPpm,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (completedAt != null) 'completed_at': completedAt,
      if (completed != null) 'completed': completed,
    });
  }

  SessionRecordsCompanion copyWith({
    Value<int>? id,
    Value<double>? volumeLiters,
    Value<double>? currentMilliamps,
    Value<double>? targetPpm,
    Value<int>? durationSeconds,
    Value<DateTime>? completedAt,
    Value<bool>? completed,
  }) {
    return SessionRecordsCompanion(
      id: id ?? this.id,
      volumeLiters: volumeLiters ?? this.volumeLiters,
      currentMilliamps: currentMilliamps ?? this.currentMilliamps,
      targetPpm: targetPpm ?? this.targetPpm,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      completedAt: completedAt ?? this.completedAt,
      completed: completed ?? this.completed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (volumeLiters.present) {
      map['volume_liters'] = Variable<double>(volumeLiters.value);
    }
    if (currentMilliamps.present) {
      map['current_milliamps'] = Variable<double>(currentMilliamps.value);
    }
    if (targetPpm.present) {
      map['target_ppm'] = Variable<double>(targetPpm.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionRecordsCompanion(')
          ..write('id: $id, ')
          ..write('volumeLiters: $volumeLiters, ')
          ..write('currentMilliamps: $currentMilliamps, ')
          ..write('targetPpm: $targetPpm, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('completedAt: $completedAt, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }
}

abstract class _$HistoryDatabase extends GeneratedDatabase {
  _$HistoryDatabase(QueryExecutor e) : super(e);
  $HistoryDatabaseManager get managers => $HistoryDatabaseManager(this);
  late final $SessionRecordsTable sessionRecords = $SessionRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [sessionRecords];
}

typedef $$SessionRecordsTableCreateCompanionBuilder =
    SessionRecordsCompanion Function({
      Value<int> id,
      required double volumeLiters,
      required double currentMilliamps,
      required double targetPpm,
      required int durationSeconds,
      required DateTime completedAt,
      Value<bool> completed,
    });
typedef $$SessionRecordsTableUpdateCompanionBuilder =
    SessionRecordsCompanion Function({
      Value<int> id,
      Value<double> volumeLiters,
      Value<double> currentMilliamps,
      Value<double> targetPpm,
      Value<int> durationSeconds,
      Value<DateTime> completedAt,
      Value<bool> completed,
    });

class $$SessionRecordsTableFilterComposer
    extends Composer<_$HistoryDatabase, $SessionRecordsTable> {
  $$SessionRecordsTableFilterComposer({
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

  ColumnFilters<double> get volumeLiters => $composableBuilder(
    column: $table.volumeLiters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get currentMilliamps => $composableBuilder(
    column: $table.currentMilliamps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get targetPpm => $composableBuilder(
    column: $table.targetPpm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SessionRecordsTableOrderingComposer
    extends Composer<_$HistoryDatabase, $SessionRecordsTable> {
  $$SessionRecordsTableOrderingComposer({
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

  ColumnOrderings<double> get volumeLiters => $composableBuilder(
    column: $table.volumeLiters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get currentMilliamps => $composableBuilder(
    column: $table.currentMilliamps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get targetPpm => $composableBuilder(
    column: $table.targetPpm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SessionRecordsTableAnnotationComposer
    extends Composer<_$HistoryDatabase, $SessionRecordsTable> {
  $$SessionRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get volumeLiters => $composableBuilder(
    column: $table.volumeLiters,
    builder: (column) => column,
  );

  GeneratedColumn<double> get currentMilliamps => $composableBuilder(
    column: $table.currentMilliamps,
    builder: (column) => column,
  );

  GeneratedColumn<double> get targetPpm =>
      $composableBuilder(column: $table.targetPpm, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);
}

class $$SessionRecordsTableTableManager
    extends
        RootTableManager<
          _$HistoryDatabase,
          $SessionRecordsTable,
          SessionRecord,
          $$SessionRecordsTableFilterComposer,
          $$SessionRecordsTableOrderingComposer,
          $$SessionRecordsTableAnnotationComposer,
          $$SessionRecordsTableCreateCompanionBuilder,
          $$SessionRecordsTableUpdateCompanionBuilder,
          (
            SessionRecord,
            BaseReferences<
              _$HistoryDatabase,
              $SessionRecordsTable,
              SessionRecord
            >,
          ),
          SessionRecord,
          PrefetchHooks Function()
        > {
  $$SessionRecordsTableTableManager(
    _$HistoryDatabase db,
    $SessionRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> volumeLiters = const Value.absent(),
                Value<double> currentMilliamps = const Value.absent(),
                Value<double> targetPpm = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
                Value<bool> completed = const Value.absent(),
              }) => SessionRecordsCompanion(
                id: id,
                volumeLiters: volumeLiters,
                currentMilliamps: currentMilliamps,
                targetPpm: targetPpm,
                durationSeconds: durationSeconds,
                completedAt: completedAt,
                completed: completed,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double volumeLiters,
                required double currentMilliamps,
                required double targetPpm,
                required int durationSeconds,
                required DateTime completedAt,
                Value<bool> completed = const Value.absent(),
              }) => SessionRecordsCompanion.insert(
                id: id,
                volumeLiters: volumeLiters,
                currentMilliamps: currentMilliamps,
                targetPpm: targetPpm,
                durationSeconds: durationSeconds,
                completedAt: completedAt,
                completed: completed,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SessionRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$HistoryDatabase,
      $SessionRecordsTable,
      SessionRecord,
      $$SessionRecordsTableFilterComposer,
      $$SessionRecordsTableOrderingComposer,
      $$SessionRecordsTableAnnotationComposer,
      $$SessionRecordsTableCreateCompanionBuilder,
      $$SessionRecordsTableUpdateCompanionBuilder,
      (
        SessionRecord,
        BaseReferences<_$HistoryDatabase, $SessionRecordsTable, SessionRecord>,
      ),
      SessionRecord,
      PrefetchHooks Function()
    >;

class $HistoryDatabaseManager {
  final _$HistoryDatabase _db;
  $HistoryDatabaseManager(this._db);
  $$SessionRecordsTableTableManager get sessionRecords =>
      $$SessionRecordsTableTableManager(_db, _db.sessionRecords);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historyDatabaseHash() => r'adcd2a372642895805e38834d1dc43232b7a6bc2';

/// See also [historyDatabase].
@ProviderFor(historyDatabase)
final historyDatabaseProvider = AutoDisposeProvider<HistoryDatabase>.internal(
  historyDatabase,
  name: r'historyDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$historyDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HistoryDatabaseRef = AutoDisposeProviderRef<HistoryDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
