// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class Profiles extends Table with TableInfo<Profiles, Profile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Profiles(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _birthYearMeta = const VerificationMeta(
    'birthYear',
  );
  late final GeneratedColumn<int> birthYear = GeneratedColumn<int>(
    'birth_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
    'sex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _activityLevelMeta = const VerificationMeta(
    'activityLevel',
  );
  late final GeneratedColumn<String> activityLevel = GeneratedColumn<String>(
    'activity_level',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _wakeTimeMeta = const VerificationMeta(
    'wakeTime',
  );
  late final GeneratedColumn<String> wakeTime = GeneratedColumn<String>(
    'wake_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _sleepTimeMeta = const VerificationMeta(
    'sleepTime',
  );
  late final GeneratedColumn<String> sleepTime = GeneratedColumn<String>(
    'sleep_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _timezoneMeta = const VerificationMeta(
    'timezone',
  );
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
    'timezone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _unitsMeta = const VerificationMeta('units');
  late final GeneratedColumn<String> units = GeneratedColumn<String>(
    'units',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'ml\'',
    defaultValue: const CustomExpression('\'ml\''),
  );
  static const VerificationMeta _localeMeta = const VerificationMeta('locale');
  late final GeneratedColumn<String> locale = GeneratedColumn<String>(
    'locale',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'en\'',
    defaultValue: const CustomExpression('\'en\''),
  );
  static const VerificationMeta _experienceMeta = const VerificationMeta(
    'experience',
  );
  late final GeneratedColumn<String> experience = GeneratedColumn<String>(
    'experience',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT \'normal\'',
    defaultValue: const CustomExpression('\'normal\''),
  );
  static const VerificationMeta _fluidRestrictionMlMeta =
      const VerificationMeta('fluidRestrictionMl');
  late final GeneratedColumn<int> fluidRestrictionMl = GeneratedColumn<int>(
    'fluid_restriction_ml',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _goalOverrideMlMeta = const VerificationMeta(
    'goalOverrideMl',
  );
  late final GeneratedColumn<int> goalOverrideMl = GeneratedColumn<int>(
    'goal_override_ml',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _adaptiveWeatherMeta = const VerificationMeta(
    'adaptiveWeather',
  );
  late final GeneratedColumn<bool> adaptiveWeather = GeneratedColumn<bool>(
    'adaptive_weather',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT TRUE',
    defaultValue: const CustomExpression('TRUE'),
  );
  static const VerificationMeta _adaptiveActivityMeta = const VerificationMeta(
    'adaptiveActivity',
  );
  late final GeneratedColumn<bool> adaptiveActivity = GeneratedColumn<bool>(
    'adaptive_activity',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT TRUE',
    defaultValue: const CustomExpression('TRUE'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    kind,
    displayName,
    birthYear,
    weightKg,
    sex,
    activityLevel,
    wakeTime,
    sleepTime,
    timezone,
    units,
    locale,
    experience,
    fluidRestrictionMl,
    goalOverrideMl,
    adaptiveWeather,
    adaptiveActivity,
    updatedAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Profile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('birth_year')) {
      context.handle(
        _birthYearMeta,
        birthYear.isAcceptableOrUnknown(data['birth_year']!, _birthYearMeta),
      );
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    }
    if (data.containsKey('sex')) {
      context.handle(
        _sexMeta,
        sex.isAcceptableOrUnknown(data['sex']!, _sexMeta),
      );
    }
    if (data.containsKey('activity_level')) {
      context.handle(
        _activityLevelMeta,
        activityLevel.isAcceptableOrUnknown(
          data['activity_level']!,
          _activityLevelMeta,
        ),
      );
    }
    if (data.containsKey('wake_time')) {
      context.handle(
        _wakeTimeMeta,
        wakeTime.isAcceptableOrUnknown(data['wake_time']!, _wakeTimeMeta),
      );
    }
    if (data.containsKey('sleep_time')) {
      context.handle(
        _sleepTimeMeta,
        sleepTime.isAcceptableOrUnknown(data['sleep_time']!, _sleepTimeMeta),
      );
    }
    if (data.containsKey('timezone')) {
      context.handle(
        _timezoneMeta,
        timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta),
      );
    } else if (isInserting) {
      context.missing(_timezoneMeta);
    }
    if (data.containsKey('units')) {
      context.handle(
        _unitsMeta,
        units.isAcceptableOrUnknown(data['units']!, _unitsMeta),
      );
    }
    if (data.containsKey('locale')) {
      context.handle(
        _localeMeta,
        locale.isAcceptableOrUnknown(data['locale']!, _localeMeta),
      );
    }
    if (data.containsKey('experience')) {
      context.handle(
        _experienceMeta,
        experience.isAcceptableOrUnknown(data['experience']!, _experienceMeta),
      );
    }
    if (data.containsKey('fluid_restriction_ml')) {
      context.handle(
        _fluidRestrictionMlMeta,
        fluidRestrictionMl.isAcceptableOrUnknown(
          data['fluid_restriction_ml']!,
          _fluidRestrictionMlMeta,
        ),
      );
    }
    if (data.containsKey('goal_override_ml')) {
      context.handle(
        _goalOverrideMlMeta,
        goalOverrideMl.isAcceptableOrUnknown(
          data['goal_override_ml']!,
          _goalOverrideMlMeta,
        ),
      );
    }
    if (data.containsKey('adaptive_weather')) {
      context.handle(
        _adaptiveWeatherMeta,
        adaptiveWeather.isAcceptableOrUnknown(
          data['adaptive_weather']!,
          _adaptiveWeatherMeta,
        ),
      );
    }
    if (data.containsKey('adaptive_activity')) {
      context.handle(
        _adaptiveActivityMeta,
        adaptiveActivity.isAcceptableOrUnknown(
          data['adaptive_activity']!,
          _adaptiveActivityMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Profile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      birthYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}birth_year'],
      ),
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      ),
      sex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sex'],
      ),
      activityLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}activity_level'],
      ),
      wakeTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wake_time'],
      ),
      sleepTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sleep_time'],
      ),
      timezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timezone'],
      )!,
      units: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}units'],
      )!,
      locale: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}locale'],
      )!,
      experience: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}experience'],
      )!,
      fluidRestrictionMl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fluid_restriction_ml'],
      ),
      goalOverrideMl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}goal_override_ml'],
      ),
      adaptiveWeather: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}adaptive_weather'],
      )!,
      adaptiveActivity: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}adaptive_activity'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  Profiles createAlias(String alias) {
    return Profiles(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Profile extends DataClass implements Insertable<Profile> {
  final String id;
  final String accountId;
  final String kind;
  final String displayName;
  final int? birthYear;
  final double? weightKg;
  final String? sex;
  final String? activityLevel;
  final String? wakeTime;
  final String? sleepTime;
  final String timezone;
  final String units;
  final String locale;
  final String experience;
  final int? fluidRestrictionMl;
  final int? goalOverrideMl;
  final bool adaptiveWeather;
  final bool adaptiveActivity;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const Profile({
    required this.id,
    required this.accountId,
    required this.kind,
    required this.displayName,
    this.birthYear,
    this.weightKg,
    this.sex,
    this.activityLevel,
    this.wakeTime,
    this.sleepTime,
    required this.timezone,
    required this.units,
    required this.locale,
    required this.experience,
    this.fluidRestrictionMl,
    this.goalOverrideMl,
    required this.adaptiveWeather,
    required this.adaptiveActivity,
    required this.updatedAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['account_id'] = Variable<String>(accountId);
    map['kind'] = Variable<String>(kind);
    map['display_name'] = Variable<String>(displayName);
    if (!nullToAbsent || birthYear != null) {
      map['birth_year'] = Variable<int>(birthYear);
    }
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    if (!nullToAbsent || sex != null) {
      map['sex'] = Variable<String>(sex);
    }
    if (!nullToAbsent || activityLevel != null) {
      map['activity_level'] = Variable<String>(activityLevel);
    }
    if (!nullToAbsent || wakeTime != null) {
      map['wake_time'] = Variable<String>(wakeTime);
    }
    if (!nullToAbsent || sleepTime != null) {
      map['sleep_time'] = Variable<String>(sleepTime);
    }
    map['timezone'] = Variable<String>(timezone);
    map['units'] = Variable<String>(units);
    map['locale'] = Variable<String>(locale);
    map['experience'] = Variable<String>(experience);
    if (!nullToAbsent || fluidRestrictionMl != null) {
      map['fluid_restriction_ml'] = Variable<int>(fluidRestrictionMl);
    }
    if (!nullToAbsent || goalOverrideMl != null) {
      map['goal_override_ml'] = Variable<int>(goalOverrideMl);
    }
    map['adaptive_weather'] = Variable<bool>(adaptiveWeather);
    map['adaptive_activity'] = Variable<bool>(adaptiveActivity);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: Value(id),
      accountId: Value(accountId),
      kind: Value(kind),
      displayName: Value(displayName),
      birthYear: birthYear == null && nullToAbsent
          ? const Value.absent()
          : Value(birthYear),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
      activityLevel: activityLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(activityLevel),
      wakeTime: wakeTime == null && nullToAbsent
          ? const Value.absent()
          : Value(wakeTime),
      sleepTime: sleepTime == null && nullToAbsent
          ? const Value.absent()
          : Value(sleepTime),
      timezone: Value(timezone),
      units: Value(units),
      locale: Value(locale),
      experience: Value(experience),
      fluidRestrictionMl: fluidRestrictionMl == null && nullToAbsent
          ? const Value.absent()
          : Value(fluidRestrictionMl),
      goalOverrideMl: goalOverrideMl == null && nullToAbsent
          ? const Value.absent()
          : Value(goalOverrideMl),
      adaptiveWeather: Value(adaptiveWeather),
      adaptiveActivity: Value(adaptiveActivity),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Profile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Profile(
      id: serializer.fromJson<String>(json['id']),
      accountId: serializer.fromJson<String>(json['account_id']),
      kind: serializer.fromJson<String>(json['kind']),
      displayName: serializer.fromJson<String>(json['display_name']),
      birthYear: serializer.fromJson<int?>(json['birth_year']),
      weightKg: serializer.fromJson<double?>(json['weight_kg']),
      sex: serializer.fromJson<String?>(json['sex']),
      activityLevel: serializer.fromJson<String?>(json['activity_level']),
      wakeTime: serializer.fromJson<String?>(json['wake_time']),
      sleepTime: serializer.fromJson<String?>(json['sleep_time']),
      timezone: serializer.fromJson<String>(json['timezone']),
      units: serializer.fromJson<String>(json['units']),
      locale: serializer.fromJson<String>(json['locale']),
      experience: serializer.fromJson<String>(json['experience']),
      fluidRestrictionMl: serializer.fromJson<int?>(
        json['fluid_restriction_ml'],
      ),
      goalOverrideMl: serializer.fromJson<int?>(json['goal_override_ml']),
      adaptiveWeather: serializer.fromJson<bool>(json['adaptive_weather']),
      adaptiveActivity: serializer.fromJson<bool>(json['adaptive_activity']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'account_id': serializer.toJson<String>(accountId),
      'kind': serializer.toJson<String>(kind),
      'display_name': serializer.toJson<String>(displayName),
      'birth_year': serializer.toJson<int?>(birthYear),
      'weight_kg': serializer.toJson<double?>(weightKg),
      'sex': serializer.toJson<String?>(sex),
      'activity_level': serializer.toJson<String?>(activityLevel),
      'wake_time': serializer.toJson<String?>(wakeTime),
      'sleep_time': serializer.toJson<String?>(sleepTime),
      'timezone': serializer.toJson<String>(timezone),
      'units': serializer.toJson<String>(units),
      'locale': serializer.toJson<String>(locale),
      'experience': serializer.toJson<String>(experience),
      'fluid_restriction_ml': serializer.toJson<int?>(fluidRestrictionMl),
      'goal_override_ml': serializer.toJson<int?>(goalOverrideMl),
      'adaptive_weather': serializer.toJson<bool>(adaptiveWeather),
      'adaptive_activity': serializer.toJson<bool>(adaptiveActivity),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Profile copyWith({
    String? id,
    String? accountId,
    String? kind,
    String? displayName,
    Value<int?> birthYear = const Value.absent(),
    Value<double?> weightKg = const Value.absent(),
    Value<String?> sex = const Value.absent(),
    Value<String?> activityLevel = const Value.absent(),
    Value<String?> wakeTime = const Value.absent(),
    Value<String?> sleepTime = const Value.absent(),
    String? timezone,
    String? units,
    String? locale,
    String? experience,
    Value<int?> fluidRestrictionMl = const Value.absent(),
    Value<int?> goalOverrideMl = const Value.absent(),
    bool? adaptiveWeather,
    bool? adaptiveActivity,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => Profile(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    kind: kind ?? this.kind,
    displayName: displayName ?? this.displayName,
    birthYear: birthYear.present ? birthYear.value : this.birthYear,
    weightKg: weightKg.present ? weightKg.value : this.weightKg,
    sex: sex.present ? sex.value : this.sex,
    activityLevel: activityLevel.present
        ? activityLevel.value
        : this.activityLevel,
    wakeTime: wakeTime.present ? wakeTime.value : this.wakeTime,
    sleepTime: sleepTime.present ? sleepTime.value : this.sleepTime,
    timezone: timezone ?? this.timezone,
    units: units ?? this.units,
    locale: locale ?? this.locale,
    experience: experience ?? this.experience,
    fluidRestrictionMl: fluidRestrictionMl.present
        ? fluidRestrictionMl.value
        : this.fluidRestrictionMl,
    goalOverrideMl: goalOverrideMl.present
        ? goalOverrideMl.value
        : this.goalOverrideMl,
    adaptiveWeather: adaptiveWeather ?? this.adaptiveWeather,
    adaptiveActivity: adaptiveActivity ?? this.adaptiveActivity,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  Profile copyWithCompanion(ProfilesCompanion data) {
    return Profile(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      kind: data.kind.present ? data.kind.value : this.kind,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      birthYear: data.birthYear.present ? data.birthYear.value : this.birthYear,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      sex: data.sex.present ? data.sex.value : this.sex,
      activityLevel: data.activityLevel.present
          ? data.activityLevel.value
          : this.activityLevel,
      wakeTime: data.wakeTime.present ? data.wakeTime.value : this.wakeTime,
      sleepTime: data.sleepTime.present ? data.sleepTime.value : this.sleepTime,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
      units: data.units.present ? data.units.value : this.units,
      locale: data.locale.present ? data.locale.value : this.locale,
      experience: data.experience.present
          ? data.experience.value
          : this.experience,
      fluidRestrictionMl: data.fluidRestrictionMl.present
          ? data.fluidRestrictionMl.value
          : this.fluidRestrictionMl,
      goalOverrideMl: data.goalOverrideMl.present
          ? data.goalOverrideMl.value
          : this.goalOverrideMl,
      adaptiveWeather: data.adaptiveWeather.present
          ? data.adaptiveWeather.value
          : this.adaptiveWeather,
      adaptiveActivity: data.adaptiveActivity.present
          ? data.adaptiveActivity.value
          : this.adaptiveActivity,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('kind: $kind, ')
          ..write('displayName: $displayName, ')
          ..write('birthYear: $birthYear, ')
          ..write('weightKg: $weightKg, ')
          ..write('sex: $sex, ')
          ..write('activityLevel: $activityLevel, ')
          ..write('wakeTime: $wakeTime, ')
          ..write('sleepTime: $sleepTime, ')
          ..write('timezone: $timezone, ')
          ..write('units: $units, ')
          ..write('locale: $locale, ')
          ..write('experience: $experience, ')
          ..write('fluidRestrictionMl: $fluidRestrictionMl, ')
          ..write('goalOverrideMl: $goalOverrideMl, ')
          ..write('adaptiveWeather: $adaptiveWeather, ')
          ..write('adaptiveActivity: $adaptiveActivity, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    accountId,
    kind,
    displayName,
    birthYear,
    weightKg,
    sex,
    activityLevel,
    wakeTime,
    sleepTime,
    timezone,
    units,
    locale,
    experience,
    fluidRestrictionMl,
    goalOverrideMl,
    adaptiveWeather,
    adaptiveActivity,
    updatedAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.kind == this.kind &&
          other.displayName == this.displayName &&
          other.birthYear == this.birthYear &&
          other.weightKg == this.weightKg &&
          other.sex == this.sex &&
          other.activityLevel == this.activityLevel &&
          other.wakeTime == this.wakeTime &&
          other.sleepTime == this.sleepTime &&
          other.timezone == this.timezone &&
          other.units == this.units &&
          other.locale == this.locale &&
          other.experience == this.experience &&
          other.fluidRestrictionMl == this.fluidRestrictionMl &&
          other.goalOverrideMl == this.goalOverrideMl &&
          other.adaptiveWeather == this.adaptiveWeather &&
          other.adaptiveActivity == this.adaptiveActivity &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<String> id;
  final Value<String> accountId;
  final Value<String> kind;
  final Value<String> displayName;
  final Value<int?> birthYear;
  final Value<double?> weightKg;
  final Value<String?> sex;
  final Value<String?> activityLevel;
  final Value<String?> wakeTime;
  final Value<String?> sleepTime;
  final Value<String> timezone;
  final Value<String> units;
  final Value<String> locale;
  final Value<String> experience;
  final Value<int?> fluidRestrictionMl;
  final Value<int?> goalOverrideMl;
  final Value<bool> adaptiveWeather;
  final Value<bool> adaptiveActivity;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.kind = const Value.absent(),
    this.displayName = const Value.absent(),
    this.birthYear = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.sex = const Value.absent(),
    this.activityLevel = const Value.absent(),
    this.wakeTime = const Value.absent(),
    this.sleepTime = const Value.absent(),
    this.timezone = const Value.absent(),
    this.units = const Value.absent(),
    this.locale = const Value.absent(),
    this.experience = const Value.absent(),
    this.fluidRestrictionMl = const Value.absent(),
    this.goalOverrideMl = const Value.absent(),
    this.adaptiveWeather = const Value.absent(),
    this.adaptiveActivity = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProfilesCompanion.insert({
    required String id,
    required String accountId,
    required String kind,
    required String displayName,
    this.birthYear = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.sex = const Value.absent(),
    this.activityLevel = const Value.absent(),
    this.wakeTime = const Value.absent(),
    this.sleepTime = const Value.absent(),
    required String timezone,
    this.units = const Value.absent(),
    this.locale = const Value.absent(),
    this.experience = const Value.absent(),
    this.fluidRestrictionMl = const Value.absent(),
    this.goalOverrideMl = const Value.absent(),
    this.adaptiveWeather = const Value.absent(),
    this.adaptiveActivity = const Value.absent(),
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       accountId = Value(accountId),
       kind = Value(kind),
       displayName = Value(displayName),
       timezone = Value(timezone),
       updatedAt = Value(updatedAt);
  static Insertable<Profile> custom({
    Expression<String>? id,
    Expression<String>? accountId,
    Expression<String>? kind,
    Expression<String>? displayName,
    Expression<int>? birthYear,
    Expression<double>? weightKg,
    Expression<String>? sex,
    Expression<String>? activityLevel,
    Expression<String>? wakeTime,
    Expression<String>? sleepTime,
    Expression<String>? timezone,
    Expression<String>? units,
    Expression<String>? locale,
    Expression<String>? experience,
    Expression<int>? fluidRestrictionMl,
    Expression<int>? goalOverrideMl,
    Expression<bool>? adaptiveWeather,
    Expression<bool>? adaptiveActivity,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (kind != null) 'kind': kind,
      if (displayName != null) 'display_name': displayName,
      if (birthYear != null) 'birth_year': birthYear,
      if (weightKg != null) 'weight_kg': weightKg,
      if (sex != null) 'sex': sex,
      if (activityLevel != null) 'activity_level': activityLevel,
      if (wakeTime != null) 'wake_time': wakeTime,
      if (sleepTime != null) 'sleep_time': sleepTime,
      if (timezone != null) 'timezone': timezone,
      if (units != null) 'units': units,
      if (locale != null) 'locale': locale,
      if (experience != null) 'experience': experience,
      if (fluidRestrictionMl != null)
        'fluid_restriction_ml': fluidRestrictionMl,
      if (goalOverrideMl != null) 'goal_override_ml': goalOverrideMl,
      if (adaptiveWeather != null) 'adaptive_weather': adaptiveWeather,
      if (adaptiveActivity != null) 'adaptive_activity': adaptiveActivity,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProfilesCompanion copyWith({
    Value<String>? id,
    Value<String>? accountId,
    Value<String>? kind,
    Value<String>? displayName,
    Value<int?>? birthYear,
    Value<double?>? weightKg,
    Value<String?>? sex,
    Value<String?>? activityLevel,
    Value<String?>? wakeTime,
    Value<String?>? sleepTime,
    Value<String>? timezone,
    Value<String>? units,
    Value<String>? locale,
    Value<String>? experience,
    Value<int?>? fluidRestrictionMl,
    Value<int?>? goalOverrideMl,
    Value<bool>? adaptiveWeather,
    Value<bool>? adaptiveActivity,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return ProfilesCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      kind: kind ?? this.kind,
      displayName: displayName ?? this.displayName,
      birthYear: birthYear ?? this.birthYear,
      weightKg: weightKg ?? this.weightKg,
      sex: sex ?? this.sex,
      activityLevel: activityLevel ?? this.activityLevel,
      wakeTime: wakeTime ?? this.wakeTime,
      sleepTime: sleepTime ?? this.sleepTime,
      timezone: timezone ?? this.timezone,
      units: units ?? this.units,
      locale: locale ?? this.locale,
      experience: experience ?? this.experience,
      fluidRestrictionMl: fluidRestrictionMl ?? this.fluidRestrictionMl,
      goalOverrideMl: goalOverrideMl ?? this.goalOverrideMl,
      adaptiveWeather: adaptiveWeather ?? this.adaptiveWeather,
      adaptiveActivity: adaptiveActivity ?? this.adaptiveActivity,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (birthYear.present) {
      map['birth_year'] = Variable<int>(birthYear.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (activityLevel.present) {
      map['activity_level'] = Variable<String>(activityLevel.value);
    }
    if (wakeTime.present) {
      map['wake_time'] = Variable<String>(wakeTime.value);
    }
    if (sleepTime.present) {
      map['sleep_time'] = Variable<String>(sleepTime.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (units.present) {
      map['units'] = Variable<String>(units.value);
    }
    if (locale.present) {
      map['locale'] = Variable<String>(locale.value);
    }
    if (experience.present) {
      map['experience'] = Variable<String>(experience.value);
    }
    if (fluidRestrictionMl.present) {
      map['fluid_restriction_ml'] = Variable<int>(fluidRestrictionMl.value);
    }
    if (goalOverrideMl.present) {
      map['goal_override_ml'] = Variable<int>(goalOverrideMl.value);
    }
    if (adaptiveWeather.present) {
      map['adaptive_weather'] = Variable<bool>(adaptiveWeather.value);
    }
    if (adaptiveActivity.present) {
      map['adaptive_activity'] = Variable<bool>(adaptiveActivity.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('kind: $kind, ')
          ..write('displayName: $displayName, ')
          ..write('birthYear: $birthYear, ')
          ..write('weightKg: $weightKg, ')
          ..write('sex: $sex, ')
          ..write('activityLevel: $activityLevel, ')
          ..write('wakeTime: $wakeTime, ')
          ..write('sleepTime: $sleepTime, ')
          ..write('timezone: $timezone, ')
          ..write('units: $units, ')
          ..write('locale: $locale, ')
          ..write('experience: $experience, ')
          ..write('fluidRestrictionMl: $fluidRestrictionMl, ')
          ..write('goalOverrideMl: $goalOverrideMl, ')
          ..write('adaptiveWeather: $adaptiveWeather, ')
          ..write('adaptiveActivity: $adaptiveActivity, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DrinkLogs extends Table with TableInfo<DrinkLogs, DrinkLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DrinkLogs(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  late final GeneratedColumn<String> profileId = GeneratedColumn<String>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _drinkIdMeta = const VerificationMeta(
    'drinkId',
  );
  late final GeneratedColumn<String> drinkId = GeneratedColumn<String>(
    'drink_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _volumeMlMeta = const VerificationMeta(
    'volumeMl',
  );
  late final GeneratedColumn<int> volumeMl = GeneratedColumn<int>(
    'volume_ml',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _hydrationMlMeta = const VerificationMeta(
    'hydrationMl',
  );
  late final GeneratedColumn<int> hydrationMl = GeneratedColumn<int>(
    'hydration_ml',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _caffeineMgMeta = const VerificationMeta(
    'caffeineMg',
  );
  late final GeneratedColumn<double> caffeineMg = GeneratedColumn<double>(
    'caffeine_mg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _sugarGMeta = const VerificationMeta('sugarG');
  late final GeneratedColumn<double> sugarG = GeneratedColumn<double>(
    'sugar_g',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    drinkId,
    volumeMl,
    hydrationMl,
    caffeineMg,
    sugarG,
    source,
    loggedAt,
    updatedAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drink_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DrinkLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('drink_id')) {
      context.handle(
        _drinkIdMeta,
        drinkId.isAcceptableOrUnknown(data['drink_id']!, _drinkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_drinkIdMeta);
    }
    if (data.containsKey('volume_ml')) {
      context.handle(
        _volumeMlMeta,
        volumeMl.isAcceptableOrUnknown(data['volume_ml']!, _volumeMlMeta),
      );
    } else if (isInserting) {
      context.missing(_volumeMlMeta);
    }
    if (data.containsKey('hydration_ml')) {
      context.handle(
        _hydrationMlMeta,
        hydrationMl.isAcceptableOrUnknown(
          data['hydration_ml']!,
          _hydrationMlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hydrationMlMeta);
    }
    if (data.containsKey('caffeine_mg')) {
      context.handle(
        _caffeineMgMeta,
        caffeineMg.isAcceptableOrUnknown(data['caffeine_mg']!, _caffeineMgMeta),
      );
    }
    if (data.containsKey('sugar_g')) {
      context.handle(
        _sugarGMeta,
        sugarG.isAcceptableOrUnknown(data['sugar_g']!, _sugarGMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DrinkLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DrinkLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_id'],
      )!,
      drinkId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}drink_id'],
      )!,
      volumeMl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}volume_ml'],
      )!,
      hydrationMl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hydration_ml'],
      )!,
      caffeineMg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}caffeine_mg'],
      ),
      sugarG: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sugar_g'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  DrinkLogs createAlias(String alias) {
    return DrinkLogs(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class DrinkLog extends DataClass implements Insertable<DrinkLog> {
  final String id;
  final String profileId;
  final String drinkId;
  final int volumeMl;
  final int hydrationMl;
  final double? caffeineMg;
  final double? sugarG;
  final String source;
  final DateTime loggedAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const DrinkLog({
    required this.id,
    required this.profileId,
    required this.drinkId,
    required this.volumeMl,
    required this.hydrationMl,
    this.caffeineMg,
    this.sugarG,
    required this.source,
    required this.loggedAt,
    required this.updatedAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['profile_id'] = Variable<String>(profileId);
    map['drink_id'] = Variable<String>(drinkId);
    map['volume_ml'] = Variable<int>(volumeMl);
    map['hydration_ml'] = Variable<int>(hydrationMl);
    if (!nullToAbsent || caffeineMg != null) {
      map['caffeine_mg'] = Variable<double>(caffeineMg);
    }
    if (!nullToAbsent || sugarG != null) {
      map['sugar_g'] = Variable<double>(sugarG);
    }
    map['source'] = Variable<String>(source);
    map['logged_at'] = Variable<DateTime>(loggedAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  DrinkLogsCompanion toCompanion(bool nullToAbsent) {
    return DrinkLogsCompanion(
      id: Value(id),
      profileId: Value(profileId),
      drinkId: Value(drinkId),
      volumeMl: Value(volumeMl),
      hydrationMl: Value(hydrationMl),
      caffeineMg: caffeineMg == null && nullToAbsent
          ? const Value.absent()
          : Value(caffeineMg),
      sugarG: sugarG == null && nullToAbsent
          ? const Value.absent()
          : Value(sugarG),
      source: Value(source),
      loggedAt: Value(loggedAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory DrinkLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DrinkLog(
      id: serializer.fromJson<String>(json['id']),
      profileId: serializer.fromJson<String>(json['profile_id']),
      drinkId: serializer.fromJson<String>(json['drink_id']),
      volumeMl: serializer.fromJson<int>(json['volume_ml']),
      hydrationMl: serializer.fromJson<int>(json['hydration_ml']),
      caffeineMg: serializer.fromJson<double?>(json['caffeine_mg']),
      sugarG: serializer.fromJson<double?>(json['sugar_g']),
      source: serializer.fromJson<String>(json['source']),
      loggedAt: serializer.fromJson<DateTime>(json['logged_at']),
      updatedAt: serializer.fromJson<DateTime>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'profile_id': serializer.toJson<String>(profileId),
      'drink_id': serializer.toJson<String>(drinkId),
      'volume_ml': serializer.toJson<int>(volumeMl),
      'hydration_ml': serializer.toJson<int>(hydrationMl),
      'caffeine_mg': serializer.toJson<double?>(caffeineMg),
      'sugar_g': serializer.toJson<double?>(sugarG),
      'source': serializer.toJson<String>(source),
      'logged_at': serializer.toJson<DateTime>(loggedAt),
      'updated_at': serializer.toJson<DateTime>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  DrinkLog copyWith({
    String? id,
    String? profileId,
    String? drinkId,
    int? volumeMl,
    int? hydrationMl,
    Value<double?> caffeineMg = const Value.absent(),
    Value<double?> sugarG = const Value.absent(),
    String? source,
    DateTime? loggedAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => DrinkLog(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    drinkId: drinkId ?? this.drinkId,
    volumeMl: volumeMl ?? this.volumeMl,
    hydrationMl: hydrationMl ?? this.hydrationMl,
    caffeineMg: caffeineMg.present ? caffeineMg.value : this.caffeineMg,
    sugarG: sugarG.present ? sugarG.value : this.sugarG,
    source: source ?? this.source,
    loggedAt: loggedAt ?? this.loggedAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  DrinkLog copyWithCompanion(DrinkLogsCompanion data) {
    return DrinkLog(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      drinkId: data.drinkId.present ? data.drinkId.value : this.drinkId,
      volumeMl: data.volumeMl.present ? data.volumeMl.value : this.volumeMl,
      hydrationMl: data.hydrationMl.present
          ? data.hydrationMl.value
          : this.hydrationMl,
      caffeineMg: data.caffeineMg.present
          ? data.caffeineMg.value
          : this.caffeineMg,
      sugarG: data.sugarG.present ? data.sugarG.value : this.sugarG,
      source: data.source.present ? data.source.value : this.source,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DrinkLog(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('drinkId: $drinkId, ')
          ..write('volumeMl: $volumeMl, ')
          ..write('hydrationMl: $hydrationMl, ')
          ..write('caffeineMg: $caffeineMg, ')
          ..write('sugarG: $sugarG, ')
          ..write('source: $source, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    profileId,
    drinkId,
    volumeMl,
    hydrationMl,
    caffeineMg,
    sugarG,
    source,
    loggedAt,
    updatedAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DrinkLog &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.drinkId == this.drinkId &&
          other.volumeMl == this.volumeMl &&
          other.hydrationMl == this.hydrationMl &&
          other.caffeineMg == this.caffeineMg &&
          other.sugarG == this.sugarG &&
          other.source == this.source &&
          other.loggedAt == this.loggedAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class DrinkLogsCompanion extends UpdateCompanion<DrinkLog> {
  final Value<String> id;
  final Value<String> profileId;
  final Value<String> drinkId;
  final Value<int> volumeMl;
  final Value<int> hydrationMl;
  final Value<double?> caffeineMg;
  final Value<double?> sugarG;
  final Value<String> source;
  final Value<DateTime> loggedAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const DrinkLogsCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.drinkId = const Value.absent(),
    this.volumeMl = const Value.absent(),
    this.hydrationMl = const Value.absent(),
    this.caffeineMg = const Value.absent(),
    this.sugarG = const Value.absent(),
    this.source = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DrinkLogsCompanion.insert({
    required String id,
    required String profileId,
    required String drinkId,
    required int volumeMl,
    required int hydrationMl,
    this.caffeineMg = const Value.absent(),
    this.sugarG = const Value.absent(),
    required String source,
    required DateTime loggedAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       profileId = Value(profileId),
       drinkId = Value(drinkId),
       volumeMl = Value(volumeMl),
       hydrationMl = Value(hydrationMl),
       source = Value(source),
       loggedAt = Value(loggedAt),
       updatedAt = Value(updatedAt);
  static Insertable<DrinkLog> custom({
    Expression<String>? id,
    Expression<String>? profileId,
    Expression<String>? drinkId,
    Expression<int>? volumeMl,
    Expression<int>? hydrationMl,
    Expression<double>? caffeineMg,
    Expression<double>? sugarG,
    Expression<String>? source,
    Expression<DateTime>? loggedAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (drinkId != null) 'drink_id': drinkId,
      if (volumeMl != null) 'volume_ml': volumeMl,
      if (hydrationMl != null) 'hydration_ml': hydrationMl,
      if (caffeineMg != null) 'caffeine_mg': caffeineMg,
      if (sugarG != null) 'sugar_g': sugarG,
      if (source != null) 'source': source,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DrinkLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? profileId,
    Value<String>? drinkId,
    Value<int>? volumeMl,
    Value<int>? hydrationMl,
    Value<double?>? caffeineMg,
    Value<double?>? sugarG,
    Value<String>? source,
    Value<DateTime>? loggedAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return DrinkLogsCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      drinkId: drinkId ?? this.drinkId,
      volumeMl: volumeMl ?? this.volumeMl,
      hydrationMl: hydrationMl ?? this.hydrationMl,
      caffeineMg: caffeineMg ?? this.caffeineMg,
      sugarG: sugarG ?? this.sugarG,
      source: source ?? this.source,
      loggedAt: loggedAt ?? this.loggedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<String>(profileId.value);
    }
    if (drinkId.present) {
      map['drink_id'] = Variable<String>(drinkId.value);
    }
    if (volumeMl.present) {
      map['volume_ml'] = Variable<int>(volumeMl.value);
    }
    if (hydrationMl.present) {
      map['hydration_ml'] = Variable<int>(hydrationMl.value);
    }
    if (caffeineMg.present) {
      map['caffeine_mg'] = Variable<double>(caffeineMg.value);
    }
    if (sugarG.present) {
      map['sugar_g'] = Variable<double>(sugarG.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DrinkLogsCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('drinkId: $drinkId, ')
          ..write('volumeMl: $volumeMl, ')
          ..write('hydrationMl: $hydrationMl, ')
          ..write('caffeineMg: $caffeineMg, ')
          ..write('sugarG: $sugarG, ')
          ..write('source: $source, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CustomDrinks extends Table with TableInfo<CustomDrinks, CustomDrink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CustomDrinks(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _waterPctMeta = const VerificationMeta(
    'waterPct',
  );
  late final GeneratedColumn<double> waterPct = GeneratedColumn<double>(
    'water_pct',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _sugarG100mlMeta = const VerificationMeta(
    'sugarG100ml',
  );
  late final GeneratedColumn<double> sugarG100ml = GeneratedColumn<double>(
    'sugar_g_100ml',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _caffeineMg100mlMeta = const VerificationMeta(
    'caffeineMg100ml',
  );
  late final GeneratedColumn<double> caffeineMg100ml = GeneratedColumn<double>(
    'caffeine_mg_100ml',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    name,
    icon,
    waterPct,
    sugarG100ml,
    caffeineMg100ml,
    updatedAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_drinks';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomDrink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    if (data.containsKey('water_pct')) {
      context.handle(
        _waterPctMeta,
        waterPct.isAcceptableOrUnknown(data['water_pct']!, _waterPctMeta),
      );
    }
    if (data.containsKey('sugar_g_100ml')) {
      context.handle(
        _sugarG100mlMeta,
        sugarG100ml.isAcceptableOrUnknown(
          data['sugar_g_100ml']!,
          _sugarG100mlMeta,
        ),
      );
    }
    if (data.containsKey('caffeine_mg_100ml')) {
      context.handle(
        _caffeineMg100mlMeta,
        caffeineMg100ml.isAcceptableOrUnknown(
          data['caffeine_mg_100ml']!,
          _caffeineMg100mlMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomDrink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomDrink(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      ),
      waterPct: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}water_pct'],
      ),
      sugarG100ml: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sugar_g_100ml'],
      ),
      caffeineMg100ml: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}caffeine_mg_100ml'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  CustomDrinks createAlias(String alias) {
    return CustomDrinks(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CustomDrink extends DataClass implements Insertable<CustomDrink> {
  final String id;
  final String? accountId;
  final String? name;
  final String? icon;
  final double? waterPct;
  final double? sugarG100ml;
  final double? caffeineMg100ml;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  const CustomDrink({
    required this.id,
    this.accountId,
    this.name,
    this.icon,
    this.waterPct,
    this.sugarG100ml,
    this.caffeineMg100ml,
    this.updatedAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || accountId != null) {
      map['account_id'] = Variable<String>(accountId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    if (!nullToAbsent || waterPct != null) {
      map['water_pct'] = Variable<double>(waterPct);
    }
    if (!nullToAbsent || sugarG100ml != null) {
      map['sugar_g_100ml'] = Variable<double>(sugarG100ml);
    }
    if (!nullToAbsent || caffeineMg100ml != null) {
      map['caffeine_mg_100ml'] = Variable<double>(caffeineMg100ml);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  CustomDrinksCompanion toCompanion(bool nullToAbsent) {
    return CustomDrinksCompanion(
      id: Value(id),
      accountId: accountId == null && nullToAbsent
          ? const Value.absent()
          : Value(accountId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      waterPct: waterPct == null && nullToAbsent
          ? const Value.absent()
          : Value(waterPct),
      sugarG100ml: sugarG100ml == null && nullToAbsent
          ? const Value.absent()
          : Value(sugarG100ml),
      caffeineMg100ml: caffeineMg100ml == null && nullToAbsent
          ? const Value.absent()
          : Value(caffeineMg100ml),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory CustomDrink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomDrink(
      id: serializer.fromJson<String>(json['id']),
      accountId: serializer.fromJson<String?>(json['account_id']),
      name: serializer.fromJson<String?>(json['name']),
      icon: serializer.fromJson<String?>(json['icon']),
      waterPct: serializer.fromJson<double?>(json['water_pct']),
      sugarG100ml: serializer.fromJson<double?>(json['sugar_g_100ml']),
      caffeineMg100ml: serializer.fromJson<double?>(json['caffeine_mg_100ml']),
      updatedAt: serializer.fromJson<DateTime?>(json['updated_at']),
      deletedAt: serializer.fromJson<DateTime?>(json['deleted_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'account_id': serializer.toJson<String?>(accountId),
      'name': serializer.toJson<String?>(name),
      'icon': serializer.toJson<String?>(icon),
      'water_pct': serializer.toJson<double?>(waterPct),
      'sugar_g_100ml': serializer.toJson<double?>(sugarG100ml),
      'caffeine_mg_100ml': serializer.toJson<double?>(caffeineMg100ml),
      'updated_at': serializer.toJson<DateTime?>(updatedAt),
      'deleted_at': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  CustomDrink copyWith({
    String? id,
    Value<String?> accountId = const Value.absent(),
    Value<String?> name = const Value.absent(),
    Value<String?> icon = const Value.absent(),
    Value<double?> waterPct = const Value.absent(),
    Value<double?> sugarG100ml = const Value.absent(),
    Value<double?> caffeineMg100ml = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => CustomDrink(
    id: id ?? this.id,
    accountId: accountId.present ? accountId.value : this.accountId,
    name: name.present ? name.value : this.name,
    icon: icon.present ? icon.value : this.icon,
    waterPct: waterPct.present ? waterPct.value : this.waterPct,
    sugarG100ml: sugarG100ml.present ? sugarG100ml.value : this.sugarG100ml,
    caffeineMg100ml: caffeineMg100ml.present
        ? caffeineMg100ml.value
        : this.caffeineMg100ml,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  CustomDrink copyWithCompanion(CustomDrinksCompanion data) {
    return CustomDrink(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
      waterPct: data.waterPct.present ? data.waterPct.value : this.waterPct,
      sugarG100ml: data.sugarG100ml.present
          ? data.sugarG100ml.value
          : this.sugarG100ml,
      caffeineMg100ml: data.caffeineMg100ml.present
          ? data.caffeineMg100ml.value
          : this.caffeineMg100ml,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomDrink(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('waterPct: $waterPct, ')
          ..write('sugarG100ml: $sugarG100ml, ')
          ..write('caffeineMg100ml: $caffeineMg100ml, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    accountId,
    name,
    icon,
    waterPct,
    sugarG100ml,
    caffeineMg100ml,
    updatedAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomDrink &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.waterPct == this.waterPct &&
          other.sugarG100ml == this.sugarG100ml &&
          other.caffeineMg100ml == this.caffeineMg100ml &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class CustomDrinksCompanion extends UpdateCompanion<CustomDrink> {
  final Value<String> id;
  final Value<String?> accountId;
  final Value<String?> name;
  final Value<String?> icon;
  final Value<double?> waterPct;
  final Value<double?> sugarG100ml;
  final Value<double?> caffeineMg100ml;
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const CustomDrinksCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.waterPct = const Value.absent(),
    this.sugarG100ml = const Value.absent(),
    this.caffeineMg100ml = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomDrinksCompanion.insert({
    required String id,
    this.accountId = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.waterPct = const Value.absent(),
    this.sugarG100ml = const Value.absent(),
    this.caffeineMg100ml = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<CustomDrink> custom({
    Expression<String>? id,
    Expression<String>? accountId,
    Expression<String>? name,
    Expression<String>? icon,
    Expression<double>? waterPct,
    Expression<double>? sugarG100ml,
    Expression<double>? caffeineMg100ml,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (waterPct != null) 'water_pct': waterPct,
      if (sugarG100ml != null) 'sugar_g_100ml': sugarG100ml,
      if (caffeineMg100ml != null) 'caffeine_mg_100ml': caffeineMg100ml,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CustomDrinksCompanion copyWith({
    Value<String>? id,
    Value<String?>? accountId,
    Value<String?>? name,
    Value<String?>? icon,
    Value<double?>? waterPct,
    Value<double?>? sugarG100ml,
    Value<double?>? caffeineMg100ml,
    Value<DateTime?>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<int>? rowid,
  }) {
    return CustomDrinksCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      waterPct: waterPct ?? this.waterPct,
      sugarG100ml: sugarG100ml ?? this.sugarG100ml,
      caffeineMg100ml: caffeineMg100ml ?? this.caffeineMg100ml,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (waterPct.present) {
      map['water_pct'] = Variable<double>(waterPct.value);
    }
    if (sugarG100ml.present) {
      map['sugar_g_100ml'] = Variable<double>(sugarG100ml.value);
    }
    if (caffeineMg100ml.present) {
      map['caffeine_mg_100ml'] = Variable<double>(caffeineMg100ml.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomDrinksCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('waterPct: $waterPct, ')
          ..write('sugarG100ml: $sugarG100ml, ')
          ..write('caffeineMg100ml: $caffeineMg100ml, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DailyGoals extends Table with TableInfo<DailyGoals, DailyGoal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DailyGoals(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  late final GeneratedColumn<String> profileId = GeneratedColumn<String>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  late final GeneratedColumn<String> day = GeneratedColumn<String>(
    'day',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _baseMlMeta = const VerificationMeta('baseMl');
  late final GeneratedColumn<int> baseMl = GeneratedColumn<int>(
    'base_ml',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _weatherMlMeta = const VerificationMeta(
    'weatherMl',
  );
  late final GeneratedColumn<int> weatherMl = GeneratedColumn<int>(
    'weather_ml',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _activityMlMeta = const VerificationMeta(
    'activityMl',
  );
  late final GeneratedColumn<int> activityMl = GeneratedColumn<int>(
    'activity_ml',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _finalMlMeta = const VerificationMeta(
    'finalMl',
  );
  late final GeneratedColumn<int> finalMl = GeneratedColumn<int>(
    'final_ml',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    profileId,
    day,
    baseMl,
    weatherMl,
    activityMl,
    finalMl,
    reason,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyGoal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('day')) {
      context.handle(
        _dayMeta,
        day.isAcceptableOrUnknown(data['day']!, _dayMeta),
      );
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('base_ml')) {
      context.handle(
        _baseMlMeta,
        baseMl.isAcceptableOrUnknown(data['base_ml']!, _baseMlMeta),
      );
    }
    if (data.containsKey('weather_ml')) {
      context.handle(
        _weatherMlMeta,
        weatherMl.isAcceptableOrUnknown(data['weather_ml']!, _weatherMlMeta),
      );
    }
    if (data.containsKey('activity_ml')) {
      context.handle(
        _activityMlMeta,
        activityMl.isAcceptableOrUnknown(data['activity_ml']!, _activityMlMeta),
      );
    }
    if (data.containsKey('final_ml')) {
      context.handle(
        _finalMlMeta,
        finalMl.isAcceptableOrUnknown(data['final_ml']!, _finalMlMeta),
      );
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {profileId, day};
  @override
  DailyGoal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyGoal(
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_id'],
      )!,
      day: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day'],
      )!,
      baseMl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_ml'],
      ),
      weatherMl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weather_ml'],
      ),
      activityMl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}activity_ml'],
      ),
      finalMl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}final_ml'],
      ),
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      ),
    );
  }

  @override
  DailyGoals createAlias(String alias) {
    return DailyGoals(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY(profile_id, day)'];
  @override
  bool get dontWriteConstraints => true;
}

class DailyGoal extends DataClass implements Insertable<DailyGoal> {
  final String profileId;
  final String day;
  final int? baseMl;
  final int? weatherMl;
  final int? activityMl;
  final int? finalMl;
  final String? reason;
  const DailyGoal({
    required this.profileId,
    required this.day,
    this.baseMl,
    this.weatherMl,
    this.activityMl,
    this.finalMl,
    this.reason,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['profile_id'] = Variable<String>(profileId);
    map['day'] = Variable<String>(day);
    if (!nullToAbsent || baseMl != null) {
      map['base_ml'] = Variable<int>(baseMl);
    }
    if (!nullToAbsent || weatherMl != null) {
      map['weather_ml'] = Variable<int>(weatherMl);
    }
    if (!nullToAbsent || activityMl != null) {
      map['activity_ml'] = Variable<int>(activityMl);
    }
    if (!nullToAbsent || finalMl != null) {
      map['final_ml'] = Variable<int>(finalMl);
    }
    if (!nullToAbsent || reason != null) {
      map['reason'] = Variable<String>(reason);
    }
    return map;
  }

  DailyGoalsCompanion toCompanion(bool nullToAbsent) {
    return DailyGoalsCompanion(
      profileId: Value(profileId),
      day: Value(day),
      baseMl: baseMl == null && nullToAbsent
          ? const Value.absent()
          : Value(baseMl),
      weatherMl: weatherMl == null && nullToAbsent
          ? const Value.absent()
          : Value(weatherMl),
      activityMl: activityMl == null && nullToAbsent
          ? const Value.absent()
          : Value(activityMl),
      finalMl: finalMl == null && nullToAbsent
          ? const Value.absent()
          : Value(finalMl),
      reason: reason == null && nullToAbsent
          ? const Value.absent()
          : Value(reason),
    );
  }

  factory DailyGoal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyGoal(
      profileId: serializer.fromJson<String>(json['profile_id']),
      day: serializer.fromJson<String>(json['day']),
      baseMl: serializer.fromJson<int?>(json['base_ml']),
      weatherMl: serializer.fromJson<int?>(json['weather_ml']),
      activityMl: serializer.fromJson<int?>(json['activity_ml']),
      finalMl: serializer.fromJson<int?>(json['final_ml']),
      reason: serializer.fromJson<String?>(json['reason']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'profile_id': serializer.toJson<String>(profileId),
      'day': serializer.toJson<String>(day),
      'base_ml': serializer.toJson<int?>(baseMl),
      'weather_ml': serializer.toJson<int?>(weatherMl),
      'activity_ml': serializer.toJson<int?>(activityMl),
      'final_ml': serializer.toJson<int?>(finalMl),
      'reason': serializer.toJson<String?>(reason),
    };
  }

  DailyGoal copyWith({
    String? profileId,
    String? day,
    Value<int?> baseMl = const Value.absent(),
    Value<int?> weatherMl = const Value.absent(),
    Value<int?> activityMl = const Value.absent(),
    Value<int?> finalMl = const Value.absent(),
    Value<String?> reason = const Value.absent(),
  }) => DailyGoal(
    profileId: profileId ?? this.profileId,
    day: day ?? this.day,
    baseMl: baseMl.present ? baseMl.value : this.baseMl,
    weatherMl: weatherMl.present ? weatherMl.value : this.weatherMl,
    activityMl: activityMl.present ? activityMl.value : this.activityMl,
    finalMl: finalMl.present ? finalMl.value : this.finalMl,
    reason: reason.present ? reason.value : this.reason,
  );
  DailyGoal copyWithCompanion(DailyGoalsCompanion data) {
    return DailyGoal(
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      day: data.day.present ? data.day.value : this.day,
      baseMl: data.baseMl.present ? data.baseMl.value : this.baseMl,
      weatherMl: data.weatherMl.present ? data.weatherMl.value : this.weatherMl,
      activityMl: data.activityMl.present
          ? data.activityMl.value
          : this.activityMl,
      finalMl: data.finalMl.present ? data.finalMl.value : this.finalMl,
      reason: data.reason.present ? data.reason.value : this.reason,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyGoal(')
          ..write('profileId: $profileId, ')
          ..write('day: $day, ')
          ..write('baseMl: $baseMl, ')
          ..write('weatherMl: $weatherMl, ')
          ..write('activityMl: $activityMl, ')
          ..write('finalMl: $finalMl, ')
          ..write('reason: $reason')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    profileId,
    day,
    baseMl,
    weatherMl,
    activityMl,
    finalMl,
    reason,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyGoal &&
          other.profileId == this.profileId &&
          other.day == this.day &&
          other.baseMl == this.baseMl &&
          other.weatherMl == this.weatherMl &&
          other.activityMl == this.activityMl &&
          other.finalMl == this.finalMl &&
          other.reason == this.reason);
}

class DailyGoalsCompanion extends UpdateCompanion<DailyGoal> {
  final Value<String> profileId;
  final Value<String> day;
  final Value<int?> baseMl;
  final Value<int?> weatherMl;
  final Value<int?> activityMl;
  final Value<int?> finalMl;
  final Value<String?> reason;
  final Value<int> rowid;
  const DailyGoalsCompanion({
    this.profileId = const Value.absent(),
    this.day = const Value.absent(),
    this.baseMl = const Value.absent(),
    this.weatherMl = const Value.absent(),
    this.activityMl = const Value.absent(),
    this.finalMl = const Value.absent(),
    this.reason = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyGoalsCompanion.insert({
    required String profileId,
    required String day,
    this.baseMl = const Value.absent(),
    this.weatherMl = const Value.absent(),
    this.activityMl = const Value.absent(),
    this.finalMl = const Value.absent(),
    this.reason = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : profileId = Value(profileId),
       day = Value(day);
  static Insertable<DailyGoal> custom({
    Expression<String>? profileId,
    Expression<String>? day,
    Expression<int>? baseMl,
    Expression<int>? weatherMl,
    Expression<int>? activityMl,
    Expression<int>? finalMl,
    Expression<String>? reason,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (profileId != null) 'profile_id': profileId,
      if (day != null) 'day': day,
      if (baseMl != null) 'base_ml': baseMl,
      if (weatherMl != null) 'weather_ml': weatherMl,
      if (activityMl != null) 'activity_ml': activityMl,
      if (finalMl != null) 'final_ml': finalMl,
      if (reason != null) 'reason': reason,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyGoalsCompanion copyWith({
    Value<String>? profileId,
    Value<String>? day,
    Value<int?>? baseMl,
    Value<int?>? weatherMl,
    Value<int?>? activityMl,
    Value<int?>? finalMl,
    Value<String?>? reason,
    Value<int>? rowid,
  }) {
    return DailyGoalsCompanion(
      profileId: profileId ?? this.profileId,
      day: day ?? this.day,
      baseMl: baseMl ?? this.baseMl,
      weatherMl: weatherMl ?? this.weatherMl,
      activityMl: activityMl ?? this.activityMl,
      finalMl: finalMl ?? this.finalMl,
      reason: reason ?? this.reason,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (profileId.present) {
      map['profile_id'] = Variable<String>(profileId.value);
    }
    if (day.present) {
      map['day'] = Variable<String>(day.value);
    }
    if (baseMl.present) {
      map['base_ml'] = Variable<int>(baseMl.value);
    }
    if (weatherMl.present) {
      map['weather_ml'] = Variable<int>(weatherMl.value);
    }
    if (activityMl.present) {
      map['activity_ml'] = Variable<int>(activityMl.value);
    }
    if (finalMl.present) {
      map['final_ml'] = Variable<int>(finalMl.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyGoalsCompanion(')
          ..write('profileId: $profileId, ')
          ..write('day: $day, ')
          ..write('baseMl: $baseMl, ')
          ..write('weatherMl: $weatherMl, ')
          ..write('activityMl: $activityMl, ')
          ..write('finalMl: $finalMl, ')
          ..write('reason: $reason, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ReminderSettings extends Table
    with TableInfo<ReminderSettings, ReminderSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ReminderSettings(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  late final GeneratedColumn<String> profileId = GeneratedColumn<String>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
    'mode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _intervalMinMeta = const VerificationMeta(
    'intervalMin',
  );
  late final GeneratedColumn<int> intervalMin = GeneratedColumn<int>(
    'interval_min',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _fixedTimesMeta = const VerificationMeta(
    'fixedTimes',
  );
  late final GeneratedColumn<String> fixedTimes = GeneratedColumn<String>(
    'fixed_times',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _weekdaysMeta = const VerificationMeta(
    'weekdays',
  );
  late final GeneratedColumn<String> weekdays = GeneratedColumn<String>(
    'weekdays',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _quietStartMeta = const VerificationMeta(
    'quietStart',
  );
  late final GeneratedColumn<String> quietStart = GeneratedColumn<String>(
    'quiet_start',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _quietEndMeta = const VerificationMeta(
    'quietEnd',
  );
  late final GeneratedColumn<String> quietEnd = GeneratedColumn<String>(
    'quiet_end',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _skipIfLoggedMinMeta = const VerificationMeta(
    'skipIfLoggedMin',
  );
  late final GeneratedColumn<int> skipIfLoggedMin = GeneratedColumn<int>(
    'skip_if_logged_min',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'DEFAULT 30',
    defaultValue: const CustomExpression('30'),
  );
  static const VerificationMeta _vibrationPatternMeta = const VerificationMeta(
    'vibrationPattern',
  );
  late final GeneratedColumn<String> vibrationPattern = GeneratedColumn<String>(
    'vibration_pattern',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _textStyleMeta = const VerificationMeta(
    'textStyle',
  );
  late final GeneratedColumn<String> textStyle = GeneratedColumn<String>(
    'text_style',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    profileId,
    mode,
    intervalMin,
    fixedTimes,
    weekdays,
    quietStart,
    quietEnd,
    skipIfLoggedMin,
    vibrationPattern,
    textStyle,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminder_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReminderSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('mode')) {
      context.handle(
        _modeMeta,
        mode.isAcceptableOrUnknown(data['mode']!, _modeMeta),
      );
    }
    if (data.containsKey('interval_min')) {
      context.handle(
        _intervalMinMeta,
        intervalMin.isAcceptableOrUnknown(
          data['interval_min']!,
          _intervalMinMeta,
        ),
      );
    }
    if (data.containsKey('fixed_times')) {
      context.handle(
        _fixedTimesMeta,
        fixedTimes.isAcceptableOrUnknown(data['fixed_times']!, _fixedTimesMeta),
      );
    }
    if (data.containsKey('weekdays')) {
      context.handle(
        _weekdaysMeta,
        weekdays.isAcceptableOrUnknown(data['weekdays']!, _weekdaysMeta),
      );
    }
    if (data.containsKey('quiet_start')) {
      context.handle(
        _quietStartMeta,
        quietStart.isAcceptableOrUnknown(data['quiet_start']!, _quietStartMeta),
      );
    }
    if (data.containsKey('quiet_end')) {
      context.handle(
        _quietEndMeta,
        quietEnd.isAcceptableOrUnknown(data['quiet_end']!, _quietEndMeta),
      );
    }
    if (data.containsKey('skip_if_logged_min')) {
      context.handle(
        _skipIfLoggedMinMeta,
        skipIfLoggedMin.isAcceptableOrUnknown(
          data['skip_if_logged_min']!,
          _skipIfLoggedMinMeta,
        ),
      );
    }
    if (data.containsKey('vibration_pattern')) {
      context.handle(
        _vibrationPatternMeta,
        vibrationPattern.isAcceptableOrUnknown(
          data['vibration_pattern']!,
          _vibrationPatternMeta,
        ),
      );
    }
    if (data.containsKey('text_style')) {
      context.handle(
        _textStyleMeta,
        textStyle.isAcceptableOrUnknown(data['text_style']!, _textStyleMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {profileId};
  @override
  ReminderSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderSetting(
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_id'],
      )!,
      mode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mode'],
      ),
      intervalMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interval_min'],
      ),
      fixedTimes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fixed_times'],
      ),
      weekdays: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weekdays'],
      ),
      quietStart: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quiet_start'],
      ),
      quietEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quiet_end'],
      ),
      skipIfLoggedMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}skip_if_logged_min'],
      ),
      vibrationPattern: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vibration_pattern'],
      ),
      textStyle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_style'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  ReminderSettings createAlias(String alias) {
    return ReminderSettings(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ReminderSetting extends DataClass implements Insertable<ReminderSetting> {
  final String profileId;
  final String? mode;
  final int? intervalMin;
  final String? fixedTimes;
  final String? weekdays;
  final String? quietStart;
  final String? quietEnd;
  final int? skipIfLoggedMin;
  final String? vibrationPattern;
  final String? textStyle;
  final DateTime? updatedAt;
  const ReminderSetting({
    required this.profileId,
    this.mode,
    this.intervalMin,
    this.fixedTimes,
    this.weekdays,
    this.quietStart,
    this.quietEnd,
    this.skipIfLoggedMin,
    this.vibrationPattern,
    this.textStyle,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['profile_id'] = Variable<String>(profileId);
    if (!nullToAbsent || mode != null) {
      map['mode'] = Variable<String>(mode);
    }
    if (!nullToAbsent || intervalMin != null) {
      map['interval_min'] = Variable<int>(intervalMin);
    }
    if (!nullToAbsent || fixedTimes != null) {
      map['fixed_times'] = Variable<String>(fixedTimes);
    }
    if (!nullToAbsent || weekdays != null) {
      map['weekdays'] = Variable<String>(weekdays);
    }
    if (!nullToAbsent || quietStart != null) {
      map['quiet_start'] = Variable<String>(quietStart);
    }
    if (!nullToAbsent || quietEnd != null) {
      map['quiet_end'] = Variable<String>(quietEnd);
    }
    if (!nullToAbsent || skipIfLoggedMin != null) {
      map['skip_if_logged_min'] = Variable<int>(skipIfLoggedMin);
    }
    if (!nullToAbsent || vibrationPattern != null) {
      map['vibration_pattern'] = Variable<String>(vibrationPattern);
    }
    if (!nullToAbsent || textStyle != null) {
      map['text_style'] = Variable<String>(textStyle);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  ReminderSettingsCompanion toCompanion(bool nullToAbsent) {
    return ReminderSettingsCompanion(
      profileId: Value(profileId),
      mode: mode == null && nullToAbsent ? const Value.absent() : Value(mode),
      intervalMin: intervalMin == null && nullToAbsent
          ? const Value.absent()
          : Value(intervalMin),
      fixedTimes: fixedTimes == null && nullToAbsent
          ? const Value.absent()
          : Value(fixedTimes),
      weekdays: weekdays == null && nullToAbsent
          ? const Value.absent()
          : Value(weekdays),
      quietStart: quietStart == null && nullToAbsent
          ? const Value.absent()
          : Value(quietStart),
      quietEnd: quietEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(quietEnd),
      skipIfLoggedMin: skipIfLoggedMin == null && nullToAbsent
          ? const Value.absent()
          : Value(skipIfLoggedMin),
      vibrationPattern: vibrationPattern == null && nullToAbsent
          ? const Value.absent()
          : Value(vibrationPattern),
      textStyle: textStyle == null && nullToAbsent
          ? const Value.absent()
          : Value(textStyle),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory ReminderSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderSetting(
      profileId: serializer.fromJson<String>(json['profile_id']),
      mode: serializer.fromJson<String?>(json['mode']),
      intervalMin: serializer.fromJson<int?>(json['interval_min']),
      fixedTimes: serializer.fromJson<String?>(json['fixed_times']),
      weekdays: serializer.fromJson<String?>(json['weekdays']),
      quietStart: serializer.fromJson<String?>(json['quiet_start']),
      quietEnd: serializer.fromJson<String?>(json['quiet_end']),
      skipIfLoggedMin: serializer.fromJson<int?>(json['skip_if_logged_min']),
      vibrationPattern: serializer.fromJson<String?>(json['vibration_pattern']),
      textStyle: serializer.fromJson<String?>(json['text_style']),
      updatedAt: serializer.fromJson<DateTime?>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'profile_id': serializer.toJson<String>(profileId),
      'mode': serializer.toJson<String?>(mode),
      'interval_min': serializer.toJson<int?>(intervalMin),
      'fixed_times': serializer.toJson<String?>(fixedTimes),
      'weekdays': serializer.toJson<String?>(weekdays),
      'quiet_start': serializer.toJson<String?>(quietStart),
      'quiet_end': serializer.toJson<String?>(quietEnd),
      'skip_if_logged_min': serializer.toJson<int?>(skipIfLoggedMin),
      'vibration_pattern': serializer.toJson<String?>(vibrationPattern),
      'text_style': serializer.toJson<String?>(textStyle),
      'updated_at': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  ReminderSetting copyWith({
    String? profileId,
    Value<String?> mode = const Value.absent(),
    Value<int?> intervalMin = const Value.absent(),
    Value<String?> fixedTimes = const Value.absent(),
    Value<String?> weekdays = const Value.absent(),
    Value<String?> quietStart = const Value.absent(),
    Value<String?> quietEnd = const Value.absent(),
    Value<int?> skipIfLoggedMin = const Value.absent(),
    Value<String?> vibrationPattern = const Value.absent(),
    Value<String?> textStyle = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => ReminderSetting(
    profileId: profileId ?? this.profileId,
    mode: mode.present ? mode.value : this.mode,
    intervalMin: intervalMin.present ? intervalMin.value : this.intervalMin,
    fixedTimes: fixedTimes.present ? fixedTimes.value : this.fixedTimes,
    weekdays: weekdays.present ? weekdays.value : this.weekdays,
    quietStart: quietStart.present ? quietStart.value : this.quietStart,
    quietEnd: quietEnd.present ? quietEnd.value : this.quietEnd,
    skipIfLoggedMin: skipIfLoggedMin.present
        ? skipIfLoggedMin.value
        : this.skipIfLoggedMin,
    vibrationPattern: vibrationPattern.present
        ? vibrationPattern.value
        : this.vibrationPattern,
    textStyle: textStyle.present ? textStyle.value : this.textStyle,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  ReminderSetting copyWithCompanion(ReminderSettingsCompanion data) {
    return ReminderSetting(
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      mode: data.mode.present ? data.mode.value : this.mode,
      intervalMin: data.intervalMin.present
          ? data.intervalMin.value
          : this.intervalMin,
      fixedTimes: data.fixedTimes.present
          ? data.fixedTimes.value
          : this.fixedTimes,
      weekdays: data.weekdays.present ? data.weekdays.value : this.weekdays,
      quietStart: data.quietStart.present
          ? data.quietStart.value
          : this.quietStart,
      quietEnd: data.quietEnd.present ? data.quietEnd.value : this.quietEnd,
      skipIfLoggedMin: data.skipIfLoggedMin.present
          ? data.skipIfLoggedMin.value
          : this.skipIfLoggedMin,
      vibrationPattern: data.vibrationPattern.present
          ? data.vibrationPattern.value
          : this.vibrationPattern,
      textStyle: data.textStyle.present ? data.textStyle.value : this.textStyle,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderSetting(')
          ..write('profileId: $profileId, ')
          ..write('mode: $mode, ')
          ..write('intervalMin: $intervalMin, ')
          ..write('fixedTimes: $fixedTimes, ')
          ..write('weekdays: $weekdays, ')
          ..write('quietStart: $quietStart, ')
          ..write('quietEnd: $quietEnd, ')
          ..write('skipIfLoggedMin: $skipIfLoggedMin, ')
          ..write('vibrationPattern: $vibrationPattern, ')
          ..write('textStyle: $textStyle, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    profileId,
    mode,
    intervalMin,
    fixedTimes,
    weekdays,
    quietStart,
    quietEnd,
    skipIfLoggedMin,
    vibrationPattern,
    textStyle,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderSetting &&
          other.profileId == this.profileId &&
          other.mode == this.mode &&
          other.intervalMin == this.intervalMin &&
          other.fixedTimes == this.fixedTimes &&
          other.weekdays == this.weekdays &&
          other.quietStart == this.quietStart &&
          other.quietEnd == this.quietEnd &&
          other.skipIfLoggedMin == this.skipIfLoggedMin &&
          other.vibrationPattern == this.vibrationPattern &&
          other.textStyle == this.textStyle &&
          other.updatedAt == this.updatedAt);
}

class ReminderSettingsCompanion extends UpdateCompanion<ReminderSetting> {
  final Value<String> profileId;
  final Value<String?> mode;
  final Value<int?> intervalMin;
  final Value<String?> fixedTimes;
  final Value<String?> weekdays;
  final Value<String?> quietStart;
  final Value<String?> quietEnd;
  final Value<int?> skipIfLoggedMin;
  final Value<String?> vibrationPattern;
  final Value<String?> textStyle;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const ReminderSettingsCompanion({
    this.profileId = const Value.absent(),
    this.mode = const Value.absent(),
    this.intervalMin = const Value.absent(),
    this.fixedTimes = const Value.absent(),
    this.weekdays = const Value.absent(),
    this.quietStart = const Value.absent(),
    this.quietEnd = const Value.absent(),
    this.skipIfLoggedMin = const Value.absent(),
    this.vibrationPattern = const Value.absent(),
    this.textStyle = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReminderSettingsCompanion.insert({
    required String profileId,
    this.mode = const Value.absent(),
    this.intervalMin = const Value.absent(),
    this.fixedTimes = const Value.absent(),
    this.weekdays = const Value.absent(),
    this.quietStart = const Value.absent(),
    this.quietEnd = const Value.absent(),
    this.skipIfLoggedMin = const Value.absent(),
    this.vibrationPattern = const Value.absent(),
    this.textStyle = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : profileId = Value(profileId);
  static Insertable<ReminderSetting> custom({
    Expression<String>? profileId,
    Expression<String>? mode,
    Expression<int>? intervalMin,
    Expression<String>? fixedTimes,
    Expression<String>? weekdays,
    Expression<String>? quietStart,
    Expression<String>? quietEnd,
    Expression<int>? skipIfLoggedMin,
    Expression<String>? vibrationPattern,
    Expression<String>? textStyle,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (profileId != null) 'profile_id': profileId,
      if (mode != null) 'mode': mode,
      if (intervalMin != null) 'interval_min': intervalMin,
      if (fixedTimes != null) 'fixed_times': fixedTimes,
      if (weekdays != null) 'weekdays': weekdays,
      if (quietStart != null) 'quiet_start': quietStart,
      if (quietEnd != null) 'quiet_end': quietEnd,
      if (skipIfLoggedMin != null) 'skip_if_logged_min': skipIfLoggedMin,
      if (vibrationPattern != null) 'vibration_pattern': vibrationPattern,
      if (textStyle != null) 'text_style': textStyle,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReminderSettingsCompanion copyWith({
    Value<String>? profileId,
    Value<String?>? mode,
    Value<int?>? intervalMin,
    Value<String?>? fixedTimes,
    Value<String?>? weekdays,
    Value<String?>? quietStart,
    Value<String?>? quietEnd,
    Value<int?>? skipIfLoggedMin,
    Value<String?>? vibrationPattern,
    Value<String?>? textStyle,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return ReminderSettingsCompanion(
      profileId: profileId ?? this.profileId,
      mode: mode ?? this.mode,
      intervalMin: intervalMin ?? this.intervalMin,
      fixedTimes: fixedTimes ?? this.fixedTimes,
      weekdays: weekdays ?? this.weekdays,
      quietStart: quietStart ?? this.quietStart,
      quietEnd: quietEnd ?? this.quietEnd,
      skipIfLoggedMin: skipIfLoggedMin ?? this.skipIfLoggedMin,
      vibrationPattern: vibrationPattern ?? this.vibrationPattern,
      textStyle: textStyle ?? this.textStyle,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (profileId.present) {
      map['profile_id'] = Variable<String>(profileId.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (intervalMin.present) {
      map['interval_min'] = Variable<int>(intervalMin.value);
    }
    if (fixedTimes.present) {
      map['fixed_times'] = Variable<String>(fixedTimes.value);
    }
    if (weekdays.present) {
      map['weekdays'] = Variable<String>(weekdays.value);
    }
    if (quietStart.present) {
      map['quiet_start'] = Variable<String>(quietStart.value);
    }
    if (quietEnd.present) {
      map['quiet_end'] = Variable<String>(quietEnd.value);
    }
    if (skipIfLoggedMin.present) {
      map['skip_if_logged_min'] = Variable<int>(skipIfLoggedMin.value);
    }
    if (vibrationPattern.present) {
      map['vibration_pattern'] = Variable<String>(vibrationPattern.value);
    }
    if (textStyle.present) {
      map['text_style'] = Variable<String>(textStyle.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderSettingsCompanion(')
          ..write('profileId: $profileId, ')
          ..write('mode: $mode, ')
          ..write('intervalMin: $intervalMin, ')
          ..write('fixedTimes: $fixedTimes, ')
          ..write('weekdays: $weekdays, ')
          ..write('quietStart: $quietStart, ')
          ..write('quietEnd: $quietEnd, ')
          ..write('skipIfLoggedMin: $skipIfLoggedMin, ')
          ..write('vibrationPattern: $vibrationPattern, ')
          ..write('textStyle: $textStyle, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class FastingSettings extends Table
    with TableInfo<FastingSettings, FastingSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  FastingSettings(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  late final GeneratedColumn<String> profileId = GeneratedColumn<String>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _customDaysMeta = const VerificationMeta(
    'customDays',
  );
  late final GeneratedColumn<String> customDays = GeneratedColumn<String>(
    'custom_days',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _ifWindowMeta = const VerificationMeta(
    'ifWindow',
  );
  late final GeneratedColumn<String> ifWindow = GeneratedColumn<String>(
    'if_window',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _calcMethodMeta = const VerificationMeta(
    'calcMethod',
  );
  late final GeneratedColumn<String> calcMethod = GeneratedColumn<String>(
    'calc_method',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _splitPatternMeta = const VerificationMeta(
    'splitPattern',
  );
  late final GeneratedColumn<String> splitPattern = GeneratedColumn<String>(
    'split_pattern',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'DEFAULT \'2-4-2\'',
    defaultValue: const CustomExpression('\'2-4-2\''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    profileId,
    enabled,
    type,
    customDays,
    ifWindow,
    calcMethod,
    splitPattern,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fasting_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<FastingSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('custom_days')) {
      context.handle(
        _customDaysMeta,
        customDays.isAcceptableOrUnknown(data['custom_days']!, _customDaysMeta),
      );
    }
    if (data.containsKey('if_window')) {
      context.handle(
        _ifWindowMeta,
        ifWindow.isAcceptableOrUnknown(data['if_window']!, _ifWindowMeta),
      );
    }
    if (data.containsKey('calc_method')) {
      context.handle(
        _calcMethodMeta,
        calcMethod.isAcceptableOrUnknown(data['calc_method']!, _calcMethodMeta),
      );
    }
    if (data.containsKey('split_pattern')) {
      context.handle(
        _splitPatternMeta,
        splitPattern.isAcceptableOrUnknown(
          data['split_pattern']!,
          _splitPatternMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {profileId};
  @override
  FastingSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FastingSetting(
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_id'],
      )!,
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      customDays: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_days'],
      ),
      ifWindow: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}if_window'],
      ),
      calcMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}calc_method'],
      ),
      splitPattern: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}split_pattern'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  FastingSettings createAlias(String alias) {
    return FastingSettings(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class FastingSetting extends DataClass implements Insertable<FastingSetting> {
  final String profileId;
  final bool? enabled;
  final String? type;
  final String? customDays;
  final String? ifWindow;
  final String? calcMethod;
  final String? splitPattern;
  final DateTime? updatedAt;
  const FastingSetting({
    required this.profileId,
    this.enabled,
    this.type,
    this.customDays,
    this.ifWindow,
    this.calcMethod,
    this.splitPattern,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['profile_id'] = Variable<String>(profileId);
    if (!nullToAbsent || enabled != null) {
      map['enabled'] = Variable<bool>(enabled);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || customDays != null) {
      map['custom_days'] = Variable<String>(customDays);
    }
    if (!nullToAbsent || ifWindow != null) {
      map['if_window'] = Variable<String>(ifWindow);
    }
    if (!nullToAbsent || calcMethod != null) {
      map['calc_method'] = Variable<String>(calcMethod);
    }
    if (!nullToAbsent || splitPattern != null) {
      map['split_pattern'] = Variable<String>(splitPattern);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  FastingSettingsCompanion toCompanion(bool nullToAbsent) {
    return FastingSettingsCompanion(
      profileId: Value(profileId),
      enabled: enabled == null && nullToAbsent
          ? const Value.absent()
          : Value(enabled),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      customDays: customDays == null && nullToAbsent
          ? const Value.absent()
          : Value(customDays),
      ifWindow: ifWindow == null && nullToAbsent
          ? const Value.absent()
          : Value(ifWindow),
      calcMethod: calcMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(calcMethod),
      splitPattern: splitPattern == null && nullToAbsent
          ? const Value.absent()
          : Value(splitPattern),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory FastingSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FastingSetting(
      profileId: serializer.fromJson<String>(json['profile_id']),
      enabled: serializer.fromJson<bool?>(json['enabled']),
      type: serializer.fromJson<String?>(json['type']),
      customDays: serializer.fromJson<String?>(json['custom_days']),
      ifWindow: serializer.fromJson<String?>(json['if_window']),
      calcMethod: serializer.fromJson<String?>(json['calc_method']),
      splitPattern: serializer.fromJson<String?>(json['split_pattern']),
      updatedAt: serializer.fromJson<DateTime?>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'profile_id': serializer.toJson<String>(profileId),
      'enabled': serializer.toJson<bool?>(enabled),
      'type': serializer.toJson<String?>(type),
      'custom_days': serializer.toJson<String?>(customDays),
      'if_window': serializer.toJson<String?>(ifWindow),
      'calc_method': serializer.toJson<String?>(calcMethod),
      'split_pattern': serializer.toJson<String?>(splitPattern),
      'updated_at': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  FastingSetting copyWith({
    String? profileId,
    Value<bool?> enabled = const Value.absent(),
    Value<String?> type = const Value.absent(),
    Value<String?> customDays = const Value.absent(),
    Value<String?> ifWindow = const Value.absent(),
    Value<String?> calcMethod = const Value.absent(),
    Value<String?> splitPattern = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => FastingSetting(
    profileId: profileId ?? this.profileId,
    enabled: enabled.present ? enabled.value : this.enabled,
    type: type.present ? type.value : this.type,
    customDays: customDays.present ? customDays.value : this.customDays,
    ifWindow: ifWindow.present ? ifWindow.value : this.ifWindow,
    calcMethod: calcMethod.present ? calcMethod.value : this.calcMethod,
    splitPattern: splitPattern.present ? splitPattern.value : this.splitPattern,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  FastingSetting copyWithCompanion(FastingSettingsCompanion data) {
    return FastingSetting(
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      type: data.type.present ? data.type.value : this.type,
      customDays: data.customDays.present
          ? data.customDays.value
          : this.customDays,
      ifWindow: data.ifWindow.present ? data.ifWindow.value : this.ifWindow,
      calcMethod: data.calcMethod.present
          ? data.calcMethod.value
          : this.calcMethod,
      splitPattern: data.splitPattern.present
          ? data.splitPattern.value
          : this.splitPattern,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FastingSetting(')
          ..write('profileId: $profileId, ')
          ..write('enabled: $enabled, ')
          ..write('type: $type, ')
          ..write('customDays: $customDays, ')
          ..write('ifWindow: $ifWindow, ')
          ..write('calcMethod: $calcMethod, ')
          ..write('splitPattern: $splitPattern, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    profileId,
    enabled,
    type,
    customDays,
    ifWindow,
    calcMethod,
    splitPattern,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FastingSetting &&
          other.profileId == this.profileId &&
          other.enabled == this.enabled &&
          other.type == this.type &&
          other.customDays == this.customDays &&
          other.ifWindow == this.ifWindow &&
          other.calcMethod == this.calcMethod &&
          other.splitPattern == this.splitPattern &&
          other.updatedAt == this.updatedAt);
}

class FastingSettingsCompanion extends UpdateCompanion<FastingSetting> {
  final Value<String> profileId;
  final Value<bool?> enabled;
  final Value<String?> type;
  final Value<String?> customDays;
  final Value<String?> ifWindow;
  final Value<String?> calcMethod;
  final Value<String?> splitPattern;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const FastingSettingsCompanion({
    this.profileId = const Value.absent(),
    this.enabled = const Value.absent(),
    this.type = const Value.absent(),
    this.customDays = const Value.absent(),
    this.ifWindow = const Value.absent(),
    this.calcMethod = const Value.absent(),
    this.splitPattern = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FastingSettingsCompanion.insert({
    required String profileId,
    this.enabled = const Value.absent(),
    this.type = const Value.absent(),
    this.customDays = const Value.absent(),
    this.ifWindow = const Value.absent(),
    this.calcMethod = const Value.absent(),
    this.splitPattern = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : profileId = Value(profileId);
  static Insertable<FastingSetting> custom({
    Expression<String>? profileId,
    Expression<bool>? enabled,
    Expression<String>? type,
    Expression<String>? customDays,
    Expression<String>? ifWindow,
    Expression<String>? calcMethod,
    Expression<String>? splitPattern,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (profileId != null) 'profile_id': profileId,
      if (enabled != null) 'enabled': enabled,
      if (type != null) 'type': type,
      if (customDays != null) 'custom_days': customDays,
      if (ifWindow != null) 'if_window': ifWindow,
      if (calcMethod != null) 'calc_method': calcMethod,
      if (splitPattern != null) 'split_pattern': splitPattern,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FastingSettingsCompanion copyWith({
    Value<String>? profileId,
    Value<bool?>? enabled,
    Value<String?>? type,
    Value<String?>? customDays,
    Value<String?>? ifWindow,
    Value<String?>? calcMethod,
    Value<String?>? splitPattern,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return FastingSettingsCompanion(
      profileId: profileId ?? this.profileId,
      enabled: enabled ?? this.enabled,
      type: type ?? this.type,
      customDays: customDays ?? this.customDays,
      ifWindow: ifWindow ?? this.ifWindow,
      calcMethod: calcMethod ?? this.calcMethod,
      splitPattern: splitPattern ?? this.splitPattern,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (profileId.present) {
      map['profile_id'] = Variable<String>(profileId.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (customDays.present) {
      map['custom_days'] = Variable<String>(customDays.value);
    }
    if (ifWindow.present) {
      map['if_window'] = Variable<String>(ifWindow.value);
    }
    if (calcMethod.present) {
      map['calc_method'] = Variable<String>(calcMethod.value);
    }
    if (splitPattern.present) {
      map['split_pattern'] = Variable<String>(splitPattern.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FastingSettingsCompanion(')
          ..write('profileId: $profileId, ')
          ..write('enabled: $enabled, ')
          ..write('type: $type, ')
          ..write('customDays: $customDays, ')
          ..write('ifWindow: $ifWindow, ')
          ..write('calcMethod: $calcMethod, ')
          ..write('splitPattern: $splitPattern, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Outbox extends Table with TableInfo<Outbox, OutboxEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Outbox(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _targetTableMeta = const VerificationMeta(
    'targetTable',
  );
  late final GeneratedColumn<String> targetTable = GeneratedColumn<String>(
    'table',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _rowIdMeta = const VerificationMeta('rowId');
  late final GeneratedColumn<String> rowId = GeneratedColumn<String>(
    'row_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _opMeta = const VerificationMeta('op');
  late final GeneratedColumn<String> op = GeneratedColumn<String>(
    'op',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _attemptsMeta = const VerificationMeta(
    'attempts',
  );
  late final GeneratedColumn<int> attempts = GeneratedColumn<int>(
    'attempts',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT 0',
    defaultValue: const CustomExpression('0'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    targetTable,
    rowId,
    op,
    payload,
    createdAt,
    attempts,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'outbox';
  @override
  VerificationContext validateIntegrity(
    Insertable<OutboxEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('table')) {
      context.handle(
        _targetTableMeta,
        targetTable.isAcceptableOrUnknown(data['table']!, _targetTableMeta),
      );
    } else if (isInserting) {
      context.missing(_targetTableMeta);
    }
    if (data.containsKey('row_id')) {
      context.handle(
        _rowIdMeta,
        rowId.isAcceptableOrUnknown(data['row_id']!, _rowIdMeta),
      );
    } else if (isInserting) {
      context.missing(_rowIdMeta);
    }
    if (data.containsKey('op')) {
      context.handle(_opMeta, op.isAcceptableOrUnknown(data['op']!, _opMeta));
    } else if (isInserting) {
      context.missing(_opMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('attempts')) {
      context.handle(
        _attemptsMeta,
        attempts.isAcceptableOrUnknown(data['attempts']!, _attemptsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OutboxEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutboxEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      targetTable: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}table'],
      )!,
      rowId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}row_id'],
      )!,
      op: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}op'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      attempts: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempts'],
      )!,
    );
  }

  @override
  Outbox createAlias(String alias) {
    return Outbox(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class OutboxEntry extends DataClass implements Insertable<OutboxEntry> {
  final int id;
  final String targetTable;
  final String rowId;
  final String op;
  final String payload;
  final DateTime createdAt;
  final int attempts;
  const OutboxEntry({
    required this.id,
    required this.targetTable,
    required this.rowId,
    required this.op,
    required this.payload,
    required this.createdAt,
    required this.attempts,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['table'] = Variable<String>(targetTable);
    map['row_id'] = Variable<String>(rowId);
    map['op'] = Variable<String>(op);
    map['payload'] = Variable<String>(payload);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['attempts'] = Variable<int>(attempts);
    return map;
  }

  OutboxCompanion toCompanion(bool nullToAbsent) {
    return OutboxCompanion(
      id: Value(id),
      targetTable: Value(targetTable),
      rowId: Value(rowId),
      op: Value(op),
      payload: Value(payload),
      createdAt: Value(createdAt),
      attempts: Value(attempts),
    );
  }

  factory OutboxEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OutboxEntry(
      id: serializer.fromJson<int>(json['id']),
      targetTable: serializer.fromJson<String>(json['table']),
      rowId: serializer.fromJson<String>(json['row_id']),
      op: serializer.fromJson<String>(json['op']),
      payload: serializer.fromJson<String>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      attempts: serializer.fromJson<int>(json['attempts']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'table': serializer.toJson<String>(targetTable),
      'row_id': serializer.toJson<String>(rowId),
      'op': serializer.toJson<String>(op),
      'payload': serializer.toJson<String>(payload),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'attempts': serializer.toJson<int>(attempts),
    };
  }

  OutboxEntry copyWith({
    int? id,
    String? targetTable,
    String? rowId,
    String? op,
    String? payload,
    DateTime? createdAt,
    int? attempts,
  }) => OutboxEntry(
    id: id ?? this.id,
    targetTable: targetTable ?? this.targetTable,
    rowId: rowId ?? this.rowId,
    op: op ?? this.op,
    payload: payload ?? this.payload,
    createdAt: createdAt ?? this.createdAt,
    attempts: attempts ?? this.attempts,
  );
  OutboxEntry copyWithCompanion(OutboxCompanion data) {
    return OutboxEntry(
      id: data.id.present ? data.id.value : this.id,
      targetTable: data.targetTable.present
          ? data.targetTable.value
          : this.targetTable,
      rowId: data.rowId.present ? data.rowId.value : this.rowId,
      op: data.op.present ? data.op.value : this.op,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      attempts: data.attempts.present ? data.attempts.value : this.attempts,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OutboxEntry(')
          ..write('id: $id, ')
          ..write('targetTable: $targetTable, ')
          ..write('rowId: $rowId, ')
          ..write('op: $op, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('attempts: $attempts')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, targetTable, rowId, op, payload, createdAt, attempts);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OutboxEntry &&
          other.id == this.id &&
          other.targetTable == this.targetTable &&
          other.rowId == this.rowId &&
          other.op == this.op &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt &&
          other.attempts == this.attempts);
}

class OutboxCompanion extends UpdateCompanion<OutboxEntry> {
  final Value<int> id;
  final Value<String> targetTable;
  final Value<String> rowId;
  final Value<String> op;
  final Value<String> payload;
  final Value<DateTime> createdAt;
  final Value<int> attempts;
  const OutboxCompanion({
    this.id = const Value.absent(),
    this.targetTable = const Value.absent(),
    this.rowId = const Value.absent(),
    this.op = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.attempts = const Value.absent(),
  });
  OutboxCompanion.insert({
    this.id = const Value.absent(),
    required String targetTable,
    required String rowId,
    required String op,
    required String payload,
    required DateTime createdAt,
    this.attempts = const Value.absent(),
  }) : targetTable = Value(targetTable),
       rowId = Value(rowId),
       op = Value(op),
       payload = Value(payload),
       createdAt = Value(createdAt);
  static Insertable<OutboxEntry> custom({
    Expression<int>? id,
    Expression<String>? targetTable,
    Expression<String>? rowId,
    Expression<String>? op,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
    Expression<int>? attempts,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (targetTable != null) 'table': targetTable,
      if (rowId != null) 'row_id': rowId,
      if (op != null) 'op': op,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (attempts != null) 'attempts': attempts,
    });
  }

  OutboxCompanion copyWith({
    Value<int>? id,
    Value<String>? targetTable,
    Value<String>? rowId,
    Value<String>? op,
    Value<String>? payload,
    Value<DateTime>? createdAt,
    Value<int>? attempts,
  }) {
    return OutboxCompanion(
      id: id ?? this.id,
      targetTable: targetTable ?? this.targetTable,
      rowId: rowId ?? this.rowId,
      op: op ?? this.op,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      attempts: attempts ?? this.attempts,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (targetTable.present) {
      map['table'] = Variable<String>(targetTable.value);
    }
    if (rowId.present) {
      map['row_id'] = Variable<String>(rowId.value);
    }
    if (op.present) {
      map['op'] = Variable<String>(op.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (attempts.present) {
      map['attempts'] = Variable<int>(attempts.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutboxCompanion(')
          ..write('id: $id, ')
          ..write('targetTable: $targetTable, ')
          ..write('rowId: $rowId, ')
          ..write('op: $op, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('attempts: $attempts')
          ..write(')'))
        .toString();
  }
}

class SyncState extends Table with TableInfo<SyncState, SyncStateEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  SyncState(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _targetTableMeta = const VerificationMeta(
    'targetTable',
  );
  late final GeneratedColumn<String> targetTable = GeneratedColumn<String>(
    'table',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _lastPulledAtMeta = const VerificationMeta(
    'lastPulledAt',
  );
  late final GeneratedColumn<DateTime> lastPulledAt = GeneratedColumn<DateTime>(
    'last_pulled_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [targetTable, lastPulledAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_state';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncStateEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('table')) {
      context.handle(
        _targetTableMeta,
        targetTable.isAcceptableOrUnknown(data['table']!, _targetTableMeta),
      );
    } else if (isInserting) {
      context.missing(_targetTableMeta);
    }
    if (data.containsKey('last_pulled_at')) {
      context.handle(
        _lastPulledAtMeta,
        lastPulledAt.isAcceptableOrUnknown(
          data['last_pulled_at']!,
          _lastPulledAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {targetTable};
  @override
  SyncStateEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncStateEntry(
      targetTable: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}table'],
      )!,
      lastPulledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_pulled_at'],
      ),
    );
  }

  @override
  SyncState createAlias(String alias) {
    return SyncState(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class SyncStateEntry extends DataClass implements Insertable<SyncStateEntry> {
  final String targetTable;
  final DateTime? lastPulledAt;
  const SyncStateEntry({required this.targetTable, this.lastPulledAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['table'] = Variable<String>(targetTable);
    if (!nullToAbsent || lastPulledAt != null) {
      map['last_pulled_at'] = Variable<DateTime>(lastPulledAt);
    }
    return map;
  }

  SyncStateCompanion toCompanion(bool nullToAbsent) {
    return SyncStateCompanion(
      targetTable: Value(targetTable),
      lastPulledAt: lastPulledAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPulledAt),
    );
  }

  factory SyncStateEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncStateEntry(
      targetTable: serializer.fromJson<String>(json['table']),
      lastPulledAt: serializer.fromJson<DateTime?>(json['last_pulled_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'table': serializer.toJson<String>(targetTable),
      'last_pulled_at': serializer.toJson<DateTime?>(lastPulledAt),
    };
  }

  SyncStateEntry copyWith({
    String? targetTable,
    Value<DateTime?> lastPulledAt = const Value.absent(),
  }) => SyncStateEntry(
    targetTable: targetTable ?? this.targetTable,
    lastPulledAt: lastPulledAt.present ? lastPulledAt.value : this.lastPulledAt,
  );
  SyncStateEntry copyWithCompanion(SyncStateCompanion data) {
    return SyncStateEntry(
      targetTable: data.targetTable.present
          ? data.targetTable.value
          : this.targetTable,
      lastPulledAt: data.lastPulledAt.present
          ? data.lastPulledAt.value
          : this.lastPulledAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncStateEntry(')
          ..write('targetTable: $targetTable, ')
          ..write('lastPulledAt: $lastPulledAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(targetTable, lastPulledAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncStateEntry &&
          other.targetTable == this.targetTable &&
          other.lastPulledAt == this.lastPulledAt);
}

class SyncStateCompanion extends UpdateCompanion<SyncStateEntry> {
  final Value<String> targetTable;
  final Value<DateTime?> lastPulledAt;
  final Value<int> rowid;
  const SyncStateCompanion({
    this.targetTable = const Value.absent(),
    this.lastPulledAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncStateCompanion.insert({
    required String targetTable,
    this.lastPulledAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : targetTable = Value(targetTable);
  static Insertable<SyncStateEntry> custom({
    Expression<String>? targetTable,
    Expression<DateTime>? lastPulledAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (targetTable != null) 'table': targetTable,
      if (lastPulledAt != null) 'last_pulled_at': lastPulledAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncStateCompanion copyWith({
    Value<String>? targetTable,
    Value<DateTime?>? lastPulledAt,
    Value<int>? rowid,
  }) {
    return SyncStateCompanion(
      targetTable: targetTable ?? this.targetTable,
      lastPulledAt: lastPulledAt ?? this.lastPulledAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (targetTable.present) {
      map['table'] = Variable<String>(targetTable.value);
    }
    if (lastPulledAt.present) {
      map['last_pulled_at'] = Variable<DateTime>(lastPulledAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncStateCompanion(')
          ..write('targetTable: $targetTable, ')
          ..write('lastPulledAt: $lastPulledAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CachedEntitlement extends Table
    with TableInfo<CachedEntitlement, CachedEntitlementEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CachedEntitlement(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _premiumMeta = const VerificationMeta(
    'premium',
  );
  late final GeneratedColumn<bool> premium = GeneratedColumn<bool>(
    'premium',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _familyMeta = const VerificationMeta('family');
  late final GeneratedColumn<bool> family = GeneratedColumn<bool>(
    'family',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _removeAdsMeta = const VerificationMeta(
    'removeAds',
  );
  late final GeneratedColumn<bool> removeAds = GeneratedColumn<bool>(
    'remove_ads',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _inTrialMeta = const VerificationMeta(
    'inTrial',
  );
  late final GeneratedColumn<bool> inTrial = GeneratedColumn<bool>(
    'in_trial',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  static const VerificationMeta _premiumSourceMeta = const VerificationMeta(
    'premiumSource',
  );
  late final GeneratedColumn<String> premiumSource = GeneratedColumn<String>(
    'premium_source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    accountId,
    premium,
    family,
    removeAds,
    inTrial,
    premiumSource,
    expiresAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_entitlement';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedEntitlementEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('premium')) {
      context.handle(
        _premiumMeta,
        premium.isAcceptableOrUnknown(data['premium']!, _premiumMeta),
      );
    }
    if (data.containsKey('family')) {
      context.handle(
        _familyMeta,
        family.isAcceptableOrUnknown(data['family']!, _familyMeta),
      );
    }
    if (data.containsKey('remove_ads')) {
      context.handle(
        _removeAdsMeta,
        removeAds.isAcceptableOrUnknown(data['remove_ads']!, _removeAdsMeta),
      );
    }
    if (data.containsKey('in_trial')) {
      context.handle(
        _inTrialMeta,
        inTrial.isAcceptableOrUnknown(data['in_trial']!, _inTrialMeta),
      );
    }
    if (data.containsKey('premium_source')) {
      context.handle(
        _premiumSourceMeta,
        premiumSource.isAcceptableOrUnknown(
          data['premium_source']!,
          _premiumSourceMeta,
        ),
      );
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accountId};
  @override
  CachedEntitlementEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedEntitlementEntry(
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      )!,
      premium: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}premium'],
      )!,
      family: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}family'],
      )!,
      removeAds: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}remove_ads'],
      )!,
      inTrial: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}in_trial'],
      )!,
      premiumSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}premium_source'],
      ),
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  CachedEntitlement createAlias(String alias) {
    return CachedEntitlement(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CachedEntitlementEntry extends DataClass
    implements Insertable<CachedEntitlementEntry> {
  final String accountId;
  final bool premium;
  final bool family;
  final bool removeAds;
  final bool inTrial;
  final String? premiumSource;
  final DateTime? expiresAt;
  final DateTime? updatedAt;
  const CachedEntitlementEntry({
    required this.accountId,
    required this.premium,
    required this.family,
    required this.removeAds,
    required this.inTrial,
    this.premiumSource,
    this.expiresAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_id'] = Variable<String>(accountId);
    map['premium'] = Variable<bool>(premium);
    map['family'] = Variable<bool>(family);
    map['remove_ads'] = Variable<bool>(removeAds);
    map['in_trial'] = Variable<bool>(inTrial);
    if (!nullToAbsent || premiumSource != null) {
      map['premium_source'] = Variable<String>(premiumSource);
    }
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<DateTime>(expiresAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  CachedEntitlementCompanion toCompanion(bool nullToAbsent) {
    return CachedEntitlementCompanion(
      accountId: Value(accountId),
      premium: Value(premium),
      family: Value(family),
      removeAds: Value(removeAds),
      inTrial: Value(inTrial),
      premiumSource: premiumSource == null && nullToAbsent
          ? const Value.absent()
          : Value(premiumSource),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory CachedEntitlementEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedEntitlementEntry(
      accountId: serializer.fromJson<String>(json['account_id']),
      premium: serializer.fromJson<bool>(json['premium']),
      family: serializer.fromJson<bool>(json['family']),
      removeAds: serializer.fromJson<bool>(json['remove_ads']),
      inTrial: serializer.fromJson<bool>(json['in_trial']),
      premiumSource: serializer.fromJson<String?>(json['premium_source']),
      expiresAt: serializer.fromJson<DateTime?>(json['expires_at']),
      updatedAt: serializer.fromJson<DateTime?>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'account_id': serializer.toJson<String>(accountId),
      'premium': serializer.toJson<bool>(premium),
      'family': serializer.toJson<bool>(family),
      'remove_ads': serializer.toJson<bool>(removeAds),
      'in_trial': serializer.toJson<bool>(inTrial),
      'premium_source': serializer.toJson<String?>(premiumSource),
      'expires_at': serializer.toJson<DateTime?>(expiresAt),
      'updated_at': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  CachedEntitlementEntry copyWith({
    String? accountId,
    bool? premium,
    bool? family,
    bool? removeAds,
    bool? inTrial,
    Value<String?> premiumSource = const Value.absent(),
    Value<DateTime?> expiresAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => CachedEntitlementEntry(
    accountId: accountId ?? this.accountId,
    premium: premium ?? this.premium,
    family: family ?? this.family,
    removeAds: removeAds ?? this.removeAds,
    inTrial: inTrial ?? this.inTrial,
    premiumSource: premiumSource.present
        ? premiumSource.value
        : this.premiumSource,
    expiresAt: expiresAt.present ? expiresAt.value : this.expiresAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  CachedEntitlementEntry copyWithCompanion(CachedEntitlementCompanion data) {
    return CachedEntitlementEntry(
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      premium: data.premium.present ? data.premium.value : this.premium,
      family: data.family.present ? data.family.value : this.family,
      removeAds: data.removeAds.present ? data.removeAds.value : this.removeAds,
      inTrial: data.inTrial.present ? data.inTrial.value : this.inTrial,
      premiumSource: data.premiumSource.present
          ? data.premiumSource.value
          : this.premiumSource,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedEntitlementEntry(')
          ..write('accountId: $accountId, ')
          ..write('premium: $premium, ')
          ..write('family: $family, ')
          ..write('removeAds: $removeAds, ')
          ..write('inTrial: $inTrial, ')
          ..write('premiumSource: $premiumSource, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    accountId,
    premium,
    family,
    removeAds,
    inTrial,
    premiumSource,
    expiresAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedEntitlementEntry &&
          other.accountId == this.accountId &&
          other.premium == this.premium &&
          other.family == this.family &&
          other.removeAds == this.removeAds &&
          other.inTrial == this.inTrial &&
          other.premiumSource == this.premiumSource &&
          other.expiresAt == this.expiresAt &&
          other.updatedAt == this.updatedAt);
}

class CachedEntitlementCompanion
    extends UpdateCompanion<CachedEntitlementEntry> {
  final Value<String> accountId;
  final Value<bool> premium;
  final Value<bool> family;
  final Value<bool> removeAds;
  final Value<bool> inTrial;
  final Value<String?> premiumSource;
  final Value<DateTime?> expiresAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const CachedEntitlementCompanion({
    this.accountId = const Value.absent(),
    this.premium = const Value.absent(),
    this.family = const Value.absent(),
    this.removeAds = const Value.absent(),
    this.inTrial = const Value.absent(),
    this.premiumSource = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedEntitlementCompanion.insert({
    required String accountId,
    this.premium = const Value.absent(),
    this.family = const Value.absent(),
    this.removeAds = const Value.absent(),
    this.inTrial = const Value.absent(),
    this.premiumSource = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : accountId = Value(accountId);
  static Insertable<CachedEntitlementEntry> custom({
    Expression<String>? accountId,
    Expression<bool>? premium,
    Expression<bool>? family,
    Expression<bool>? removeAds,
    Expression<bool>? inTrial,
    Expression<String>? premiumSource,
    Expression<DateTime>? expiresAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accountId != null) 'account_id': accountId,
      if (premium != null) 'premium': premium,
      if (family != null) 'family': family,
      if (removeAds != null) 'remove_ads': removeAds,
      if (inTrial != null) 'in_trial': inTrial,
      if (premiumSource != null) 'premium_source': premiumSource,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedEntitlementCompanion copyWith({
    Value<String>? accountId,
    Value<bool>? premium,
    Value<bool>? family,
    Value<bool>? removeAds,
    Value<bool>? inTrial,
    Value<String?>? premiumSource,
    Value<DateTime?>? expiresAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return CachedEntitlementCompanion(
      accountId: accountId ?? this.accountId,
      premium: premium ?? this.premium,
      family: family ?? this.family,
      removeAds: removeAds ?? this.removeAds,
      inTrial: inTrial ?? this.inTrial,
      premiumSource: premiumSource ?? this.premiumSource,
      expiresAt: expiresAt ?? this.expiresAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (premium.present) {
      map['premium'] = Variable<bool>(premium.value);
    }
    if (family.present) {
      map['family'] = Variable<bool>(family.value);
    }
    if (removeAds.present) {
      map['remove_ads'] = Variable<bool>(removeAds.value);
    }
    if (inTrial.present) {
      map['in_trial'] = Variable<bool>(inTrial.value);
    }
    if (premiumSource.present) {
      map['premium_source'] = Variable<String>(premiumSource.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedEntitlementCompanion(')
          ..write('accountId: $accountId, ')
          ..write('premium: $premium, ')
          ..write('family: $family, ')
          ..write('removeAds: $removeAds, ')
          ..write('inTrial: $inTrial, ')
          ..write('premiumSource: $premiumSource, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CachedQuota extends Table with TableInfo<CachedQuota, CachedQuotaEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CachedQuota(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _monthlyLeftMeta = const VerificationMeta(
    'monthlyLeft',
  );
  late final GeneratedColumn<int> monthlyLeft = GeneratedColumn<int>(
    'monthly_left',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _creditsLeftMeta = const VerificationMeta(
    'creditsLeft',
  );
  late final GeneratedColumn<int> creditsLeft = GeneratedColumn<int>(
    'credits_left',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _dailyLeftMeta = const VerificationMeta(
    'dailyLeft',
  );
  late final GeneratedColumn<int> dailyLeft = GeneratedColumn<int>(
    'daily_left',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _resetsAtMeta = const VerificationMeta(
    'resetsAt',
  );
  late final GeneratedColumn<DateTime> resetsAt = GeneratedColumn<DateTime>(
    'resets_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [
    accountId,
    kind,
    monthlyLeft,
    creditsLeft,
    dailyLeft,
    resetsAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_quota';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedQuotaEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('monthly_left')) {
      context.handle(
        _monthlyLeftMeta,
        monthlyLeft.isAcceptableOrUnknown(
          data['monthly_left']!,
          _monthlyLeftMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_monthlyLeftMeta);
    }
    if (data.containsKey('credits_left')) {
      context.handle(
        _creditsLeftMeta,
        creditsLeft.isAcceptableOrUnknown(
          data['credits_left']!,
          _creditsLeftMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_creditsLeftMeta);
    }
    if (data.containsKey('daily_left')) {
      context.handle(
        _dailyLeftMeta,
        dailyLeft.isAcceptableOrUnknown(data['daily_left']!, _dailyLeftMeta),
      );
    } else if (isInserting) {
      context.missing(_dailyLeftMeta);
    }
    if (data.containsKey('resets_at')) {
      context.handle(
        _resetsAtMeta,
        resetsAt.isAcceptableOrUnknown(data['resets_at']!, _resetsAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {accountId, kind};
  @override
  CachedQuotaEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedQuotaEntry(
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      monthlyLeft: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}monthly_left'],
      )!,
      creditsLeft: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}credits_left'],
      )!,
      dailyLeft: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_left'],
      )!,
      resetsAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}resets_at'],
      ),
    );
  }

  @override
  CachedQuota createAlias(String alias) {
    return CachedQuota(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY(account_id, kind)'];
  @override
  bool get dontWriteConstraints => true;
}

class CachedQuotaEntry extends DataClass
    implements Insertable<CachedQuotaEntry> {
  final String accountId;
  final String kind;
  final int monthlyLeft;
  final int creditsLeft;
  final int dailyLeft;
  final DateTime? resetsAt;
  const CachedQuotaEntry({
    required this.accountId,
    required this.kind,
    required this.monthlyLeft,
    required this.creditsLeft,
    required this.dailyLeft,
    this.resetsAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['account_id'] = Variable<String>(accountId);
    map['kind'] = Variable<String>(kind);
    map['monthly_left'] = Variable<int>(monthlyLeft);
    map['credits_left'] = Variable<int>(creditsLeft);
    map['daily_left'] = Variable<int>(dailyLeft);
    if (!nullToAbsent || resetsAt != null) {
      map['resets_at'] = Variable<DateTime>(resetsAt);
    }
    return map;
  }

  CachedQuotaCompanion toCompanion(bool nullToAbsent) {
    return CachedQuotaCompanion(
      accountId: Value(accountId),
      kind: Value(kind),
      monthlyLeft: Value(monthlyLeft),
      creditsLeft: Value(creditsLeft),
      dailyLeft: Value(dailyLeft),
      resetsAt: resetsAt == null && nullToAbsent
          ? const Value.absent()
          : Value(resetsAt),
    );
  }

  factory CachedQuotaEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedQuotaEntry(
      accountId: serializer.fromJson<String>(json['account_id']),
      kind: serializer.fromJson<String>(json['kind']),
      monthlyLeft: serializer.fromJson<int>(json['monthly_left']),
      creditsLeft: serializer.fromJson<int>(json['credits_left']),
      dailyLeft: serializer.fromJson<int>(json['daily_left']),
      resetsAt: serializer.fromJson<DateTime?>(json['resets_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'account_id': serializer.toJson<String>(accountId),
      'kind': serializer.toJson<String>(kind),
      'monthly_left': serializer.toJson<int>(monthlyLeft),
      'credits_left': serializer.toJson<int>(creditsLeft),
      'daily_left': serializer.toJson<int>(dailyLeft),
      'resets_at': serializer.toJson<DateTime?>(resetsAt),
    };
  }

  CachedQuotaEntry copyWith({
    String? accountId,
    String? kind,
    int? monthlyLeft,
    int? creditsLeft,
    int? dailyLeft,
    Value<DateTime?> resetsAt = const Value.absent(),
  }) => CachedQuotaEntry(
    accountId: accountId ?? this.accountId,
    kind: kind ?? this.kind,
    monthlyLeft: monthlyLeft ?? this.monthlyLeft,
    creditsLeft: creditsLeft ?? this.creditsLeft,
    dailyLeft: dailyLeft ?? this.dailyLeft,
    resetsAt: resetsAt.present ? resetsAt.value : this.resetsAt,
  );
  CachedQuotaEntry copyWithCompanion(CachedQuotaCompanion data) {
    return CachedQuotaEntry(
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      kind: data.kind.present ? data.kind.value : this.kind,
      monthlyLeft: data.monthlyLeft.present
          ? data.monthlyLeft.value
          : this.monthlyLeft,
      creditsLeft: data.creditsLeft.present
          ? data.creditsLeft.value
          : this.creditsLeft,
      dailyLeft: data.dailyLeft.present ? data.dailyLeft.value : this.dailyLeft,
      resetsAt: data.resetsAt.present ? data.resetsAt.value : this.resetsAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedQuotaEntry(')
          ..write('accountId: $accountId, ')
          ..write('kind: $kind, ')
          ..write('monthlyLeft: $monthlyLeft, ')
          ..write('creditsLeft: $creditsLeft, ')
          ..write('dailyLeft: $dailyLeft, ')
          ..write('resetsAt: $resetsAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    accountId,
    kind,
    monthlyLeft,
    creditsLeft,
    dailyLeft,
    resetsAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedQuotaEntry &&
          other.accountId == this.accountId &&
          other.kind == this.kind &&
          other.monthlyLeft == this.monthlyLeft &&
          other.creditsLeft == this.creditsLeft &&
          other.dailyLeft == this.dailyLeft &&
          other.resetsAt == this.resetsAt);
}

class CachedQuotaCompanion extends UpdateCompanion<CachedQuotaEntry> {
  final Value<String> accountId;
  final Value<String> kind;
  final Value<int> monthlyLeft;
  final Value<int> creditsLeft;
  final Value<int> dailyLeft;
  final Value<DateTime?> resetsAt;
  final Value<int> rowid;
  const CachedQuotaCompanion({
    this.accountId = const Value.absent(),
    this.kind = const Value.absent(),
    this.monthlyLeft = const Value.absent(),
    this.creditsLeft = const Value.absent(),
    this.dailyLeft = const Value.absent(),
    this.resetsAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedQuotaCompanion.insert({
    required String accountId,
    required String kind,
    required int monthlyLeft,
    required int creditsLeft,
    required int dailyLeft,
    this.resetsAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : accountId = Value(accountId),
       kind = Value(kind),
       monthlyLeft = Value(monthlyLeft),
       creditsLeft = Value(creditsLeft),
       dailyLeft = Value(dailyLeft);
  static Insertable<CachedQuotaEntry> custom({
    Expression<String>? accountId,
    Expression<String>? kind,
    Expression<int>? monthlyLeft,
    Expression<int>? creditsLeft,
    Expression<int>? dailyLeft,
    Expression<DateTime>? resetsAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (accountId != null) 'account_id': accountId,
      if (kind != null) 'kind': kind,
      if (monthlyLeft != null) 'monthly_left': monthlyLeft,
      if (creditsLeft != null) 'credits_left': creditsLeft,
      if (dailyLeft != null) 'daily_left': dailyLeft,
      if (resetsAt != null) 'resets_at': resetsAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedQuotaCompanion copyWith({
    Value<String>? accountId,
    Value<String>? kind,
    Value<int>? monthlyLeft,
    Value<int>? creditsLeft,
    Value<int>? dailyLeft,
    Value<DateTime?>? resetsAt,
    Value<int>? rowid,
  }) {
    return CachedQuotaCompanion(
      accountId: accountId ?? this.accountId,
      kind: kind ?? this.kind,
      monthlyLeft: monthlyLeft ?? this.monthlyLeft,
      creditsLeft: creditsLeft ?? this.creditsLeft,
      dailyLeft: dailyLeft ?? this.dailyLeft,
      resetsAt: resetsAt ?? this.resetsAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (monthlyLeft.present) {
      map['monthly_left'] = Variable<int>(monthlyLeft.value);
    }
    if (creditsLeft.present) {
      map['credits_left'] = Variable<int>(creditsLeft.value);
    }
    if (dailyLeft.present) {
      map['daily_left'] = Variable<int>(dailyLeft.value);
    }
    if (resetsAt.present) {
      map['resets_at'] = Variable<DateTime>(resetsAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedQuotaCompanion(')
          ..write('accountId: $accountId, ')
          ..write('kind: $kind, ')
          ..write('monthlyLeft: $monthlyLeft, ')
          ..write('creditsLeft: $creditsLeft, ')
          ..write('dailyLeft: $dailyLeft, ')
          ..write('resetsAt: $resetsAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class PendingExternalLogs extends Table
    with TableInfo<PendingExternalLogs, PendingExternalLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PendingExternalLogs(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _drinkIdMeta = const VerificationMeta(
    'drinkId',
  );
  late final GeneratedColumn<String> drinkId = GeneratedColumn<String>(
    'drink_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _volumeMlMeta = const VerificationMeta(
    'volumeMl',
  );
  late final GeneratedColumn<int> volumeMl = GeneratedColumn<int>(
    'volume_ml',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    drinkId,
    volumeMl,
    source,
    loggedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_external_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingExternalLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('drink_id')) {
      context.handle(
        _drinkIdMeta,
        drinkId.isAcceptableOrUnknown(data['drink_id']!, _drinkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_drinkIdMeta);
    }
    if (data.containsKey('volume_ml')) {
      context.handle(
        _volumeMlMeta,
        volumeMl.isAcceptableOrUnknown(data['volume_ml']!, _volumeMlMeta),
      );
    } else if (isInserting) {
      context.missing(_volumeMlMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingExternalLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingExternalLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      drinkId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}drink_id'],
      )!,
      volumeMl: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}volume_ml'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
    );
  }

  @override
  PendingExternalLogs createAlias(String alias) {
    return PendingExternalLogs(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class PendingExternalLog extends DataClass
    implements Insertable<PendingExternalLog> {
  final String id;
  final String drinkId;
  final int volumeMl;
  final String source;
  final DateTime loggedAt;
  const PendingExternalLog({
    required this.id,
    required this.drinkId,
    required this.volumeMl,
    required this.source,
    required this.loggedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['drink_id'] = Variable<String>(drinkId);
    map['volume_ml'] = Variable<int>(volumeMl);
    map['source'] = Variable<String>(source);
    map['logged_at'] = Variable<DateTime>(loggedAt);
    return map;
  }

  PendingExternalLogsCompanion toCompanion(bool nullToAbsent) {
    return PendingExternalLogsCompanion(
      id: Value(id),
      drinkId: Value(drinkId),
      volumeMl: Value(volumeMl),
      source: Value(source),
      loggedAt: Value(loggedAt),
    );
  }

  factory PendingExternalLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingExternalLog(
      id: serializer.fromJson<String>(json['id']),
      drinkId: serializer.fromJson<String>(json['drink_id']),
      volumeMl: serializer.fromJson<int>(json['volume_ml']),
      source: serializer.fromJson<String>(json['source']),
      loggedAt: serializer.fromJson<DateTime>(json['logged_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'drink_id': serializer.toJson<String>(drinkId),
      'volume_ml': serializer.toJson<int>(volumeMl),
      'source': serializer.toJson<String>(source),
      'logged_at': serializer.toJson<DateTime>(loggedAt),
    };
  }

  PendingExternalLog copyWith({
    String? id,
    String? drinkId,
    int? volumeMl,
    String? source,
    DateTime? loggedAt,
  }) => PendingExternalLog(
    id: id ?? this.id,
    drinkId: drinkId ?? this.drinkId,
    volumeMl: volumeMl ?? this.volumeMl,
    source: source ?? this.source,
    loggedAt: loggedAt ?? this.loggedAt,
  );
  PendingExternalLog copyWithCompanion(PendingExternalLogsCompanion data) {
    return PendingExternalLog(
      id: data.id.present ? data.id.value : this.id,
      drinkId: data.drinkId.present ? data.drinkId.value : this.drinkId,
      volumeMl: data.volumeMl.present ? data.volumeMl.value : this.volumeMl,
      source: data.source.present ? data.source.value : this.source,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingExternalLog(')
          ..write('id: $id, ')
          ..write('drinkId: $drinkId, ')
          ..write('volumeMl: $volumeMl, ')
          ..write('source: $source, ')
          ..write('loggedAt: $loggedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, drinkId, volumeMl, source, loggedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingExternalLog &&
          other.id == this.id &&
          other.drinkId == this.drinkId &&
          other.volumeMl == this.volumeMl &&
          other.source == this.source &&
          other.loggedAt == this.loggedAt);
}

class PendingExternalLogsCompanion extends UpdateCompanion<PendingExternalLog> {
  final Value<String> id;
  final Value<String> drinkId;
  final Value<int> volumeMl;
  final Value<String> source;
  final Value<DateTime> loggedAt;
  final Value<int> rowid;
  const PendingExternalLogsCompanion({
    this.id = const Value.absent(),
    this.drinkId = const Value.absent(),
    this.volumeMl = const Value.absent(),
    this.source = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PendingExternalLogsCompanion.insert({
    required String id,
    required String drinkId,
    required int volumeMl,
    required String source,
    required DateTime loggedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       drinkId = Value(drinkId),
       volumeMl = Value(volumeMl),
       source = Value(source),
       loggedAt = Value(loggedAt);
  static Insertable<PendingExternalLog> custom({
    Expression<String>? id,
    Expression<String>? drinkId,
    Expression<int>? volumeMl,
    Expression<String>? source,
    Expression<DateTime>? loggedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (drinkId != null) 'drink_id': drinkId,
      if (volumeMl != null) 'volume_ml': volumeMl,
      if (source != null) 'source': source,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PendingExternalLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? drinkId,
    Value<int>? volumeMl,
    Value<String>? source,
    Value<DateTime>? loggedAt,
    Value<int>? rowid,
  }) {
    return PendingExternalLogsCompanion(
      id: id ?? this.id,
      drinkId: drinkId ?? this.drinkId,
      volumeMl: volumeMl ?? this.volumeMl,
      source: source ?? this.source,
      loggedAt: loggedAt ?? this.loggedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (drinkId.present) {
      map['drink_id'] = Variable<String>(drinkId.value);
    }
    if (volumeMl.present) {
      map['volume_ml'] = Variable<int>(volumeMl.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingExternalLogsCompanion(')
          ..write('id: $id, ')
          ..write('drinkId: $drinkId, ')
          ..write('volumeMl: $volumeMl, ')
          ..write('source: $source, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final Profiles profiles = Profiles(this);
  late final DrinkLogs drinkLogs = DrinkLogs(this);
  late final Index drinkLogsProfileLoggedAt = Index(
    'drink_logs_profile_logged_at',
    'CREATE INDEX drink_logs_profile_logged_at ON drink_logs (profile_id, logged_at)',
  );
  late final CustomDrinks customDrinks = CustomDrinks(this);
  late final DailyGoals dailyGoals = DailyGoals(this);
  late final ReminderSettings reminderSettings = ReminderSettings(this);
  late final FastingSettings fastingSettings = FastingSettings(this);
  late final Outbox outbox = Outbox(this);
  late final SyncState syncState = SyncState(this);
  late final CachedEntitlement cachedEntitlement = CachedEntitlement(this);
  late final CachedQuota cachedQuota = CachedQuota(this);
  late final PendingExternalLogs pendingExternalLogs = PendingExternalLogs(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    profiles,
    drinkLogs,
    drinkLogsProfileLoggedAt,
    customDrinks,
    dailyGoals,
    reminderSettings,
    fastingSettings,
    outbox,
    syncState,
    cachedEntitlement,
    cachedQuota,
    pendingExternalLogs,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $ProfilesCreateCompanionBuilder = ProfilesCompanion Function({
  required String id,
  required String accountId,
  required String kind,
  required String displayName,
  Value<int?> birthYear,
  Value<double?> weightKg,
  Value<String?> sex,
  Value<String?> activityLevel,
  Value<String?> wakeTime,
  Value<String?> sleepTime,
  required String timezone,
  Value<String> units,
  Value<String> locale,
  Value<String> experience,
  Value<int?> fluidRestrictionMl,
  Value<int?> goalOverrideMl,
  Value<bool> adaptiveWeather,
  Value<bool> adaptiveActivity,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $ProfilesUpdateCompanionBuilder = ProfilesCompanion Function({
  Value<String> id,
  Value<String> accountId,
  Value<String> kind,
  Value<String> displayName,
  Value<int?> birthYear,
  Value<double?> weightKg,
  Value<String?> sex,
  Value<String?> activityLevel,
  Value<String?> wakeTime,
  Value<String?> sleepTime,
  Value<String> timezone,
  Value<String> units,
  Value<String> locale,
  Value<String> experience,
  Value<int?> fluidRestrictionMl,
  Value<int?> goalOverrideMl,
  Value<bool> adaptiveWeather,
  Value<bool> adaptiveActivity,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $ProfilesFilterComposer extends Composer<_$AppDatabase, Profiles> {
  $ProfilesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get birthYear => $composableBuilder(
    column: $table.birthYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityLevel => $composableBuilder(
    column: $table.activityLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wakeTime => $composableBuilder(
    column: $table.wakeTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sleepTime => $composableBuilder(
    column: $table.sleepTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get units => $composableBuilder(
    column: $table.units,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locale => $composableBuilder(
    column: $table.locale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get experience => $composableBuilder(
    column: $table.experience,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fluidRestrictionMl => $composableBuilder(
    column: $table.fluidRestrictionMl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get goalOverrideMl => $composableBuilder(
    column: $table.goalOverrideMl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get adaptiveWeather => $composableBuilder(
    column: $table.adaptiveWeather,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get adaptiveActivity => $composableBuilder(
    column: $table.adaptiveActivity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $ProfilesOrderingComposer extends Composer<_$AppDatabase, Profiles> {
  $ProfilesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get birthYear => $composableBuilder(
    column: $table.birthYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityLevel => $composableBuilder(
    column: $table.activityLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wakeTime => $composableBuilder(
    column: $table.wakeTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sleepTime => $composableBuilder(
    column: $table.sleepTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get units => $composableBuilder(
    column: $table.units,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locale => $composableBuilder(
    column: $table.locale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get experience => $composableBuilder(
    column: $table.experience,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fluidRestrictionMl => $composableBuilder(
    column: $table.fluidRestrictionMl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get goalOverrideMl => $composableBuilder(
    column: $table.goalOverrideMl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get adaptiveWeather => $composableBuilder(
    column: $table.adaptiveWeather,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get adaptiveActivity => $composableBuilder(
    column: $table.adaptiveActivity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $ProfilesAnnotationComposer extends Composer<_$AppDatabase, Profiles> {
  $ProfilesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get birthYear =>
      $composableBuilder(column: $table.birthYear, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<String> get activityLevel => $composableBuilder(
    column: $table.activityLevel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get wakeTime =>
      $composableBuilder(column: $table.wakeTime, builder: (column) => column);

  GeneratedColumn<String> get sleepTime =>
      $composableBuilder(column: $table.sleepTime, builder: (column) => column);

  GeneratedColumn<String> get timezone =>
      $composableBuilder(column: $table.timezone, builder: (column) => column);

  GeneratedColumn<String> get units =>
      $composableBuilder(column: $table.units, builder: (column) => column);

  GeneratedColumn<String> get locale =>
      $composableBuilder(column: $table.locale, builder: (column) => column);

  GeneratedColumn<String> get experience => $composableBuilder(
    column: $table.experience,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fluidRestrictionMl => $composableBuilder(
    column: $table.fluidRestrictionMl,
    builder: (column) => column,
  );

  GeneratedColumn<int> get goalOverrideMl => $composableBuilder(
    column: $table.goalOverrideMl,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get adaptiveWeather => $composableBuilder(
    column: $table.adaptiveWeather,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get adaptiveActivity => $composableBuilder(
    column: $table.adaptiveActivity,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $ProfilesTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Profiles,
          Profile,
          $ProfilesFilterComposer,
          $ProfilesOrderingComposer,
          $ProfilesAnnotationComposer,
          $ProfilesCreateCompanionBuilder,
          $ProfilesUpdateCompanionBuilder,
          (Profile, BaseReferences<_$AppDatabase, Profiles, Profile>),
          Profile,
          PrefetchHooks Function()
        > {
  $ProfilesTableManager(_$AppDatabase db, Profiles table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ProfilesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ProfilesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ProfilesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> accountId = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<int?> birthYear = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<String?> sex = const Value.absent(),
                Value<String?> activityLevel = const Value.absent(),
                Value<String?> wakeTime = const Value.absent(),
                Value<String?> sleepTime = const Value.absent(),
                Value<String> timezone = const Value.absent(),
                Value<String> units = const Value.absent(),
                Value<String> locale = const Value.absent(),
                Value<String> experience = const Value.absent(),
                Value<int?> fluidRestrictionMl = const Value.absent(),
                Value<int?> goalOverrideMl = const Value.absent(),
                Value<bool> adaptiveWeather = const Value.absent(),
                Value<bool> adaptiveActivity = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfilesCompanion(
                id: id,
                accountId: accountId,
                kind: kind,
                displayName: displayName,
                birthYear: birthYear,
                weightKg: weightKg,
                sex: sex,
                activityLevel: activityLevel,
                wakeTime: wakeTime,
                sleepTime: sleepTime,
                timezone: timezone,
                units: units,
                locale: locale,
                experience: experience,
                fluidRestrictionMl: fluidRestrictionMl,
                goalOverrideMl: goalOverrideMl,
                adaptiveWeather: adaptiveWeather,
                adaptiveActivity: adaptiveActivity,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String accountId,
                required String kind,
                required String displayName,
                Value<int?> birthYear = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<String?> sex = const Value.absent(),
                Value<String?> activityLevel = const Value.absent(),
                Value<String?> wakeTime = const Value.absent(),
                Value<String?> sleepTime = const Value.absent(),
                required String timezone,
                Value<String> units = const Value.absent(),
                Value<String> locale = const Value.absent(),
                Value<String> experience = const Value.absent(),
                Value<int?> fluidRestrictionMl = const Value.absent(),
                Value<int?> goalOverrideMl = const Value.absent(),
                Value<bool> adaptiveWeather = const Value.absent(),
                Value<bool> adaptiveActivity = const Value.absent(),
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfilesCompanion.insert(
                id: id,
                accountId: accountId,
                kind: kind,
                displayName: displayName,
                birthYear: birthYear,
                weightKg: weightKg,
                sex: sex,
                activityLevel: activityLevel,
                wakeTime: wakeTime,
                sleepTime: sleepTime,
                timezone: timezone,
                units: units,
                locale: locale,
                experience: experience,
                fluidRestrictionMl: fluidRestrictionMl,
                goalOverrideMl: goalOverrideMl,
                adaptiveWeather: adaptiveWeather,
                adaptiveActivity: adaptiveActivity,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<Profiles, Profile>(table),
                  BaseReferences<_$AppDatabase, Profiles, Profile>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $ProfilesProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Profiles,
      Profile,
      $ProfilesFilterComposer,
      $ProfilesOrderingComposer,
      $ProfilesAnnotationComposer,
      $ProfilesCreateCompanionBuilder,
      $ProfilesUpdateCompanionBuilder,
      (Profile, BaseReferences<_$AppDatabase, Profiles, Profile>),
      Profile,
      PrefetchHooks Function()
    >;
typedef $DrinkLogsCreateCompanionBuilder = DrinkLogsCompanion Function({
  required String id,
  required String profileId,
  required String drinkId,
  required int volumeMl,
  required int hydrationMl,
  Value<double?> caffeineMg,
  Value<double?> sugarG,
  required String source,
  required DateTime loggedAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $DrinkLogsUpdateCompanionBuilder = DrinkLogsCompanion Function({
  Value<String> id,
  Value<String> profileId,
  Value<String> drinkId,
  Value<int> volumeMl,
  Value<int> hydrationMl,
  Value<double?> caffeineMg,
  Value<double?> sugarG,
  Value<String> source,
  Value<DateTime> loggedAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $DrinkLogsFilterComposer extends Composer<_$AppDatabase, DrinkLogs> {
  $DrinkLogsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get drinkId => $composableBuilder(
    column: $table.drinkId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get volumeMl => $composableBuilder(
    column: $table.volumeMl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hydrationMl => $composableBuilder(
    column: $table.hydrationMl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get caffeineMg => $composableBuilder(
    column: $table.caffeineMg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sugarG => $composableBuilder(
    column: $table.sugarG,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $DrinkLogsOrderingComposer extends Composer<_$AppDatabase, DrinkLogs> {
  $DrinkLogsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get drinkId => $composableBuilder(
    column: $table.drinkId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get volumeMl => $composableBuilder(
    column: $table.volumeMl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hydrationMl => $composableBuilder(
    column: $table.hydrationMl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get caffeineMg => $composableBuilder(
    column: $table.caffeineMg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sugarG => $composableBuilder(
    column: $table.sugarG,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $DrinkLogsAnnotationComposer extends Composer<_$AppDatabase, DrinkLogs> {
  $DrinkLogsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get drinkId =>
      $composableBuilder(column: $table.drinkId, builder: (column) => column);

  GeneratedColumn<int> get volumeMl =>
      $composableBuilder(column: $table.volumeMl, builder: (column) => column);

  GeneratedColumn<int> get hydrationMl => $composableBuilder(
    column: $table.hydrationMl,
    builder: (column) => column,
  );

  GeneratedColumn<double> get caffeineMg => $composableBuilder(
    column: $table.caffeineMg,
    builder: (column) => column,
  );

  GeneratedColumn<double> get sugarG =>
      $composableBuilder(column: $table.sugarG, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $DrinkLogsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          DrinkLogs,
          DrinkLog,
          $DrinkLogsFilterComposer,
          $DrinkLogsOrderingComposer,
          $DrinkLogsAnnotationComposer,
          $DrinkLogsCreateCompanionBuilder,
          $DrinkLogsUpdateCompanionBuilder,
          (DrinkLog, BaseReferences<_$AppDatabase, DrinkLogs, DrinkLog>),
          DrinkLog,
          PrefetchHooks Function()
        > {
  $DrinkLogsTableManager(_$AppDatabase db, DrinkLogs table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $DrinkLogsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $DrinkLogsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $DrinkLogsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> profileId = const Value.absent(),
                Value<String> drinkId = const Value.absent(),
                Value<int> volumeMl = const Value.absent(),
                Value<int> hydrationMl = const Value.absent(),
                Value<double?> caffeineMg = const Value.absent(),
                Value<double?> sugarG = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DrinkLogsCompanion(
                id: id,
                profileId: profileId,
                drinkId: drinkId,
                volumeMl: volumeMl,
                hydrationMl: hydrationMl,
                caffeineMg: caffeineMg,
                sugarG: sugarG,
                source: source,
                loggedAt: loggedAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String profileId,
                required String drinkId,
                required int volumeMl,
                required int hydrationMl,
                Value<double?> caffeineMg = const Value.absent(),
                Value<double?> sugarG = const Value.absent(),
                required String source,
                required DateTime loggedAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DrinkLogsCompanion.insert(
                id: id,
                profileId: profileId,
                drinkId: drinkId,
                volumeMl: volumeMl,
                hydrationMl: hydrationMl,
                caffeineMg: caffeineMg,
                sugarG: sugarG,
                source: source,
                loggedAt: loggedAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<DrinkLogs, DrinkLog>(table),
                  BaseReferences<_$AppDatabase, DrinkLogs, DrinkLog>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $DrinkLogsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      DrinkLogs,
      DrinkLog,
      $DrinkLogsFilterComposer,
      $DrinkLogsOrderingComposer,
      $DrinkLogsAnnotationComposer,
      $DrinkLogsCreateCompanionBuilder,
      $DrinkLogsUpdateCompanionBuilder,
      (DrinkLog, BaseReferences<_$AppDatabase, DrinkLogs, DrinkLog>),
      DrinkLog,
      PrefetchHooks Function()
    >;
typedef $CustomDrinksCreateCompanionBuilder = CustomDrinksCompanion Function({
  required String id,
  Value<String?> accountId,
  Value<String?> name,
  Value<String?> icon,
  Value<double?> waterPct,
  Value<double?> sugarG100ml,
  Value<double?> caffeineMg100ml,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $CustomDrinksUpdateCompanionBuilder = CustomDrinksCompanion Function({
  Value<String> id,
  Value<String?> accountId,
  Value<String?> name,
  Value<String?> icon,
  Value<double?> waterPct,
  Value<double?> sugarG100ml,
  Value<double?> caffeineMg100ml,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $CustomDrinksFilterComposer
    extends Composer<_$AppDatabase, CustomDrinks> {
  $CustomDrinksFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get waterPct => $composableBuilder(
    column: $table.waterPct,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sugarG100ml => $composableBuilder(
    column: $table.sugarG100ml,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get caffeineMg100ml => $composableBuilder(
    column: $table.caffeineMg100ml,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $CustomDrinksOrderingComposer
    extends Composer<_$AppDatabase, CustomDrinks> {
  $CustomDrinksOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get waterPct => $composableBuilder(
    column: $table.waterPct,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sugarG100ml => $composableBuilder(
    column: $table.sugarG100ml,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get caffeineMg100ml => $composableBuilder(
    column: $table.caffeineMg100ml,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $CustomDrinksAnnotationComposer
    extends Composer<_$AppDatabase, CustomDrinks> {
  $CustomDrinksAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<double> get waterPct =>
      $composableBuilder(column: $table.waterPct, builder: (column) => column);

  GeneratedColumn<double> get sugarG100ml => $composableBuilder(
    column: $table.sugarG100ml,
    builder: (column) => column,
  );

  GeneratedColumn<double> get caffeineMg100ml => $composableBuilder(
    column: $table.caffeineMg100ml,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $CustomDrinksTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          CustomDrinks,
          CustomDrink,
          $CustomDrinksFilterComposer,
          $CustomDrinksOrderingComposer,
          $CustomDrinksAnnotationComposer,
          $CustomDrinksCreateCompanionBuilder,
          $CustomDrinksUpdateCompanionBuilder,
          (
            CustomDrink,
            BaseReferences<_$AppDatabase, CustomDrinks, CustomDrink>,
          ),
          CustomDrink,
          PrefetchHooks Function()
        > {
  $CustomDrinksTableManager(_$AppDatabase db, CustomDrinks table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CustomDrinksFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CustomDrinksOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CustomDrinksAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> accountId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<double?> waterPct = const Value.absent(),
                Value<double?> sugarG100ml = const Value.absent(),
                Value<double?> caffeineMg100ml = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomDrinksCompanion(
                id: id,
                accountId: accountId,
                name: name,
                icon: icon,
                waterPct: waterPct,
                sugarG100ml: sugarG100ml,
                caffeineMg100ml: caffeineMg100ml,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> accountId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<double?> waterPct = const Value.absent(),
                Value<double?> sugarG100ml = const Value.absent(),
                Value<double?> caffeineMg100ml = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomDrinksCompanion.insert(
                id: id,
                accountId: accountId,
                name: name,
                icon: icon,
                waterPct: waterPct,
                sugarG100ml: sugarG100ml,
                caffeineMg100ml: caffeineMg100ml,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<CustomDrinks, CustomDrink>(table),
                  BaseReferences<_$AppDatabase, CustomDrinks, CustomDrink>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $CustomDrinksProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      CustomDrinks,
      CustomDrink,
      $CustomDrinksFilterComposer,
      $CustomDrinksOrderingComposer,
      $CustomDrinksAnnotationComposer,
      $CustomDrinksCreateCompanionBuilder,
      $CustomDrinksUpdateCompanionBuilder,
      (CustomDrink, BaseReferences<_$AppDatabase, CustomDrinks, CustomDrink>),
      CustomDrink,
      PrefetchHooks Function()
    >;
typedef $DailyGoalsCreateCompanionBuilder = DailyGoalsCompanion Function({
  required String profileId,
  required String day,
  Value<int?> baseMl,
  Value<int?> weatherMl,
  Value<int?> activityMl,
  Value<int?> finalMl,
  Value<String?> reason,
  Value<int> rowid,
});
typedef $DailyGoalsUpdateCompanionBuilder = DailyGoalsCompanion Function({
  Value<String> profileId,
  Value<String> day,
  Value<int?> baseMl,
  Value<int?> weatherMl,
  Value<int?> activityMl,
  Value<int?> finalMl,
  Value<String?> reason,
  Value<int> rowid,
});

class $DailyGoalsFilterComposer extends Composer<_$AppDatabase, DailyGoals> {
  $DailyGoalsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseMl => $composableBuilder(
    column: $table.baseMl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weatherMl => $composableBuilder(
    column: $table.weatherMl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get activityMl => $composableBuilder(
    column: $table.activityMl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get finalMl => $composableBuilder(
    column: $table.finalMl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );
}

class $DailyGoalsOrderingComposer extends Composer<_$AppDatabase, DailyGoals> {
  $DailyGoalsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseMl => $composableBuilder(
    column: $table.baseMl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weatherMl => $composableBuilder(
    column: $table.weatherMl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get activityMl => $composableBuilder(
    column: $table.activityMl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get finalMl => $composableBuilder(
    column: $table.finalMl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );
}

class $DailyGoalsAnnotationComposer
    extends Composer<_$AppDatabase, DailyGoals> {
  $DailyGoalsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<int> get baseMl =>
      $composableBuilder(column: $table.baseMl, builder: (column) => column);

  GeneratedColumn<int> get weatherMl =>
      $composableBuilder(column: $table.weatherMl, builder: (column) => column);

  GeneratedColumn<int> get activityMl => $composableBuilder(
    column: $table.activityMl,
    builder: (column) => column,
  );

  GeneratedColumn<int> get finalMl =>
      $composableBuilder(column: $table.finalMl, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);
}

class $DailyGoalsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          DailyGoals,
          DailyGoal,
          $DailyGoalsFilterComposer,
          $DailyGoalsOrderingComposer,
          $DailyGoalsAnnotationComposer,
          $DailyGoalsCreateCompanionBuilder,
          $DailyGoalsUpdateCompanionBuilder,
          (DailyGoal, BaseReferences<_$AppDatabase, DailyGoals, DailyGoal>),
          DailyGoal,
          PrefetchHooks Function()
        > {
  $DailyGoalsTableManager(_$AppDatabase db, DailyGoals table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $DailyGoalsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $DailyGoalsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $DailyGoalsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> profileId = const Value.absent(),
                Value<String> day = const Value.absent(),
                Value<int?> baseMl = const Value.absent(),
                Value<int?> weatherMl = const Value.absent(),
                Value<int?> activityMl = const Value.absent(),
                Value<int?> finalMl = const Value.absent(),
                Value<String?> reason = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyGoalsCompanion(
                profileId: profileId,
                day: day,
                baseMl: baseMl,
                weatherMl: weatherMl,
                activityMl: activityMl,
                finalMl: finalMl,
                reason: reason,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String profileId,
                required String day,
                Value<int?> baseMl = const Value.absent(),
                Value<int?> weatherMl = const Value.absent(),
                Value<int?> activityMl = const Value.absent(),
                Value<int?> finalMl = const Value.absent(),
                Value<String?> reason = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DailyGoalsCompanion.insert(
                profileId: profileId,
                day: day,
                baseMl: baseMl,
                weatherMl: weatherMl,
                activityMl: activityMl,
                finalMl: finalMl,
                reason: reason,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<DailyGoals, DailyGoal>(table),
                  BaseReferences<_$AppDatabase, DailyGoals, DailyGoal>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $DailyGoalsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      DailyGoals,
      DailyGoal,
      $DailyGoalsFilterComposer,
      $DailyGoalsOrderingComposer,
      $DailyGoalsAnnotationComposer,
      $DailyGoalsCreateCompanionBuilder,
      $DailyGoalsUpdateCompanionBuilder,
      (DailyGoal, BaseReferences<_$AppDatabase, DailyGoals, DailyGoal>),
      DailyGoal,
      PrefetchHooks Function()
    >;
typedef $ReminderSettingsCreateCompanionBuilder =
    ReminderSettingsCompanion Function({
      required String profileId,
      Value<String?> mode,
      Value<int?> intervalMin,
      Value<String?> fixedTimes,
      Value<String?> weekdays,
      Value<String?> quietStart,
      Value<String?> quietEnd,
      Value<int?> skipIfLoggedMin,
      Value<String?> vibrationPattern,
      Value<String?> textStyle,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $ReminderSettingsUpdateCompanionBuilder =
    ReminderSettingsCompanion Function({
      Value<String> profileId,
      Value<String?> mode,
      Value<int?> intervalMin,
      Value<String?> fixedTimes,
      Value<String?> weekdays,
      Value<String?> quietStart,
      Value<String?> quietEnd,
      Value<int?> skipIfLoggedMin,
      Value<String?> vibrationPattern,
      Value<String?> textStyle,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

class $ReminderSettingsFilterComposer
    extends Composer<_$AppDatabase, ReminderSettings> {
  $ReminderSettingsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intervalMin => $composableBuilder(
    column: $table.intervalMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fixedTimes => $composableBuilder(
    column: $table.fixedTimes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weekdays => $composableBuilder(
    column: $table.weekdays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quietStart => $composableBuilder(
    column: $table.quietStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quietEnd => $composableBuilder(
    column: $table.quietEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get skipIfLoggedMin => $composableBuilder(
    column: $table.skipIfLoggedMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vibrationPattern => $composableBuilder(
    column: $table.vibrationPattern,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textStyle => $composableBuilder(
    column: $table.textStyle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $ReminderSettingsOrderingComposer
    extends Composer<_$AppDatabase, ReminderSettings> {
  $ReminderSettingsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mode => $composableBuilder(
    column: $table.mode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intervalMin => $composableBuilder(
    column: $table.intervalMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fixedTimes => $composableBuilder(
    column: $table.fixedTimes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weekdays => $composableBuilder(
    column: $table.weekdays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quietStart => $composableBuilder(
    column: $table.quietStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quietEnd => $composableBuilder(
    column: $table.quietEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get skipIfLoggedMin => $composableBuilder(
    column: $table.skipIfLoggedMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vibrationPattern => $composableBuilder(
    column: $table.vibrationPattern,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textStyle => $composableBuilder(
    column: $table.textStyle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $ReminderSettingsAnnotationComposer
    extends Composer<_$AppDatabase, ReminderSettings> {
  $ReminderSettingsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumn<int> get intervalMin => $composableBuilder(
    column: $table.intervalMin,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fixedTimes => $composableBuilder(
    column: $table.fixedTimes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get weekdays =>
      $composableBuilder(column: $table.weekdays, builder: (column) => column);

  GeneratedColumn<String> get quietStart => $composableBuilder(
    column: $table.quietStart,
    builder: (column) => column,
  );

  GeneratedColumn<String> get quietEnd =>
      $composableBuilder(column: $table.quietEnd, builder: (column) => column);

  GeneratedColumn<int> get skipIfLoggedMin => $composableBuilder(
    column: $table.skipIfLoggedMin,
    builder: (column) => column,
  );

  GeneratedColumn<String> get vibrationPattern => $composableBuilder(
    column: $table.vibrationPattern,
    builder: (column) => column,
  );

  GeneratedColumn<String> get textStyle =>
      $composableBuilder(column: $table.textStyle, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $ReminderSettingsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          ReminderSettings,
          ReminderSetting,
          $ReminderSettingsFilterComposer,
          $ReminderSettingsOrderingComposer,
          $ReminderSettingsAnnotationComposer,
          $ReminderSettingsCreateCompanionBuilder,
          $ReminderSettingsUpdateCompanionBuilder,
          (
            ReminderSetting,
            BaseReferences<_$AppDatabase, ReminderSettings, ReminderSetting>,
          ),
          ReminderSetting,
          PrefetchHooks Function()
        > {
  $ReminderSettingsTableManager(_$AppDatabase db, ReminderSettings table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ReminderSettingsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ReminderSettingsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ReminderSettingsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> profileId = const Value.absent(),
                Value<String?> mode = const Value.absent(),
                Value<int?> intervalMin = const Value.absent(),
                Value<String?> fixedTimes = const Value.absent(),
                Value<String?> weekdays = const Value.absent(),
                Value<String?> quietStart = const Value.absent(),
                Value<String?> quietEnd = const Value.absent(),
                Value<int?> skipIfLoggedMin = const Value.absent(),
                Value<String?> vibrationPattern = const Value.absent(),
                Value<String?> textStyle = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReminderSettingsCompanion(
                profileId: profileId,
                mode: mode,
                intervalMin: intervalMin,
                fixedTimes: fixedTimes,
                weekdays: weekdays,
                quietStart: quietStart,
                quietEnd: quietEnd,
                skipIfLoggedMin: skipIfLoggedMin,
                vibrationPattern: vibrationPattern,
                textStyle: textStyle,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String profileId,
                Value<String?> mode = const Value.absent(),
                Value<int?> intervalMin = const Value.absent(),
                Value<String?> fixedTimes = const Value.absent(),
                Value<String?> weekdays = const Value.absent(),
                Value<String?> quietStart = const Value.absent(),
                Value<String?> quietEnd = const Value.absent(),
                Value<int?> skipIfLoggedMin = const Value.absent(),
                Value<String?> vibrationPattern = const Value.absent(),
                Value<String?> textStyle = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReminderSettingsCompanion.insert(
                profileId: profileId,
                mode: mode,
                intervalMin: intervalMin,
                fixedTimes: fixedTimes,
                weekdays: weekdays,
                quietStart: quietStart,
                quietEnd: quietEnd,
                skipIfLoggedMin: skipIfLoggedMin,
                vibrationPattern: vibrationPattern,
                textStyle: textStyle,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<ReminderSettings, ReminderSetting>(table),
                  BaseReferences<
                    _$AppDatabase,
                    ReminderSettings,
                    ReminderSetting
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $ReminderSettingsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      ReminderSettings,
      ReminderSetting,
      $ReminderSettingsFilterComposer,
      $ReminderSettingsOrderingComposer,
      $ReminderSettingsAnnotationComposer,
      $ReminderSettingsCreateCompanionBuilder,
      $ReminderSettingsUpdateCompanionBuilder,
      (
        ReminderSetting,
        BaseReferences<_$AppDatabase, ReminderSettings, ReminderSetting>,
      ),
      ReminderSetting,
      PrefetchHooks Function()
    >;
typedef $FastingSettingsCreateCompanionBuilder =
    FastingSettingsCompanion Function({
      required String profileId,
      Value<bool?> enabled,
      Value<String?> type,
      Value<String?> customDays,
      Value<String?> ifWindow,
      Value<String?> calcMethod,
      Value<String?> splitPattern,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $FastingSettingsUpdateCompanionBuilder =
    FastingSettingsCompanion Function({
      Value<String> profileId,
      Value<bool?> enabled,
      Value<String?> type,
      Value<String?> customDays,
      Value<String?> ifWindow,
      Value<String?> calcMethod,
      Value<String?> splitPattern,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

class $FastingSettingsFilterComposer
    extends Composer<_$AppDatabase, FastingSettings> {
  $FastingSettingsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customDays => $composableBuilder(
    column: $table.customDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ifWindow => $composableBuilder(
    column: $table.ifWindow,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get calcMethod => $composableBuilder(
    column: $table.calcMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get splitPattern => $composableBuilder(
    column: $table.splitPattern,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $FastingSettingsOrderingComposer
    extends Composer<_$AppDatabase, FastingSettings> {
  $FastingSettingsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customDays => $composableBuilder(
    column: $table.customDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ifWindow => $composableBuilder(
    column: $table.ifWindow,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get calcMethod => $composableBuilder(
    column: $table.calcMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get splitPattern => $composableBuilder(
    column: $table.splitPattern,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $FastingSettingsAnnotationComposer
    extends Composer<_$AppDatabase, FastingSettings> {
  $FastingSettingsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get customDays => $composableBuilder(
    column: $table.customDays,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ifWindow =>
      $composableBuilder(column: $table.ifWindow, builder: (column) => column);

  GeneratedColumn<String> get calcMethod => $composableBuilder(
    column: $table.calcMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get splitPattern => $composableBuilder(
    column: $table.splitPattern,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $FastingSettingsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          FastingSettings,
          FastingSetting,
          $FastingSettingsFilterComposer,
          $FastingSettingsOrderingComposer,
          $FastingSettingsAnnotationComposer,
          $FastingSettingsCreateCompanionBuilder,
          $FastingSettingsUpdateCompanionBuilder,
          (
            FastingSetting,
            BaseReferences<_$AppDatabase, FastingSettings, FastingSetting>,
          ),
          FastingSetting,
          PrefetchHooks Function()
        > {
  $FastingSettingsTableManager(_$AppDatabase db, FastingSettings table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $FastingSettingsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $FastingSettingsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $FastingSettingsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> profileId = const Value.absent(),
                Value<bool?> enabled = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String?> customDays = const Value.absent(),
                Value<String?> ifWindow = const Value.absent(),
                Value<String?> calcMethod = const Value.absent(),
                Value<String?> splitPattern = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FastingSettingsCompanion(
                profileId: profileId,
                enabled: enabled,
                type: type,
                customDays: customDays,
                ifWindow: ifWindow,
                calcMethod: calcMethod,
                splitPattern: splitPattern,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String profileId,
                Value<bool?> enabled = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String?> customDays = const Value.absent(),
                Value<String?> ifWindow = const Value.absent(),
                Value<String?> calcMethod = const Value.absent(),
                Value<String?> splitPattern = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FastingSettingsCompanion.insert(
                profileId: profileId,
                enabled: enabled,
                type: type,
                customDays: customDays,
                ifWindow: ifWindow,
                calcMethod: calcMethod,
                splitPattern: splitPattern,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<FastingSettings, FastingSetting>(table),
                  BaseReferences<
                    _$AppDatabase,
                    FastingSettings,
                    FastingSetting
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $FastingSettingsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      FastingSettings,
      FastingSetting,
      $FastingSettingsFilterComposer,
      $FastingSettingsOrderingComposer,
      $FastingSettingsAnnotationComposer,
      $FastingSettingsCreateCompanionBuilder,
      $FastingSettingsUpdateCompanionBuilder,
      (
        FastingSetting,
        BaseReferences<_$AppDatabase, FastingSettings, FastingSetting>,
      ),
      FastingSetting,
      PrefetchHooks Function()
    >;
typedef $OutboxCreateCompanionBuilder = OutboxCompanion Function({
  Value<int> id,
  required String targetTable,
  required String rowId,
  required String op,
  required String payload,
  required DateTime createdAt,
  Value<int> attempts,
});
typedef $OutboxUpdateCompanionBuilder = OutboxCompanion Function({
  Value<int> id,
  Value<String> targetTable,
  Value<String> rowId,
  Value<String> op,
  Value<String> payload,
  Value<DateTime> createdAt,
  Value<int> attempts,
});

class $OutboxFilterComposer extends Composer<_$AppDatabase, Outbox> {
  $OutboxFilterComposer({
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

  ColumnFilters<String> get targetTable => $composableBuilder(
    column: $table.targetTable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rowId => $composableBuilder(
    column: $table.rowId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get op => $composableBuilder(
    column: $table.op,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnFilters(column),
  );
}

class $OutboxOrderingComposer extends Composer<_$AppDatabase, Outbox> {
  $OutboxOrderingComposer({
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

  ColumnOrderings<String> get targetTable => $composableBuilder(
    column: $table.targetTable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rowId => $composableBuilder(
    column: $table.rowId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get op => $composableBuilder(
    column: $table.op,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attempts => $composableBuilder(
    column: $table.attempts,
    builder: (column) => ColumnOrderings(column),
  );
}

class $OutboxAnnotationComposer extends Composer<_$AppDatabase, Outbox> {
  $OutboxAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get targetTable => $composableBuilder(
    column: $table.targetTable,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rowId =>
      $composableBuilder(column: $table.rowId, builder: (column) => column);

  GeneratedColumn<String> get op =>
      $composableBuilder(column: $table.op, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get attempts =>
      $composableBuilder(column: $table.attempts, builder: (column) => column);
}

class $OutboxTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Outbox,
          OutboxEntry,
          $OutboxFilterComposer,
          $OutboxOrderingComposer,
          $OutboxAnnotationComposer,
          $OutboxCreateCompanionBuilder,
          $OutboxUpdateCompanionBuilder,
          (OutboxEntry, BaseReferences<_$AppDatabase, Outbox, OutboxEntry>),
          OutboxEntry,
          PrefetchHooks Function()
        > {
  $OutboxTableManager(_$AppDatabase db, Outbox table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $OutboxFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $OutboxOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $OutboxAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> targetTable = const Value.absent(),
                Value<String> rowId = const Value.absent(),
                Value<String> op = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> attempts = const Value.absent(),
              }) => OutboxCompanion(
                id: id,
                targetTable: targetTable,
                rowId: rowId,
                op: op,
                payload: payload,
                createdAt: createdAt,
                attempts: attempts,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String targetTable,
                required String rowId,
                required String op,
                required String payload,
                required DateTime createdAt,
                Value<int> attempts = const Value.absent(),
              }) => OutboxCompanion.insert(
                id: id,
                targetTable: targetTable,
                rowId: rowId,
                op: op,
                payload: payload,
                createdAt: createdAt,
                attempts: attempts,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<Outbox, OutboxEntry>(table),
                  BaseReferences<_$AppDatabase, Outbox, OutboxEntry>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $OutboxProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Outbox,
      OutboxEntry,
      $OutboxFilterComposer,
      $OutboxOrderingComposer,
      $OutboxAnnotationComposer,
      $OutboxCreateCompanionBuilder,
      $OutboxUpdateCompanionBuilder,
      (OutboxEntry, BaseReferences<_$AppDatabase, Outbox, OutboxEntry>),
      OutboxEntry,
      PrefetchHooks Function()
    >;
typedef $SyncStateCreateCompanionBuilder = SyncStateCompanion Function({
  required String targetTable,
  Value<DateTime?> lastPulledAt,
  Value<int> rowid,
});
typedef $SyncStateUpdateCompanionBuilder = SyncStateCompanion Function({
  Value<String> targetTable,
  Value<DateTime?> lastPulledAt,
  Value<int> rowid,
});

class $SyncStateFilterComposer extends Composer<_$AppDatabase, SyncState> {
  $SyncStateFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get targetTable => $composableBuilder(
    column: $table.targetTable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastPulledAt => $composableBuilder(
    column: $table.lastPulledAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $SyncStateOrderingComposer extends Composer<_$AppDatabase, SyncState> {
  $SyncStateOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get targetTable => $composableBuilder(
    column: $table.targetTable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastPulledAt => $composableBuilder(
    column: $table.lastPulledAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $SyncStateAnnotationComposer extends Composer<_$AppDatabase, SyncState> {
  $SyncStateAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get targetTable => $composableBuilder(
    column: $table.targetTable,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastPulledAt => $composableBuilder(
    column: $table.lastPulledAt,
    builder: (column) => column,
  );
}

class $SyncStateTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          SyncState,
          SyncStateEntry,
          $SyncStateFilterComposer,
          $SyncStateOrderingComposer,
          $SyncStateAnnotationComposer,
          $SyncStateCreateCompanionBuilder,
          $SyncStateUpdateCompanionBuilder,
          (
            SyncStateEntry,
            BaseReferences<_$AppDatabase, SyncState, SyncStateEntry>,
          ),
          SyncStateEntry,
          PrefetchHooks Function()
        > {
  $SyncStateTableManager(_$AppDatabase db, SyncState table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $SyncStateFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $SyncStateOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $SyncStateAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> targetTable = const Value.absent(),
                Value<DateTime?> lastPulledAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncStateCompanion(
                targetTable: targetTable,
                lastPulledAt: lastPulledAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String targetTable,
                Value<DateTime?> lastPulledAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncStateCompanion.insert(
                targetTable: targetTable,
                lastPulledAt: lastPulledAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<SyncState, SyncStateEntry>(table),
                  BaseReferences<_$AppDatabase, SyncState, SyncStateEntry>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $SyncStateProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      SyncState,
      SyncStateEntry,
      $SyncStateFilterComposer,
      $SyncStateOrderingComposer,
      $SyncStateAnnotationComposer,
      $SyncStateCreateCompanionBuilder,
      $SyncStateUpdateCompanionBuilder,
      (
        SyncStateEntry,
        BaseReferences<_$AppDatabase, SyncState, SyncStateEntry>,
      ),
      SyncStateEntry,
      PrefetchHooks Function()
    >;
typedef $CachedEntitlementCreateCompanionBuilder =
    CachedEntitlementCompanion Function({
      required String accountId,
      Value<bool> premium,
      Value<bool> family,
      Value<bool> removeAds,
      Value<bool> inTrial,
      Value<String?> premiumSource,
      Value<DateTime?> expiresAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $CachedEntitlementUpdateCompanionBuilder =
    CachedEntitlementCompanion Function({
      Value<String> accountId,
      Value<bool> premium,
      Value<bool> family,
      Value<bool> removeAds,
      Value<bool> inTrial,
      Value<String?> premiumSource,
      Value<DateTime?> expiresAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

class $CachedEntitlementFilterComposer
    extends Composer<_$AppDatabase, CachedEntitlement> {
  $CachedEntitlementFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get premium => $composableBuilder(
    column: $table.premium,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get family => $composableBuilder(
    column: $table.family,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get removeAds => $composableBuilder(
    column: $table.removeAds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get inTrial => $composableBuilder(
    column: $table.inTrial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get premiumSource => $composableBuilder(
    column: $table.premiumSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $CachedEntitlementOrderingComposer
    extends Composer<_$AppDatabase, CachedEntitlement> {
  $CachedEntitlementOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get premium => $composableBuilder(
    column: $table.premium,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get family => $composableBuilder(
    column: $table.family,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get removeAds => $composableBuilder(
    column: $table.removeAds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get inTrial => $composableBuilder(
    column: $table.inTrial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get premiumSource => $composableBuilder(
    column: $table.premiumSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $CachedEntitlementAnnotationComposer
    extends Composer<_$AppDatabase, CachedEntitlement> {
  $CachedEntitlementAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<bool> get premium =>
      $composableBuilder(column: $table.premium, builder: (column) => column);

  GeneratedColumn<bool> get family =>
      $composableBuilder(column: $table.family, builder: (column) => column);

  GeneratedColumn<bool> get removeAds =>
      $composableBuilder(column: $table.removeAds, builder: (column) => column);

  GeneratedColumn<bool> get inTrial =>
      $composableBuilder(column: $table.inTrial, builder: (column) => column);

  GeneratedColumn<String> get premiumSource => $composableBuilder(
    column: $table.premiumSource,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $CachedEntitlementTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          CachedEntitlement,
          CachedEntitlementEntry,
          $CachedEntitlementFilterComposer,
          $CachedEntitlementOrderingComposer,
          $CachedEntitlementAnnotationComposer,
          $CachedEntitlementCreateCompanionBuilder,
          $CachedEntitlementUpdateCompanionBuilder,
          (
            CachedEntitlementEntry,
            BaseReferences<
              _$AppDatabase,
              CachedEntitlement,
              CachedEntitlementEntry
            >,
          ),
          CachedEntitlementEntry,
          PrefetchHooks Function()
        > {
  $CachedEntitlementTableManager(_$AppDatabase db, CachedEntitlement table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CachedEntitlementFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CachedEntitlementOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CachedEntitlementAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> accountId = const Value.absent(),
                Value<bool> premium = const Value.absent(),
                Value<bool> family = const Value.absent(),
                Value<bool> removeAds = const Value.absent(),
                Value<bool> inTrial = const Value.absent(),
                Value<String?> premiumSource = const Value.absent(),
                Value<DateTime?> expiresAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedEntitlementCompanion(
                accountId: accountId,
                premium: premium,
                family: family,
                removeAds: removeAds,
                inTrial: inTrial,
                premiumSource: premiumSource,
                expiresAt: expiresAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String accountId,
                Value<bool> premium = const Value.absent(),
                Value<bool> family = const Value.absent(),
                Value<bool> removeAds = const Value.absent(),
                Value<bool> inTrial = const Value.absent(),
                Value<String?> premiumSource = const Value.absent(),
                Value<DateTime?> expiresAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedEntitlementCompanion.insert(
                accountId: accountId,
                premium: premium,
                family: family,
                removeAds: removeAds,
                inTrial: inTrial,
                premiumSource: premiumSource,
                expiresAt: expiresAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<CachedEntitlement, CachedEntitlementEntry>(table),
                  BaseReferences<
                    _$AppDatabase,
                    CachedEntitlement,
                    CachedEntitlementEntry
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $CachedEntitlementProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      CachedEntitlement,
      CachedEntitlementEntry,
      $CachedEntitlementFilterComposer,
      $CachedEntitlementOrderingComposer,
      $CachedEntitlementAnnotationComposer,
      $CachedEntitlementCreateCompanionBuilder,
      $CachedEntitlementUpdateCompanionBuilder,
      (
        CachedEntitlementEntry,
        BaseReferences<
          _$AppDatabase,
          CachedEntitlement,
          CachedEntitlementEntry
        >,
      ),
      CachedEntitlementEntry,
      PrefetchHooks Function()
    >;
typedef $CachedQuotaCreateCompanionBuilder = CachedQuotaCompanion Function({
  required String accountId,
  required String kind,
  required int monthlyLeft,
  required int creditsLeft,
  required int dailyLeft,
  Value<DateTime?> resetsAt,
  Value<int> rowid,
});
typedef $CachedQuotaUpdateCompanionBuilder = CachedQuotaCompanion Function({
  Value<String> accountId,
  Value<String> kind,
  Value<int> monthlyLeft,
  Value<int> creditsLeft,
  Value<int> dailyLeft,
  Value<DateTime?> resetsAt,
  Value<int> rowid,
});

class $CachedQuotaFilterComposer extends Composer<_$AppDatabase, CachedQuota> {
  $CachedQuotaFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get monthlyLeft => $composableBuilder(
    column: $table.monthlyLeft,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get creditsLeft => $composableBuilder(
    column: $table.creditsLeft,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyLeft => $composableBuilder(
    column: $table.dailyLeft,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get resetsAt => $composableBuilder(
    column: $table.resetsAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $CachedQuotaOrderingComposer
    extends Composer<_$AppDatabase, CachedQuota> {
  $CachedQuotaOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get monthlyLeft => $composableBuilder(
    column: $table.monthlyLeft,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get creditsLeft => $composableBuilder(
    column: $table.creditsLeft,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyLeft => $composableBuilder(
    column: $table.dailyLeft,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get resetsAt => $composableBuilder(
    column: $table.resetsAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $CachedQuotaAnnotationComposer
    extends Composer<_$AppDatabase, CachedQuota> {
  $CachedQuotaAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<int> get monthlyLeft => $composableBuilder(
    column: $table.monthlyLeft,
    builder: (column) => column,
  );

  GeneratedColumn<int> get creditsLeft => $composableBuilder(
    column: $table.creditsLeft,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dailyLeft =>
      $composableBuilder(column: $table.dailyLeft, builder: (column) => column);

  GeneratedColumn<DateTime> get resetsAt =>
      $composableBuilder(column: $table.resetsAt, builder: (column) => column);
}

class $CachedQuotaTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          CachedQuota,
          CachedQuotaEntry,
          $CachedQuotaFilterComposer,
          $CachedQuotaOrderingComposer,
          $CachedQuotaAnnotationComposer,
          $CachedQuotaCreateCompanionBuilder,
          $CachedQuotaUpdateCompanionBuilder,
          (
            CachedQuotaEntry,
            BaseReferences<_$AppDatabase, CachedQuota, CachedQuotaEntry>,
          ),
          CachedQuotaEntry,
          PrefetchHooks Function()
        > {
  $CachedQuotaTableManager(_$AppDatabase db, CachedQuota table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CachedQuotaFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CachedQuotaOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CachedQuotaAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> accountId = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<int> monthlyLeft = const Value.absent(),
                Value<int> creditsLeft = const Value.absent(),
                Value<int> dailyLeft = const Value.absent(),
                Value<DateTime?> resetsAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedQuotaCompanion(
                accountId: accountId,
                kind: kind,
                monthlyLeft: monthlyLeft,
                creditsLeft: creditsLeft,
                dailyLeft: dailyLeft,
                resetsAt: resetsAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String accountId,
                required String kind,
                required int monthlyLeft,
                required int creditsLeft,
                required int dailyLeft,
                Value<DateTime?> resetsAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedQuotaCompanion.insert(
                accountId: accountId,
                kind: kind,
                monthlyLeft: monthlyLeft,
                creditsLeft: creditsLeft,
                dailyLeft: dailyLeft,
                resetsAt: resetsAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<CachedQuota, CachedQuotaEntry>(table),
                  BaseReferences<_$AppDatabase, CachedQuota, CachedQuotaEntry>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $CachedQuotaProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      CachedQuota,
      CachedQuotaEntry,
      $CachedQuotaFilterComposer,
      $CachedQuotaOrderingComposer,
      $CachedQuotaAnnotationComposer,
      $CachedQuotaCreateCompanionBuilder,
      $CachedQuotaUpdateCompanionBuilder,
      (
        CachedQuotaEntry,
        BaseReferences<_$AppDatabase, CachedQuota, CachedQuotaEntry>,
      ),
      CachedQuotaEntry,
      PrefetchHooks Function()
    >;
typedef $PendingExternalLogsCreateCompanionBuilder =
    PendingExternalLogsCompanion Function({
      required String id,
      required String drinkId,
      required int volumeMl,
      required String source,
      required DateTime loggedAt,
      Value<int> rowid,
    });
typedef $PendingExternalLogsUpdateCompanionBuilder =
    PendingExternalLogsCompanion Function({
      Value<String> id,
      Value<String> drinkId,
      Value<int> volumeMl,
      Value<String> source,
      Value<DateTime> loggedAt,
      Value<int> rowid,
    });

class $PendingExternalLogsFilterComposer
    extends Composer<_$AppDatabase, PendingExternalLogs> {
  $PendingExternalLogsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get drinkId => $composableBuilder(
    column: $table.drinkId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get volumeMl => $composableBuilder(
    column: $table.volumeMl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $PendingExternalLogsOrderingComposer
    extends Composer<_$AppDatabase, PendingExternalLogs> {
  $PendingExternalLogsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get drinkId => $composableBuilder(
    column: $table.drinkId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get volumeMl => $composableBuilder(
    column: $table.volumeMl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $PendingExternalLogsAnnotationComposer
    extends Composer<_$AppDatabase, PendingExternalLogs> {
  $PendingExternalLogsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get drinkId =>
      $composableBuilder(column: $table.drinkId, builder: (column) => column);

  GeneratedColumn<int> get volumeMl =>
      $composableBuilder(column: $table.volumeMl, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);
}

class $PendingExternalLogsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          PendingExternalLogs,
          PendingExternalLog,
          $PendingExternalLogsFilterComposer,
          $PendingExternalLogsOrderingComposer,
          $PendingExternalLogsAnnotationComposer,
          $PendingExternalLogsCreateCompanionBuilder,
          $PendingExternalLogsUpdateCompanionBuilder,
          (
            PendingExternalLog,
            BaseReferences<
              _$AppDatabase,
              PendingExternalLogs,
              PendingExternalLog
            >,
          ),
          PendingExternalLog,
          PrefetchHooks Function()
        > {
  $PendingExternalLogsTableManager(_$AppDatabase db, PendingExternalLogs table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $PendingExternalLogsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $PendingExternalLogsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $PendingExternalLogsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> drinkId = const Value.absent(),
                Value<int> volumeMl = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PendingExternalLogsCompanion(
                id: id,
                drinkId: drinkId,
                volumeMl: volumeMl,
                source: source,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String drinkId,
                required int volumeMl,
                required String source,
                required DateTime loggedAt,
                Value<int> rowid = const Value.absent(),
              }) => PendingExternalLogsCompanion.insert(
                id: id,
                drinkId: drinkId,
                volumeMl: volumeMl,
                source: source,
                loggedAt: loggedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<PendingExternalLogs, PendingExternalLog>(table),
                  BaseReferences<
                    _$AppDatabase,
                    PendingExternalLogs,
                    PendingExternalLog
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $PendingExternalLogsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      PendingExternalLogs,
      PendingExternalLog,
      $PendingExternalLogsFilterComposer,
      $PendingExternalLogsOrderingComposer,
      $PendingExternalLogsAnnotationComposer,
      $PendingExternalLogsCreateCompanionBuilder,
      $PendingExternalLogsUpdateCompanionBuilder,
      (
        PendingExternalLog,
        BaseReferences<_$AppDatabase, PendingExternalLogs, PendingExternalLog>,
      ),
      PendingExternalLog,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $ProfilesTableManager get profiles =>
      $ProfilesTableManager(_db, _db.profiles);
  $DrinkLogsTableManager get drinkLogs =>
      $DrinkLogsTableManager(_db, _db.drinkLogs);
  $CustomDrinksTableManager get customDrinks =>
      $CustomDrinksTableManager(_db, _db.customDrinks);
  $DailyGoalsTableManager get dailyGoals =>
      $DailyGoalsTableManager(_db, _db.dailyGoals);
  $ReminderSettingsTableManager get reminderSettings =>
      $ReminderSettingsTableManager(_db, _db.reminderSettings);
  $FastingSettingsTableManager get fastingSettings =>
      $FastingSettingsTableManager(_db, _db.fastingSettings);
  $OutboxTableManager get outbox => $OutboxTableManager(_db, _db.outbox);
  $SyncStateTableManager get syncState =>
      $SyncStateTableManager(_db, _db.syncState);
  $CachedEntitlementTableManager get cachedEntitlement =>
      $CachedEntitlementTableManager(_db, _db.cachedEntitlement);
  $CachedQuotaTableManager get cachedQuota =>
      $CachedQuotaTableManager(_db, _db.cachedQuota);
  $PendingExternalLogsTableManager get pendingExternalLogs =>
      $PendingExternalLogsTableManager(_db, _db.pendingExternalLogs);
}
