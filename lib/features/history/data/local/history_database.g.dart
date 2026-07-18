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
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<int> deviceId = GeneratedColumn<int>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceNameMeta = const VerificationMeta(
    'deviceName',
  );
  @override
  late final GeneratedColumn<String> deviceName = GeneratedColumn<String>(
    'device_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceCurrentMaMeta = const VerificationMeta(
    'deviceCurrentMa',
  );
  @override
  late final GeneratedColumn<double> deviceCurrentMa = GeneratedColumn<double>(
    'device_current_ma',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceAutoPolarityMeta =
      const VerificationMeta('deviceAutoPolarity');
  @override
  late final GeneratedColumn<bool> deviceAutoPolarity = GeneratedColumn<bool>(
    'device_auto_polarity',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("device_auto_polarity" IN (0, 1))',
    ),
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
    deviceId,
    deviceName,
    deviceCurrentMa,
    deviceAutoPolarity,
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
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('device_name')) {
      context.handle(
        _deviceNameMeta,
        deviceName.isAcceptableOrUnknown(data['device_name']!, _deviceNameMeta),
      );
    }
    if (data.containsKey('device_current_ma')) {
      context.handle(
        _deviceCurrentMaMeta,
        deviceCurrentMa.isAcceptableOrUnknown(
          data['device_current_ma']!,
          _deviceCurrentMaMeta,
        ),
      );
    }
    if (data.containsKey('device_auto_polarity')) {
      context.handle(
        _deviceAutoPolarityMeta,
        deviceAutoPolarity.isAcceptableOrUnknown(
          data['device_auto_polarity']!,
          _deviceAutoPolarityMeta,
        ),
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
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}device_id'],
      ),
      deviceName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_name'],
      ),
      deviceCurrentMa: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}device_current_ma'],
      ),
      deviceAutoPolarity: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}device_auto_polarity'],
      ),
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
  final int? deviceId;
  final String? deviceName;
  final double? deviceCurrentMa;
  final bool? deviceAutoPolarity;
  const SessionRecord({
    required this.id,
    required this.volumeLiters,
    required this.currentMilliamps,
    required this.targetPpm,
    required this.durationSeconds,
    required this.completedAt,
    required this.completed,
    this.deviceId,
    this.deviceName,
    this.deviceCurrentMa,
    this.deviceAutoPolarity,
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
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<int>(deviceId);
    }
    if (!nullToAbsent || deviceName != null) {
      map['device_name'] = Variable<String>(deviceName);
    }
    if (!nullToAbsent || deviceCurrentMa != null) {
      map['device_current_ma'] = Variable<double>(deviceCurrentMa);
    }
    if (!nullToAbsent || deviceAutoPolarity != null) {
      map['device_auto_polarity'] = Variable<bool>(deviceAutoPolarity);
    }
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
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      deviceName: deviceName == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceName),
      deviceCurrentMa: deviceCurrentMa == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceCurrentMa),
      deviceAutoPolarity: deviceAutoPolarity == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceAutoPolarity),
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
      deviceId: serializer.fromJson<int?>(json['deviceId']),
      deviceName: serializer.fromJson<String?>(json['deviceName']),
      deviceCurrentMa: serializer.fromJson<double?>(json['deviceCurrentMa']),
      deviceAutoPolarity: serializer.fromJson<bool?>(
        json['deviceAutoPolarity'],
      ),
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
      'deviceId': serializer.toJson<int?>(deviceId),
      'deviceName': serializer.toJson<String?>(deviceName),
      'deviceCurrentMa': serializer.toJson<double?>(deviceCurrentMa),
      'deviceAutoPolarity': serializer.toJson<bool?>(deviceAutoPolarity),
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
    Value<int?> deviceId = const Value.absent(),
    Value<String?> deviceName = const Value.absent(),
    Value<double?> deviceCurrentMa = const Value.absent(),
    Value<bool?> deviceAutoPolarity = const Value.absent(),
  }) => SessionRecord(
    id: id ?? this.id,
    volumeLiters: volumeLiters ?? this.volumeLiters,
    currentMilliamps: currentMilliamps ?? this.currentMilliamps,
    targetPpm: targetPpm ?? this.targetPpm,
    durationSeconds: durationSeconds ?? this.durationSeconds,
    completedAt: completedAt ?? this.completedAt,
    completed: completed ?? this.completed,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    deviceName: deviceName.present ? deviceName.value : this.deviceName,
    deviceCurrentMa: deviceCurrentMa.present
        ? deviceCurrentMa.value
        : this.deviceCurrentMa,
    deviceAutoPolarity: deviceAutoPolarity.present
        ? deviceAutoPolarity.value
        : this.deviceAutoPolarity,
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
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      deviceName: data.deviceName.present
          ? data.deviceName.value
          : this.deviceName,
      deviceCurrentMa: data.deviceCurrentMa.present
          ? data.deviceCurrentMa.value
          : this.deviceCurrentMa,
      deviceAutoPolarity: data.deviceAutoPolarity.present
          ? data.deviceAutoPolarity.value
          : this.deviceAutoPolarity,
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
          ..write('completed: $completed, ')
          ..write('deviceId: $deviceId, ')
          ..write('deviceName: $deviceName, ')
          ..write('deviceCurrentMa: $deviceCurrentMa, ')
          ..write('deviceAutoPolarity: $deviceAutoPolarity')
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
    deviceId,
    deviceName,
    deviceCurrentMa,
    deviceAutoPolarity,
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
          other.completed == this.completed &&
          other.deviceId == this.deviceId &&
          other.deviceName == this.deviceName &&
          other.deviceCurrentMa == this.deviceCurrentMa &&
          other.deviceAutoPolarity == this.deviceAutoPolarity);
}

class SessionRecordsCompanion extends UpdateCompanion<SessionRecord> {
  final Value<int> id;
  final Value<double> volumeLiters;
  final Value<double> currentMilliamps;
  final Value<double> targetPpm;
  final Value<int> durationSeconds;
  final Value<DateTime> completedAt;
  final Value<bool> completed;
  final Value<int?> deviceId;
  final Value<String?> deviceName;
  final Value<double?> deviceCurrentMa;
  final Value<bool?> deviceAutoPolarity;
  const SessionRecordsCompanion({
    this.id = const Value.absent(),
    this.volumeLiters = const Value.absent(),
    this.currentMilliamps = const Value.absent(),
    this.targetPpm = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.completed = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.deviceName = const Value.absent(),
    this.deviceCurrentMa = const Value.absent(),
    this.deviceAutoPolarity = const Value.absent(),
  });
  SessionRecordsCompanion.insert({
    this.id = const Value.absent(),
    required double volumeLiters,
    required double currentMilliamps,
    required double targetPpm,
    required int durationSeconds,
    required DateTime completedAt,
    this.completed = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.deviceName = const Value.absent(),
    this.deviceCurrentMa = const Value.absent(),
    this.deviceAutoPolarity = const Value.absent(),
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
    Expression<int>? deviceId,
    Expression<String>? deviceName,
    Expression<double>? deviceCurrentMa,
    Expression<bool>? deviceAutoPolarity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (volumeLiters != null) 'volume_liters': volumeLiters,
      if (currentMilliamps != null) 'current_milliamps': currentMilliamps,
      if (targetPpm != null) 'target_ppm': targetPpm,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (completedAt != null) 'completed_at': completedAt,
      if (completed != null) 'completed': completed,
      if (deviceId != null) 'device_id': deviceId,
      if (deviceName != null) 'device_name': deviceName,
      if (deviceCurrentMa != null) 'device_current_ma': deviceCurrentMa,
      if (deviceAutoPolarity != null)
        'device_auto_polarity': deviceAutoPolarity,
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
    Value<int?>? deviceId,
    Value<String?>? deviceName,
    Value<double?>? deviceCurrentMa,
    Value<bool?>? deviceAutoPolarity,
  }) {
    return SessionRecordsCompanion(
      id: id ?? this.id,
      volumeLiters: volumeLiters ?? this.volumeLiters,
      currentMilliamps: currentMilliamps ?? this.currentMilliamps,
      targetPpm: targetPpm ?? this.targetPpm,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      completedAt: completedAt ?? this.completedAt,
      completed: completed ?? this.completed,
      deviceId: deviceId ?? this.deviceId,
      deviceName: deviceName ?? this.deviceName,
      deviceCurrentMa: deviceCurrentMa ?? this.deviceCurrentMa,
      deviceAutoPolarity: deviceAutoPolarity ?? this.deviceAutoPolarity,
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
    if (deviceId.present) {
      map['device_id'] = Variable<int>(deviceId.value);
    }
    if (deviceName.present) {
      map['device_name'] = Variable<String>(deviceName.value);
    }
    if (deviceCurrentMa.present) {
      map['device_current_ma'] = Variable<double>(deviceCurrentMa.value);
    }
    if (deviceAutoPolarity.present) {
      map['device_auto_polarity'] = Variable<bool>(deviceAutoPolarity.value);
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
          ..write('completed: $completed, ')
          ..write('deviceId: $deviceId, ')
          ..write('deviceName: $deviceName, ')
          ..write('deviceCurrentMa: $deviceCurrentMa, ')
          ..write('deviceAutoPolarity: $deviceAutoPolarity')
          ..write(')'))
        .toString();
  }
}

class $DevicesTable extends Devices with TableInfo<$DevicesTable, Device> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DevicesTable(this.attachedDatabase, [this._alias]);
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
    type: DriftSqlType.string,
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
  static const VerificationMeta _supportsAutoPolarityMeta =
      const VerificationMeta('supportsAutoPolarity');
  @override
  late final GeneratedColumn<bool> supportsAutoPolarity = GeneratedColumn<bool>(
    'supports_auto_polarity',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("supports_auto_polarity" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    currentMilliamps,
    supportsAutoPolarity,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'devices';
  @override
  VerificationContext validateIntegrity(
    Insertable<Device> instance, {
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
    if (data.containsKey('supports_auto_polarity')) {
      context.handle(
        _supportsAutoPolarityMeta,
        supportsAutoPolarity.isAcceptableOrUnknown(
          data['supports_auto_polarity']!,
          _supportsAutoPolarityMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Device map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Device(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      currentMilliamps: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}current_milliamps'],
      )!,
      supportsAutoPolarity: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}supports_auto_polarity'],
      )!,
    );
  }

  @override
  $DevicesTable createAlias(String alias) {
    return $DevicesTable(attachedDatabase, alias);
  }
}

class Device extends DataClass implements Insertable<Device> {
  final int id;
  final String name;
  final double currentMilliamps;
  final bool supportsAutoPolarity;
  const Device({
    required this.id,
    required this.name,
    required this.currentMilliamps,
    required this.supportsAutoPolarity,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['current_milliamps'] = Variable<double>(currentMilliamps);
    map['supports_auto_polarity'] = Variable<bool>(supportsAutoPolarity);
    return map;
  }

  DevicesCompanion toCompanion(bool nullToAbsent) {
    return DevicesCompanion(
      id: Value(id),
      name: Value(name),
      currentMilliamps: Value(currentMilliamps),
      supportsAutoPolarity: Value(supportsAutoPolarity),
    );
  }

  factory Device.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Device(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      currentMilliamps: serializer.fromJson<double>(json['currentMilliamps']),
      supportsAutoPolarity: serializer.fromJson<bool>(
        json['supportsAutoPolarity'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'currentMilliamps': serializer.toJson<double>(currentMilliamps),
      'supportsAutoPolarity': serializer.toJson<bool>(supportsAutoPolarity),
    };
  }

  Device copyWith({
    int? id,
    String? name,
    double? currentMilliamps,
    bool? supportsAutoPolarity,
  }) => Device(
    id: id ?? this.id,
    name: name ?? this.name,
    currentMilliamps: currentMilliamps ?? this.currentMilliamps,
    supportsAutoPolarity: supportsAutoPolarity ?? this.supportsAutoPolarity,
  );
  Device copyWithCompanion(DevicesCompanion data) {
    return Device(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      currentMilliamps: data.currentMilliamps.present
          ? data.currentMilliamps.value
          : this.currentMilliamps,
      supportsAutoPolarity: data.supportsAutoPolarity.present
          ? data.supportsAutoPolarity.value
          : this.supportsAutoPolarity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Device(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('currentMilliamps: $currentMilliamps, ')
          ..write('supportsAutoPolarity: $supportsAutoPolarity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, currentMilliamps, supportsAutoPolarity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Device &&
          other.id == this.id &&
          other.name == this.name &&
          other.currentMilliamps == this.currentMilliamps &&
          other.supportsAutoPolarity == this.supportsAutoPolarity);
}

class DevicesCompanion extends UpdateCompanion<Device> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> currentMilliamps;
  final Value<bool> supportsAutoPolarity;
  const DevicesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.currentMilliamps = const Value.absent(),
    this.supportsAutoPolarity = const Value.absent(),
  });
  DevicesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double currentMilliamps,
    this.supportsAutoPolarity = const Value.absent(),
  }) : name = Value(name),
       currentMilliamps = Value(currentMilliamps);
  static Insertable<Device> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? currentMilliamps,
    Expression<bool>? supportsAutoPolarity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (currentMilliamps != null) 'current_milliamps': currentMilliamps,
      if (supportsAutoPolarity != null)
        'supports_auto_polarity': supportsAutoPolarity,
    });
  }

  DevicesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? currentMilliamps,
    Value<bool>? supportsAutoPolarity,
  }) {
    return DevicesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      currentMilliamps: currentMilliamps ?? this.currentMilliamps,
      supportsAutoPolarity: supportsAutoPolarity ?? this.supportsAutoPolarity,
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
    if (currentMilliamps.present) {
      map['current_milliamps'] = Variable<double>(currentMilliamps.value);
    }
    if (supportsAutoPolarity.present) {
      map['supports_auto_polarity'] = Variable<bool>(
        supportsAutoPolarity.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DevicesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('currentMilliamps: $currentMilliamps, ')
          ..write('supportsAutoPolarity: $supportsAutoPolarity')
          ..write(')'))
        .toString();
  }
}

abstract class _$HistoryDatabase extends GeneratedDatabase {
  _$HistoryDatabase(QueryExecutor e) : super(e);
  $HistoryDatabaseManager get managers => $HistoryDatabaseManager(this);
  late final $SessionRecordsTable sessionRecords = $SessionRecordsTable(this);
  late final $DevicesTable devices = $DevicesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [sessionRecords, devices];
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
      Value<int?> deviceId,
      Value<String?> deviceName,
      Value<double?> deviceCurrentMa,
      Value<bool?> deviceAutoPolarity,
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
      Value<int?> deviceId,
      Value<String?> deviceName,
      Value<double?> deviceCurrentMa,
      Value<bool?> deviceAutoPolarity,
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

  ColumnFilters<int> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceName => $composableBuilder(
    column: $table.deviceName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get deviceCurrentMa => $composableBuilder(
    column: $table.deviceCurrentMa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deviceAutoPolarity => $composableBuilder(
    column: $table.deviceAutoPolarity,
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

  ColumnOrderings<int> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceName => $composableBuilder(
    column: $table.deviceName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get deviceCurrentMa => $composableBuilder(
    column: $table.deviceCurrentMa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deviceAutoPolarity => $composableBuilder(
    column: $table.deviceAutoPolarity,
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

  GeneratedColumn<int> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<String> get deviceName => $composableBuilder(
    column: $table.deviceName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get deviceCurrentMa => $composableBuilder(
    column: $table.deviceCurrentMa,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get deviceAutoPolarity => $composableBuilder(
    column: $table.deviceAutoPolarity,
    builder: (column) => column,
  );
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
                Value<int?> deviceId = const Value.absent(),
                Value<String?> deviceName = const Value.absent(),
                Value<double?> deviceCurrentMa = const Value.absent(),
                Value<bool?> deviceAutoPolarity = const Value.absent(),
              }) => SessionRecordsCompanion(
                id: id,
                volumeLiters: volumeLiters,
                currentMilliamps: currentMilliamps,
                targetPpm: targetPpm,
                durationSeconds: durationSeconds,
                completedAt: completedAt,
                completed: completed,
                deviceId: deviceId,
                deviceName: deviceName,
                deviceCurrentMa: deviceCurrentMa,
                deviceAutoPolarity: deviceAutoPolarity,
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
                Value<int?> deviceId = const Value.absent(),
                Value<String?> deviceName = const Value.absent(),
                Value<double?> deviceCurrentMa = const Value.absent(),
                Value<bool?> deviceAutoPolarity = const Value.absent(),
              }) => SessionRecordsCompanion.insert(
                id: id,
                volumeLiters: volumeLiters,
                currentMilliamps: currentMilliamps,
                targetPpm: targetPpm,
                durationSeconds: durationSeconds,
                completedAt: completedAt,
                completed: completed,
                deviceId: deviceId,
                deviceName: deviceName,
                deviceCurrentMa: deviceCurrentMa,
                deviceAutoPolarity: deviceAutoPolarity,
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
typedef $$DevicesTableCreateCompanionBuilder =
    DevicesCompanion Function({
      Value<int> id,
      required String name,
      required double currentMilliamps,
      Value<bool> supportsAutoPolarity,
    });
typedef $$DevicesTableUpdateCompanionBuilder =
    DevicesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> currentMilliamps,
      Value<bool> supportsAutoPolarity,
    });

class $$DevicesTableFilterComposer
    extends Composer<_$HistoryDatabase, $DevicesTable> {
  $$DevicesTableFilterComposer({
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

  ColumnFilters<double> get currentMilliamps => $composableBuilder(
    column: $table.currentMilliamps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get supportsAutoPolarity => $composableBuilder(
    column: $table.supportsAutoPolarity,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DevicesTableOrderingComposer
    extends Composer<_$HistoryDatabase, $DevicesTable> {
  $$DevicesTableOrderingComposer({
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

  ColumnOrderings<double> get currentMilliamps => $composableBuilder(
    column: $table.currentMilliamps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get supportsAutoPolarity => $composableBuilder(
    column: $table.supportsAutoPolarity,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DevicesTableAnnotationComposer
    extends Composer<_$HistoryDatabase, $DevicesTable> {
  $$DevicesTableAnnotationComposer({
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

  GeneratedColumn<double> get currentMilliamps => $composableBuilder(
    column: $table.currentMilliamps,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get supportsAutoPolarity => $composableBuilder(
    column: $table.supportsAutoPolarity,
    builder: (column) => column,
  );
}

class $$DevicesTableTableManager
    extends
        RootTableManager<
          _$HistoryDatabase,
          $DevicesTable,
          Device,
          $$DevicesTableFilterComposer,
          $$DevicesTableOrderingComposer,
          $$DevicesTableAnnotationComposer,
          $$DevicesTableCreateCompanionBuilder,
          $$DevicesTableUpdateCompanionBuilder,
          (Device, BaseReferences<_$HistoryDatabase, $DevicesTable, Device>),
          Device,
          PrefetchHooks Function()
        > {
  $$DevicesTableTableManager(_$HistoryDatabase db, $DevicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DevicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DevicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DevicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> currentMilliamps = const Value.absent(),
                Value<bool> supportsAutoPolarity = const Value.absent(),
              }) => DevicesCompanion(
                id: id,
                name: name,
                currentMilliamps: currentMilliamps,
                supportsAutoPolarity: supportsAutoPolarity,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required double currentMilliamps,
                Value<bool> supportsAutoPolarity = const Value.absent(),
              }) => DevicesCompanion.insert(
                id: id,
                name: name,
                currentMilliamps: currentMilliamps,
                supportsAutoPolarity: supportsAutoPolarity,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DevicesTableProcessedTableManager =
    ProcessedTableManager<
      _$HistoryDatabase,
      $DevicesTable,
      Device,
      $$DevicesTableFilterComposer,
      $$DevicesTableOrderingComposer,
      $$DevicesTableAnnotationComposer,
      $$DevicesTableCreateCompanionBuilder,
      $$DevicesTableUpdateCompanionBuilder,
      (Device, BaseReferences<_$HistoryDatabase, $DevicesTable, Device>),
      Device,
      PrefetchHooks Function()
    >;

class $HistoryDatabaseManager {
  final _$HistoryDatabase _db;
  $HistoryDatabaseManager(this._db);
  $$SessionRecordsTableTableManager get sessionRecords =>
      $$SessionRecordsTableTableManager(_db, _db.sessionRecords);
  $$DevicesTableTableManager get devices =>
      $$DevicesTableTableManager(_db, _db.devices);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(historyDatabase)
final historyDatabaseProvider = HistoryDatabaseProvider._();

final class HistoryDatabaseProvider
    extends
        $FunctionalProvider<HistoryDatabase, HistoryDatabase, HistoryDatabase>
    with $Provider<HistoryDatabase> {
  HistoryDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historyDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historyDatabaseHash();

  @$internal
  @override
  $ProviderElement<HistoryDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HistoryDatabase create(Ref ref) {
    return historyDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HistoryDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HistoryDatabase>(value),
    );
  }
}

String _$historyDatabaseHash() => r'adcd2a372642895805e38834d1dc43232b7a6bc2';
