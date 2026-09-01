// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CachedUsersTable extends CachedUsers
    with TableInfo<$CachedUsersTable, CachedUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedUsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activityLevelMeta = const VerificationMeta(
    'activityLevel',
  );
  @override
  late final GeneratedColumn<String> activityLevel = GeneratedColumn<String>(
    'activity_level',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _foodVibeMeta = const VerificationMeta(
    'foodVibe',
  );
  @override
  late final GeneratedColumn<String> foodVibe = GeneratedColumn<String>(
    'food_vibe',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mainGoalMeta = const VerificationMeta(
    'mainGoal',
  );
  @override
  late final GeneratedColumn<String> mainGoal = GeneratedColumn<String>(
    'main_goal',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
    'result',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trainingMeta = const VerificationMeta(
    'training',
  );
  @override
  late final GeneratedColumn<String> training = GeneratedColumn<String>(
    'training',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _profileImageMeta = const VerificationMeta(
    'profileImage',
  );
  @override
  late final GeneratedColumn<String> profileImage = GeneratedColumn<String>(
    'profile_image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _calorieMeta = const VerificationMeta(
    'calorie',
  );
  @override
  late final GeneratedColumn<double> calorie = GeneratedColumn<double>(
    'calorie',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _subscriptionPlanMeta = const VerificationMeta(
    'subscriptionPlan',
  );
  @override
  late final GeneratedColumn<String> subscriptionPlan = GeneratedColumn<String>(
    'subscription_plan',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isTwoFactorMeta = const VerificationMeta(
    'isTwoFactor',
  );
  @override
  late final GeneratedColumn<bool> isTwoFactor = GeneratedColumn<bool>(
    'is_two_factor',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_two_factor" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    firstName,
    lastName,
    email,
    gender,
    age,
    height,
    activityLevel,
    foodVibe,
    mainGoal,
    result,
    training,
    image,
    profileImage,
    weight,
    calorie,
    subscriptionPlan,
    isTwoFactor,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_users';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedUser> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
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
    if (data.containsKey('food_vibe')) {
      context.handle(
        _foodVibeMeta,
        foodVibe.isAcceptableOrUnknown(data['food_vibe']!, _foodVibeMeta),
      );
    }
    if (data.containsKey('main_goal')) {
      context.handle(
        _mainGoalMeta,
        mainGoal.isAcceptableOrUnknown(data['main_goal']!, _mainGoalMeta),
      );
    }
    if (data.containsKey('result')) {
      context.handle(
        _resultMeta,
        result.isAcceptableOrUnknown(data['result']!, _resultMeta),
      );
    }
    if (data.containsKey('training')) {
      context.handle(
        _trainingMeta,
        training.isAcceptableOrUnknown(data['training']!, _trainingMeta),
      );
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    }
    if (data.containsKey('profile_image')) {
      context.handle(
        _profileImageMeta,
        profileImage.isAcceptableOrUnknown(
          data['profile_image']!,
          _profileImageMeta,
        ),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('calorie')) {
      context.handle(
        _calorieMeta,
        calorie.isAcceptableOrUnknown(data['calorie']!, _calorieMeta),
      );
    }
    if (data.containsKey('subscription_plan')) {
      context.handle(
        _subscriptionPlanMeta,
        subscriptionPlan.isAcceptableOrUnknown(
          data['subscription_plan']!,
          _subscriptionPlanMeta,
        ),
      );
    }
    if (data.containsKey('is_two_factor')) {
      context.handle(
        _isTwoFactorMeta,
        isTwoFactor.isAcceptableOrUnknown(
          data['is_two_factor']!,
          _isTwoFactorMeta,
        ),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedUser(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      ),
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      ),
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height'],
      ),
      activityLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}activity_level'],
      ),
      foodVibe: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}food_vibe'],
      ),
      mainGoal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}main_goal'],
      ),
      result: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result'],
      ),
      training: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}training'],
      ),
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      ),
      profileImage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_image'],
      ),
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      calorie: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calorie'],
      ),
      subscriptionPlan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subscription_plan'],
      ),
      isTwoFactor: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_two_factor'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedUsersTable createAlias(String alias) {
    return $CachedUsersTable(attachedDatabase, alias);
  }
}

class CachedUser extends DataClass implements Insertable<CachedUser> {
  final String id;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final int? age;
  final double? height;
  final String? activityLevel;
  final String? foodVibe;
  final String? mainGoal;
  final String? result;
  final String? training;
  final String? image;
  final String? profileImage;
  final double? weight;
  final double? calorie;
  final String? subscriptionPlan;
  final bool isTwoFactor;
  final DateTime cachedAt;
  const CachedUser({
    required this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.age,
    this.height,
    this.activityLevel,
    this.foodVibe,
    this.mainGoal,
    this.result,
    this.training,
    this.image,
    this.profileImage,
    this.weight,
    this.calorie,
    this.subscriptionPlan,
    required this.isTwoFactor,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<double>(height);
    }
    if (!nullToAbsent || activityLevel != null) {
      map['activity_level'] = Variable<String>(activityLevel);
    }
    if (!nullToAbsent || foodVibe != null) {
      map['food_vibe'] = Variable<String>(foodVibe);
    }
    if (!nullToAbsent || mainGoal != null) {
      map['main_goal'] = Variable<String>(mainGoal);
    }
    if (!nullToAbsent || result != null) {
      map['result'] = Variable<String>(result);
    }
    if (!nullToAbsent || training != null) {
      map['training'] = Variable<String>(training);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || profileImage != null) {
      map['profile_image'] = Variable<String>(profileImage);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || calorie != null) {
      map['calorie'] = Variable<double>(calorie);
    }
    if (!nullToAbsent || subscriptionPlan != null) {
      map['subscription_plan'] = Variable<String>(subscriptionPlan);
    }
    map['is_two_factor'] = Variable<bool>(isTwoFactor);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedUsersCompanion toCompanion(bool nullToAbsent) {
    return CachedUsersCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      height: height == null && nullToAbsent
          ? const Value.absent()
          : Value(height),
      activityLevel: activityLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(activityLevel),
      foodVibe: foodVibe == null && nullToAbsent
          ? const Value.absent()
          : Value(foodVibe),
      mainGoal: mainGoal == null && nullToAbsent
          ? const Value.absent()
          : Value(mainGoal),
      result: result == null && nullToAbsent
          ? const Value.absent()
          : Value(result),
      training: training == null && nullToAbsent
          ? const Value.absent()
          : Value(training),
      image: image == null && nullToAbsent
          ? const Value.absent()
          : Value(image),
      profileImage: profileImage == null && nullToAbsent
          ? const Value.absent()
          : Value(profileImage),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      calorie: calorie == null && nullToAbsent
          ? const Value.absent()
          : Value(calorie),
      subscriptionPlan: subscriptionPlan == null && nullToAbsent
          ? const Value.absent()
          : Value(subscriptionPlan),
      isTwoFactor: Value(isTwoFactor),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedUser.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedUser(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      email: serializer.fromJson<String?>(json['email']),
      gender: serializer.fromJson<String?>(json['gender']),
      age: serializer.fromJson<int?>(json['age']),
      height: serializer.fromJson<double?>(json['height']),
      activityLevel: serializer.fromJson<String?>(json['activityLevel']),
      foodVibe: serializer.fromJson<String?>(json['foodVibe']),
      mainGoal: serializer.fromJson<String?>(json['mainGoal']),
      result: serializer.fromJson<String?>(json['result']),
      training: serializer.fromJson<String?>(json['training']),
      image: serializer.fromJson<String?>(json['image']),
      profileImage: serializer.fromJson<String?>(json['profileImage']),
      weight: serializer.fromJson<double?>(json['weight']),
      calorie: serializer.fromJson<double?>(json['calorie']),
      subscriptionPlan: serializer.fromJson<String?>(json['subscriptionPlan']),
      isTwoFactor: serializer.fromJson<bool>(json['isTwoFactor']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String?>(name),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'email': serializer.toJson<String?>(email),
      'gender': serializer.toJson<String?>(gender),
      'age': serializer.toJson<int?>(age),
      'height': serializer.toJson<double?>(height),
      'activityLevel': serializer.toJson<String?>(activityLevel),
      'foodVibe': serializer.toJson<String?>(foodVibe),
      'mainGoal': serializer.toJson<String?>(mainGoal),
      'result': serializer.toJson<String?>(result),
      'training': serializer.toJson<String?>(training),
      'image': serializer.toJson<String?>(image),
      'profileImage': serializer.toJson<String?>(profileImage),
      'weight': serializer.toJson<double?>(weight),
      'calorie': serializer.toJson<double?>(calorie),
      'subscriptionPlan': serializer.toJson<String?>(subscriptionPlan),
      'isTwoFactor': serializer.toJson<bool>(isTwoFactor),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedUser copyWith({
    String? id,
    Value<String?> name = const Value.absent(),
    Value<String?> firstName = const Value.absent(),
    Value<String?> lastName = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> gender = const Value.absent(),
    Value<int?> age = const Value.absent(),
    Value<double?> height = const Value.absent(),
    Value<String?> activityLevel = const Value.absent(),
    Value<String?> foodVibe = const Value.absent(),
    Value<String?> mainGoal = const Value.absent(),
    Value<String?> result = const Value.absent(),
    Value<String?> training = const Value.absent(),
    Value<String?> image = const Value.absent(),
    Value<String?> profileImage = const Value.absent(),
    Value<double?> weight = const Value.absent(),
    Value<double?> calorie = const Value.absent(),
    Value<String?> subscriptionPlan = const Value.absent(),
    bool? isTwoFactor,
    DateTime? cachedAt,
  }) => CachedUser(
    id: id ?? this.id,
    name: name.present ? name.value : this.name,
    firstName: firstName.present ? firstName.value : this.firstName,
    lastName: lastName.present ? lastName.value : this.lastName,
    email: email.present ? email.value : this.email,
    gender: gender.present ? gender.value : this.gender,
    age: age.present ? age.value : this.age,
    height: height.present ? height.value : this.height,
    activityLevel: activityLevel.present
        ? activityLevel.value
        : this.activityLevel,
    foodVibe: foodVibe.present ? foodVibe.value : this.foodVibe,
    mainGoal: mainGoal.present ? mainGoal.value : this.mainGoal,
    result: result.present ? result.value : this.result,
    training: training.present ? training.value : this.training,
    image: image.present ? image.value : this.image,
    profileImage: profileImage.present ? profileImage.value : this.profileImage,
    weight: weight.present ? weight.value : this.weight,
    calorie: calorie.present ? calorie.value : this.calorie,
    subscriptionPlan: subscriptionPlan.present
        ? subscriptionPlan.value
        : this.subscriptionPlan,
    isTwoFactor: isTwoFactor ?? this.isTwoFactor,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedUser copyWithCompanion(CachedUsersCompanion data) {
    return CachedUser(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      email: data.email.present ? data.email.value : this.email,
      gender: data.gender.present ? data.gender.value : this.gender,
      age: data.age.present ? data.age.value : this.age,
      height: data.height.present ? data.height.value : this.height,
      activityLevel: data.activityLevel.present
          ? data.activityLevel.value
          : this.activityLevel,
      foodVibe: data.foodVibe.present ? data.foodVibe.value : this.foodVibe,
      mainGoal: data.mainGoal.present ? data.mainGoal.value : this.mainGoal,
      result: data.result.present ? data.result.value : this.result,
      training: data.training.present ? data.training.value : this.training,
      image: data.image.present ? data.image.value : this.image,
      profileImage: data.profileImage.present
          ? data.profileImage.value
          : this.profileImage,
      weight: data.weight.present ? data.weight.value : this.weight,
      calorie: data.calorie.present ? data.calorie.value : this.calorie,
      subscriptionPlan: data.subscriptionPlan.present
          ? data.subscriptionPlan.value
          : this.subscriptionPlan,
      isTwoFactor: data.isTwoFactor.present
          ? data.isTwoFactor.value
          : this.isTwoFactor,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedUser(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('gender: $gender, ')
          ..write('age: $age, ')
          ..write('height: $height, ')
          ..write('activityLevel: $activityLevel, ')
          ..write('foodVibe: $foodVibe, ')
          ..write('mainGoal: $mainGoal, ')
          ..write('result: $result, ')
          ..write('training: $training, ')
          ..write('image: $image, ')
          ..write('profileImage: $profileImage, ')
          ..write('weight: $weight, ')
          ..write('calorie: $calorie, ')
          ..write('subscriptionPlan: $subscriptionPlan, ')
          ..write('isTwoFactor: $isTwoFactor, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    firstName,
    lastName,
    email,
    gender,
    age,
    height,
    activityLevel,
    foodVibe,
    mainGoal,
    result,
    training,
    image,
    profileImage,
    weight,
    calorie,
    subscriptionPlan,
    isTwoFactor,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedUser &&
          other.id == this.id &&
          other.name == this.name &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.email == this.email &&
          other.gender == this.gender &&
          other.age == this.age &&
          other.height == this.height &&
          other.activityLevel == this.activityLevel &&
          other.foodVibe == this.foodVibe &&
          other.mainGoal == this.mainGoal &&
          other.result == this.result &&
          other.training == this.training &&
          other.image == this.image &&
          other.profileImage == this.profileImage &&
          other.weight == this.weight &&
          other.calorie == this.calorie &&
          other.subscriptionPlan == this.subscriptionPlan &&
          other.isTwoFactor == this.isTwoFactor &&
          other.cachedAt == this.cachedAt);
}

class CachedUsersCompanion extends UpdateCompanion<CachedUser> {
  final Value<String> id;
  final Value<String?> name;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> email;
  final Value<String?> gender;
  final Value<int?> age;
  final Value<double?> height;
  final Value<String?> activityLevel;
  final Value<String?> foodVibe;
  final Value<String?> mainGoal;
  final Value<String?> result;
  final Value<String?> training;
  final Value<String?> image;
  final Value<String?> profileImage;
  final Value<double?> weight;
  final Value<double?> calorie;
  final Value<String?> subscriptionPlan;
  final Value<bool> isTwoFactor;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedUsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.gender = const Value.absent(),
    this.age = const Value.absent(),
    this.height = const Value.absent(),
    this.activityLevel = const Value.absent(),
    this.foodVibe = const Value.absent(),
    this.mainGoal = const Value.absent(),
    this.result = const Value.absent(),
    this.training = const Value.absent(),
    this.image = const Value.absent(),
    this.profileImage = const Value.absent(),
    this.weight = const Value.absent(),
    this.calorie = const Value.absent(),
    this.subscriptionPlan = const Value.absent(),
    this.isTwoFactor = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedUsersCompanion.insert({
    required String id,
    this.name = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.gender = const Value.absent(),
    this.age = const Value.absent(),
    this.height = const Value.absent(),
    this.activityLevel = const Value.absent(),
    this.foodVibe = const Value.absent(),
    this.mainGoal = const Value.absent(),
    this.result = const Value.absent(),
    this.training = const Value.absent(),
    this.image = const Value.absent(),
    this.profileImage = const Value.absent(),
    this.weight = const Value.absent(),
    this.calorie = const Value.absent(),
    this.subscriptionPlan = const Value.absent(),
    this.isTwoFactor = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<CachedUser> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? email,
    Expression<String>? gender,
    Expression<int>? age,
    Expression<double>? height,
    Expression<String>? activityLevel,
    Expression<String>? foodVibe,
    Expression<String>? mainGoal,
    Expression<String>? result,
    Expression<String>? training,
    Expression<String>? image,
    Expression<String>? profileImage,
    Expression<double>? weight,
    Expression<double>? calorie,
    Expression<String>? subscriptionPlan,
    Expression<bool>? isTwoFactor,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (gender != null) 'gender': gender,
      if (age != null) 'age': age,
      if (height != null) 'height': height,
      if (activityLevel != null) 'activity_level': activityLevel,
      if (foodVibe != null) 'food_vibe': foodVibe,
      if (mainGoal != null) 'main_goal': mainGoal,
      if (result != null) 'result': result,
      if (training != null) 'training': training,
      if (image != null) 'image': image,
      if (profileImage != null) 'profile_image': profileImage,
      if (weight != null) 'weight': weight,
      if (calorie != null) 'calorie': calorie,
      if (subscriptionPlan != null) 'subscription_plan': subscriptionPlan,
      if (isTwoFactor != null) 'is_two_factor': isTwoFactor,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedUsersCompanion copyWith({
    Value<String>? id,
    Value<String?>? name,
    Value<String?>? firstName,
    Value<String?>? lastName,
    Value<String?>? email,
    Value<String?>? gender,
    Value<int?>? age,
    Value<double?>? height,
    Value<String?>? activityLevel,
    Value<String?>? foodVibe,
    Value<String?>? mainGoal,
    Value<String?>? result,
    Value<String?>? training,
    Value<String?>? image,
    Value<String?>? profileImage,
    Value<double?>? weight,
    Value<double?>? calorie,
    Value<String?>? subscriptionPlan,
    Value<bool>? isTwoFactor,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return CachedUsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      height: height ?? this.height,
      activityLevel: activityLevel ?? this.activityLevel,
      foodVibe: foodVibe ?? this.foodVibe,
      mainGoal: mainGoal ?? this.mainGoal,
      result: result ?? this.result,
      training: training ?? this.training,
      image: image ?? this.image,
      profileImage: profileImage ?? this.profileImage,
      weight: weight ?? this.weight,
      calorie: calorie ?? this.calorie,
      subscriptionPlan: subscriptionPlan ?? this.subscriptionPlan,
      isTwoFactor: isTwoFactor ?? this.isTwoFactor,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (activityLevel.present) {
      map['activity_level'] = Variable<String>(activityLevel.value);
    }
    if (foodVibe.present) {
      map['food_vibe'] = Variable<String>(foodVibe.value);
    }
    if (mainGoal.present) {
      map['main_goal'] = Variable<String>(mainGoal.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (training.present) {
      map['training'] = Variable<String>(training.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (profileImage.present) {
      map['profile_image'] = Variable<String>(profileImage.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (calorie.present) {
      map['calorie'] = Variable<double>(calorie.value);
    }
    if (subscriptionPlan.present) {
      map['subscription_plan'] = Variable<String>(subscriptionPlan.value);
    }
    if (isTwoFactor.present) {
      map['is_two_factor'] = Variable<bool>(isTwoFactor.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedUsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('gender: $gender, ')
          ..write('age: $age, ')
          ..write('height: $height, ')
          ..write('activityLevel: $activityLevel, ')
          ..write('foodVibe: $foodVibe, ')
          ..write('mainGoal: $mainGoal, ')
          ..write('result: $result, ')
          ..write('training: $training, ')
          ..write('image: $image, ')
          ..write('profileImage: $profileImage, ')
          ..write('weight: $weight, ')
          ..write('calorie: $calorie, ')
          ..write('subscriptionPlan: $subscriptionPlan, ')
          ..write('isTwoFactor: $isTwoFactor, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedMealsTable extends CachedMeals
    with TableInfo<$CachedMealsTable, CachedMeal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedMealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mealTypeMeta = const VerificationMeta(
    'mealType',
  );
  @override
  late final GeneratedColumn<String> mealType = GeneratedColumn<String>(
    'meal_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _calorieMeta = const VerificationMeta(
    'calorie',
  );
  @override
  late final GeneratedColumn<double> calorie = GeneratedColumn<double>(
    'calorie',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _proteinMeta = const VerificationMeta(
    'protein',
  );
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
    'protein',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _carbMeta = const VerificationMeta('carb');
  @override
  late final GeneratedColumn<double> carb = GeneratedColumn<double>(
    'carb',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
    'fat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prepTimeMeta = const VerificationMeta(
    'prepTime',
  );
  @override
  late final GeneratedColumn<String> prepTime = GeneratedColumn<String>(
    'prep_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ingredientsJsonMeta = const VerificationMeta(
    'ingredientsJson',
  );
  @override
  late final GeneratedColumn<String> ingredientsJson = GeneratedColumn<String>(
    'ingredients_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    name,
    mealType,
    calorie,
    protein,
    carb,
    fat,
    image,
    prepTime,
    ingredientsJson,
    instructions,
    createdAt,
    updatedAt,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_meals';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedMeal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('meal_type')) {
      context.handle(
        _mealTypeMeta,
        mealType.isAcceptableOrUnknown(data['meal_type']!, _mealTypeMeta),
      );
    }
    if (data.containsKey('calorie')) {
      context.handle(
        _calorieMeta,
        calorie.isAcceptableOrUnknown(data['calorie']!, _calorieMeta),
      );
    }
    if (data.containsKey('protein')) {
      context.handle(
        _proteinMeta,
        protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta),
      );
    }
    if (data.containsKey('carb')) {
      context.handle(
        _carbMeta,
        carb.isAcceptableOrUnknown(data['carb']!, _carbMeta),
      );
    }
    if (data.containsKey('fat')) {
      context.handle(
        _fatMeta,
        fat.isAcceptableOrUnknown(data['fat']!, _fatMeta),
      );
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    }
    if (data.containsKey('prep_time')) {
      context.handle(
        _prepTimeMeta,
        prepTime.isAcceptableOrUnknown(data['prep_time']!, _prepTimeMeta),
      );
    }
    if (data.containsKey('ingredients_json')) {
      context.handle(
        _ingredientsJsonMeta,
        ingredientsJson.isAcceptableOrUnknown(
          data['ingredients_json']!,
          _ingredientsJsonMeta,
        ),
      );
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedMeal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedMeal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      mealType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meal_type'],
      ),
      calorie: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calorie'],
      ),
      protein: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein'],
      ),
      carb: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carb'],
      ),
      fat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fat'],
      ),
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      ),
      prepTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prep_time'],
      ),
      ingredientsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredients_json'],
      ),
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedMealsTable createAlias(String alias) {
    return $CachedMealsTable(attachedDatabase, alias);
  }
}

class CachedMeal extends DataClass implements Insertable<CachedMeal> {
  final String id;
  final String? userId;
  final String? name;
  final String? mealType;
  final double? calorie;
  final double? protein;
  final double? carb;
  final double? fat;
  final String? image;
  final String? prepTime;
  final String? ingredientsJson;
  final String? instructions;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime cachedAt;
  const CachedMeal({
    required this.id,
    this.userId,
    this.name,
    this.mealType,
    this.calorie,
    this.protein,
    this.carb,
    this.fat,
    this.image,
    this.prepTime,
    this.ingredientsJson,
    this.instructions,
    this.createdAt,
    this.updatedAt,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || mealType != null) {
      map['meal_type'] = Variable<String>(mealType);
    }
    if (!nullToAbsent || calorie != null) {
      map['calorie'] = Variable<double>(calorie);
    }
    if (!nullToAbsent || protein != null) {
      map['protein'] = Variable<double>(protein);
    }
    if (!nullToAbsent || carb != null) {
      map['carb'] = Variable<double>(carb);
    }
    if (!nullToAbsent || fat != null) {
      map['fat'] = Variable<double>(fat);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || prepTime != null) {
      map['prep_time'] = Variable<String>(prepTime);
    }
    if (!nullToAbsent || ingredientsJson != null) {
      map['ingredients_json'] = Variable<String>(ingredientsJson);
    }
    if (!nullToAbsent || instructions != null) {
      map['instructions'] = Variable<String>(instructions);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedMealsCompanion toCompanion(bool nullToAbsent) {
    return CachedMealsCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      mealType: mealType == null && nullToAbsent
          ? const Value.absent()
          : Value(mealType),
      calorie: calorie == null && nullToAbsent
          ? const Value.absent()
          : Value(calorie),
      protein: protein == null && nullToAbsent
          ? const Value.absent()
          : Value(protein),
      carb: carb == null && nullToAbsent ? const Value.absent() : Value(carb),
      fat: fat == null && nullToAbsent ? const Value.absent() : Value(fat),
      image: image == null && nullToAbsent
          ? const Value.absent()
          : Value(image),
      prepTime: prepTime == null && nullToAbsent
          ? const Value.absent()
          : Value(prepTime),
      ingredientsJson: ingredientsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(ingredientsJson),
      instructions: instructions == null && nullToAbsent
          ? const Value.absent()
          : Value(instructions),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedMeal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedMeal(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      name: serializer.fromJson<String?>(json['name']),
      mealType: serializer.fromJson<String?>(json['mealType']),
      calorie: serializer.fromJson<double?>(json['calorie']),
      protein: serializer.fromJson<double?>(json['protein']),
      carb: serializer.fromJson<double?>(json['carb']),
      fat: serializer.fromJson<double?>(json['fat']),
      image: serializer.fromJson<String?>(json['image']),
      prepTime: serializer.fromJson<String?>(json['prepTime']),
      ingredientsJson: serializer.fromJson<String?>(json['ingredientsJson']),
      instructions: serializer.fromJson<String?>(json['instructions']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'name': serializer.toJson<String?>(name),
      'mealType': serializer.toJson<String?>(mealType),
      'calorie': serializer.toJson<double?>(calorie),
      'protein': serializer.toJson<double?>(protein),
      'carb': serializer.toJson<double?>(carb),
      'fat': serializer.toJson<double?>(fat),
      'image': serializer.toJson<String?>(image),
      'prepTime': serializer.toJson<String?>(prepTime),
      'ingredientsJson': serializer.toJson<String?>(ingredientsJson),
      'instructions': serializer.toJson<String?>(instructions),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedMeal copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    Value<String?> name = const Value.absent(),
    Value<String?> mealType = const Value.absent(),
    Value<double?> calorie = const Value.absent(),
    Value<double?> protein = const Value.absent(),
    Value<double?> carb = const Value.absent(),
    Value<double?> fat = const Value.absent(),
    Value<String?> image = const Value.absent(),
    Value<String?> prepTime = const Value.absent(),
    Value<String?> ingredientsJson = const Value.absent(),
    Value<String?> instructions = const Value.absent(),
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
    DateTime? cachedAt,
  }) => CachedMeal(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    name: name.present ? name.value : this.name,
    mealType: mealType.present ? mealType.value : this.mealType,
    calorie: calorie.present ? calorie.value : this.calorie,
    protein: protein.present ? protein.value : this.protein,
    carb: carb.present ? carb.value : this.carb,
    fat: fat.present ? fat.value : this.fat,
    image: image.present ? image.value : this.image,
    prepTime: prepTime.present ? prepTime.value : this.prepTime,
    ingredientsJson: ingredientsJson.present
        ? ingredientsJson.value
        : this.ingredientsJson,
    instructions: instructions.present ? instructions.value : this.instructions,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedMeal copyWithCompanion(CachedMealsCompanion data) {
    return CachedMeal(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      mealType: data.mealType.present ? data.mealType.value : this.mealType,
      calorie: data.calorie.present ? data.calorie.value : this.calorie,
      protein: data.protein.present ? data.protein.value : this.protein,
      carb: data.carb.present ? data.carb.value : this.carb,
      fat: data.fat.present ? data.fat.value : this.fat,
      image: data.image.present ? data.image.value : this.image,
      prepTime: data.prepTime.present ? data.prepTime.value : this.prepTime,
      ingredientsJson: data.ingredientsJson.present
          ? data.ingredientsJson.value
          : this.ingredientsJson,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedMeal(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('mealType: $mealType, ')
          ..write('calorie: $calorie, ')
          ..write('protein: $protein, ')
          ..write('carb: $carb, ')
          ..write('fat: $fat, ')
          ..write('image: $image, ')
          ..write('prepTime: $prepTime, ')
          ..write('ingredientsJson: $ingredientsJson, ')
          ..write('instructions: $instructions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    name,
    mealType,
    calorie,
    protein,
    carb,
    fat,
    image,
    prepTime,
    ingredientsJson,
    instructions,
    createdAt,
    updatedAt,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedMeal &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.mealType == this.mealType &&
          other.calorie == this.calorie &&
          other.protein == this.protein &&
          other.carb == this.carb &&
          other.fat == this.fat &&
          other.image == this.image &&
          other.prepTime == this.prepTime &&
          other.ingredientsJson == this.ingredientsJson &&
          other.instructions == this.instructions &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.cachedAt == this.cachedAt);
}

class CachedMealsCompanion extends UpdateCompanion<CachedMeal> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<String?> name;
  final Value<String?> mealType;
  final Value<double?> calorie;
  final Value<double?> protein;
  final Value<double?> carb;
  final Value<double?> fat;
  final Value<String?> image;
  final Value<String?> prepTime;
  final Value<String?> ingredientsJson;
  final Value<String?> instructions;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedMealsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.mealType = const Value.absent(),
    this.calorie = const Value.absent(),
    this.protein = const Value.absent(),
    this.carb = const Value.absent(),
    this.fat = const Value.absent(),
    this.image = const Value.absent(),
    this.prepTime = const Value.absent(),
    this.ingredientsJson = const Value.absent(),
    this.instructions = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedMealsCompanion.insert({
    required String id,
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.mealType = const Value.absent(),
    this.calorie = const Value.absent(),
    this.protein = const Value.absent(),
    this.carb = const Value.absent(),
    this.fat = const Value.absent(),
    this.image = const Value.absent(),
    this.prepTime = const Value.absent(),
    this.ingredientsJson = const Value.absent(),
    this.instructions = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<CachedMeal> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? name,
    Expression<String>? mealType,
    Expression<double>? calorie,
    Expression<double>? protein,
    Expression<double>? carb,
    Expression<double>? fat,
    Expression<String>? image,
    Expression<String>? prepTime,
    Expression<String>? ingredientsJson,
    Expression<String>? instructions,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (mealType != null) 'meal_type': mealType,
      if (calorie != null) 'calorie': calorie,
      if (protein != null) 'protein': protein,
      if (carb != null) 'carb': carb,
      if (fat != null) 'fat': fat,
      if (image != null) 'image': image,
      if (prepTime != null) 'prep_time': prepTime,
      if (ingredientsJson != null) 'ingredients_json': ingredientsJson,
      if (instructions != null) 'instructions': instructions,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedMealsCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<String?>? name,
    Value<String?>? mealType,
    Value<double?>? calorie,
    Value<double?>? protein,
    Value<double?>? carb,
    Value<double?>? fat,
    Value<String?>? image,
    Value<String?>? prepTime,
    Value<String?>? ingredientsJson,
    Value<String?>? instructions,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return CachedMealsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      mealType: mealType ?? this.mealType,
      calorie: calorie ?? this.calorie,
      protein: protein ?? this.protein,
      carb: carb ?? this.carb,
      fat: fat ?? this.fat,
      image: image ?? this.image,
      prepTime: prepTime ?? this.prepTime,
      ingredientsJson: ingredientsJson ?? this.ingredientsJson,
      instructions: instructions ?? this.instructions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (mealType.present) {
      map['meal_type'] = Variable<String>(mealType.value);
    }
    if (calorie.present) {
      map['calorie'] = Variable<double>(calorie.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (carb.present) {
      map['carb'] = Variable<double>(carb.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (prepTime.present) {
      map['prep_time'] = Variable<String>(prepTime.value);
    }
    if (ingredientsJson.present) {
      map['ingredients_json'] = Variable<String>(ingredientsJson.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedMealsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('mealType: $mealType, ')
          ..write('calorie: $calorie, ')
          ..write('protein: $protein, ')
          ..write('carb: $carb, ')
          ..write('fat: $fat, ')
          ..write('image: $image, ')
          ..write('prepTime: $prepTime, ')
          ..write('ingredientsJson: $ingredientsJson, ')
          ..write('instructions: $instructions, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedProgressTable extends CachedProgress
    with TableInfo<$CachedProgressTable, CachedProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _percentageMeta = const VerificationMeta(
    'percentage',
  );
  @override
  late final GeneratedColumn<int> percentage = GeneratedColumn<int>(
    'percentage',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    type,
    weight,
    percentage,
    imageUrl,
    recordedAt,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedProgressData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('percentage')) {
      context.handle(
        _percentageMeta,
        percentage.isAcceptableOrUnknown(data['percentage']!, _percentageMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedProgressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedProgressData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      percentage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}percentage'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      ),
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedProgressTable createAlias(String alias) {
    return $CachedProgressTable(attachedDatabase, alias);
  }
}

class CachedProgressData extends DataClass
    implements Insertable<CachedProgressData> {
  final String id;
  final String? userId;
  final String type;
  final double? weight;
  final int? percentage;
  final String? imageUrl;
  final DateTime? recordedAt;
  final DateTime cachedAt;
  const CachedProgressData({
    required this.id,
    this.userId,
    required this.type,
    this.weight,
    this.percentage,
    this.imageUrl,
    this.recordedAt,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || percentage != null) {
      map['percentage'] = Variable<int>(percentage);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || recordedAt != null) {
      map['recorded_at'] = Variable<DateTime>(recordedAt);
    }
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedProgressCompanion toCompanion(bool nullToAbsent) {
    return CachedProgressCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      type: Value(type),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      percentage: percentage == null && nullToAbsent
          ? const Value.absent()
          : Value(percentage),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      recordedAt: recordedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(recordedAt),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedProgressData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedProgressData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      type: serializer.fromJson<String>(json['type']),
      weight: serializer.fromJson<double?>(json['weight']),
      percentage: serializer.fromJson<int?>(json['percentage']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      recordedAt: serializer.fromJson<DateTime?>(json['recordedAt']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'type': serializer.toJson<String>(type),
      'weight': serializer.toJson<double?>(weight),
      'percentage': serializer.toJson<int?>(percentage),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'recordedAt': serializer.toJson<DateTime?>(recordedAt),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedProgressData copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    String? type,
    Value<double?> weight = const Value.absent(),
    Value<int?> percentage = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    Value<DateTime?> recordedAt = const Value.absent(),
    DateTime? cachedAt,
  }) => CachedProgressData(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    type: type ?? this.type,
    weight: weight.present ? weight.value : this.weight,
    percentage: percentage.present ? percentage.value : this.percentage,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    recordedAt: recordedAt.present ? recordedAt.value : this.recordedAt,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedProgressData copyWithCompanion(CachedProgressCompanion data) {
    return CachedProgressData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      type: data.type.present ? data.type.value : this.type,
      weight: data.weight.present ? data.weight.value : this.weight,
      percentage: data.percentage.present
          ? data.percentage.value
          : this.percentage,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedProgressData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('weight: $weight, ')
          ..write('percentage: $percentage, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    type,
    weight,
    percentage,
    imageUrl,
    recordedAt,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedProgressData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.type == this.type &&
          other.weight == this.weight &&
          other.percentage == this.percentage &&
          other.imageUrl == this.imageUrl &&
          other.recordedAt == this.recordedAt &&
          other.cachedAt == this.cachedAt);
}

class CachedProgressCompanion extends UpdateCompanion<CachedProgressData> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<String> type;
  final Value<double?> weight;
  final Value<int?> percentage;
  final Value<String?> imageUrl;
  final Value<DateTime?> recordedAt;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedProgressCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.type = const Value.absent(),
    this.weight = const Value.absent(),
    this.percentage = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedProgressCompanion.insert({
    required String id,
    this.userId = const Value.absent(),
    required String type,
    this.weight = const Value.absent(),
    this.percentage = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type);
  static Insertable<CachedProgressData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? type,
    Expression<double>? weight,
    Expression<int>? percentage,
    Expression<String>? imageUrl,
    Expression<DateTime>? recordedAt,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type,
      if (weight != null) 'weight': weight,
      if (percentage != null) 'percentage': percentage,
      if (imageUrl != null) 'image_url': imageUrl,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedProgressCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<String>? type,
    Value<double?>? weight,
    Value<int?>? percentage,
    Value<String?>? imageUrl,
    Value<DateTime?>? recordedAt,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return CachedProgressCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      weight: weight ?? this.weight,
      percentage: percentage ?? this.percentage,
      imageUrl: imageUrl ?? this.imageUrl,
      recordedAt: recordedAt ?? this.recordedAt,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (percentage.present) {
      map['percentage'] = Variable<int>(percentage.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedProgressCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('weight: $weight, ')
          ..write('percentage: $percentage, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedFriendsTable extends CachedFriends
    with TableInfo<$CachedFriendsTable, CachedFriend> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedFriendsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mainGoalMeta = const VerificationMeta(
    'mainGoal',
  );
  @override
  late final GeneratedColumn<String> mainGoal = GeneratedColumn<String>(
    'main_goal',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _percentageMeta = const VerificationMeta(
    'percentage',
  );
  @override
  late final GeneratedColumn<int> percentage = GeneratedColumn<int>(
    'percentage',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isFriendMeta = const VerificationMeta(
    'isFriend',
  );
  @override
  late final GeneratedColumn<bool> isFriend = GeneratedColumn<bool>(
    'is_friend',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_friend" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isPendingRequestMeta = const VerificationMeta(
    'isPendingRequest',
  );
  @override
  late final GeneratedColumn<bool> isPendingRequest = GeneratedColumn<bool>(
    'is_pending_request',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pending_request" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    name,
    mainGoal,
    image,
    percentage,
    isFriend,
    isPendingRequest,
    createdAt,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_friends';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedFriend> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('main_goal')) {
      context.handle(
        _mainGoalMeta,
        mainGoal.isAcceptableOrUnknown(data['main_goal']!, _mainGoalMeta),
      );
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    }
    if (data.containsKey('percentage')) {
      context.handle(
        _percentageMeta,
        percentage.isAcceptableOrUnknown(data['percentage']!, _percentageMeta),
      );
    }
    if (data.containsKey('is_friend')) {
      context.handle(
        _isFriendMeta,
        isFriend.isAcceptableOrUnknown(data['is_friend']!, _isFriendMeta),
      );
    }
    if (data.containsKey('is_pending_request')) {
      context.handle(
        _isPendingRequestMeta,
        isPendingRequest.isAcceptableOrUnknown(
          data['is_pending_request']!,
          _isPendingRequestMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedFriend map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedFriend(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      mainGoal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}main_goal'],
      ),
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      ),
      percentage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}percentage'],
      ),
      isFriend: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_friend'],
      )!,
      isPendingRequest: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pending_request'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedFriendsTable createAlias(String alias) {
    return $CachedFriendsTable(attachedDatabase, alias);
  }
}

class CachedFriend extends DataClass implements Insertable<CachedFriend> {
  final String id;
  final String? userId;
  final String? name;
  final String? mainGoal;
  final String? image;
  final int? percentage;
  final bool isFriend;
  final bool isPendingRequest;
  final DateTime? createdAt;
  final DateTime cachedAt;
  const CachedFriend({
    required this.id,
    this.userId,
    this.name,
    this.mainGoal,
    this.image,
    this.percentage,
    required this.isFriend,
    required this.isPendingRequest,
    this.createdAt,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || mainGoal != null) {
      map['main_goal'] = Variable<String>(mainGoal);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || percentage != null) {
      map['percentage'] = Variable<int>(percentage);
    }
    map['is_friend'] = Variable<bool>(isFriend);
    map['is_pending_request'] = Variable<bool>(isPendingRequest);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedFriendsCompanion toCompanion(bool nullToAbsent) {
    return CachedFriendsCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      mainGoal: mainGoal == null && nullToAbsent
          ? const Value.absent()
          : Value(mainGoal),
      image: image == null && nullToAbsent
          ? const Value.absent()
          : Value(image),
      percentage: percentage == null && nullToAbsent
          ? const Value.absent()
          : Value(percentage),
      isFriend: Value(isFriend),
      isPendingRequest: Value(isPendingRequest),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedFriend.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedFriend(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String?>(json['userId']),
      name: serializer.fromJson<String?>(json['name']),
      mainGoal: serializer.fromJson<String?>(json['mainGoal']),
      image: serializer.fromJson<String?>(json['image']),
      percentage: serializer.fromJson<int?>(json['percentage']),
      isFriend: serializer.fromJson<bool>(json['isFriend']),
      isPendingRequest: serializer.fromJson<bool>(json['isPendingRequest']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String?>(userId),
      'name': serializer.toJson<String?>(name),
      'mainGoal': serializer.toJson<String?>(mainGoal),
      'image': serializer.toJson<String?>(image),
      'percentage': serializer.toJson<int?>(percentage),
      'isFriend': serializer.toJson<bool>(isFriend),
      'isPendingRequest': serializer.toJson<bool>(isPendingRequest),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedFriend copyWith({
    String? id,
    Value<String?> userId = const Value.absent(),
    Value<String?> name = const Value.absent(),
    Value<String?> mainGoal = const Value.absent(),
    Value<String?> image = const Value.absent(),
    Value<int?> percentage = const Value.absent(),
    bool? isFriend,
    bool? isPendingRequest,
    Value<DateTime?> createdAt = const Value.absent(),
    DateTime? cachedAt,
  }) => CachedFriend(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    name: name.present ? name.value : this.name,
    mainGoal: mainGoal.present ? mainGoal.value : this.mainGoal,
    image: image.present ? image.value : this.image,
    percentage: percentage.present ? percentage.value : this.percentage,
    isFriend: isFriend ?? this.isFriend,
    isPendingRequest: isPendingRequest ?? this.isPendingRequest,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedFriend copyWithCompanion(CachedFriendsCompanion data) {
    return CachedFriend(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      mainGoal: data.mainGoal.present ? data.mainGoal.value : this.mainGoal,
      image: data.image.present ? data.image.value : this.image,
      percentage: data.percentage.present
          ? data.percentage.value
          : this.percentage,
      isFriend: data.isFriend.present ? data.isFriend.value : this.isFriend,
      isPendingRequest: data.isPendingRequest.present
          ? data.isPendingRequest.value
          : this.isPendingRequest,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedFriend(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('mainGoal: $mainGoal, ')
          ..write('image: $image, ')
          ..write('percentage: $percentage, ')
          ..write('isFriend: $isFriend, ')
          ..write('isPendingRequest: $isPendingRequest, ')
          ..write('createdAt: $createdAt, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    name,
    mainGoal,
    image,
    percentage,
    isFriend,
    isPendingRequest,
    createdAt,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedFriend &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.mainGoal == this.mainGoal &&
          other.image == this.image &&
          other.percentage == this.percentage &&
          other.isFriend == this.isFriend &&
          other.isPendingRequest == this.isPendingRequest &&
          other.createdAt == this.createdAt &&
          other.cachedAt == this.cachedAt);
}

class CachedFriendsCompanion extends UpdateCompanion<CachedFriend> {
  final Value<String> id;
  final Value<String?> userId;
  final Value<String?> name;
  final Value<String?> mainGoal;
  final Value<String?> image;
  final Value<int?> percentage;
  final Value<bool> isFriend;
  final Value<bool> isPendingRequest;
  final Value<DateTime?> createdAt;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedFriendsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.mainGoal = const Value.absent(),
    this.image = const Value.absent(),
    this.percentage = const Value.absent(),
    this.isFriend = const Value.absent(),
    this.isPendingRequest = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedFriendsCompanion.insert({
    required String id,
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.mainGoal = const Value.absent(),
    this.image = const Value.absent(),
    this.percentage = const Value.absent(),
    this.isFriend = const Value.absent(),
    this.isPendingRequest = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<CachedFriend> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? name,
    Expression<String>? mainGoal,
    Expression<String>? image,
    Expression<int>? percentage,
    Expression<bool>? isFriend,
    Expression<bool>? isPendingRequest,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (mainGoal != null) 'main_goal': mainGoal,
      if (image != null) 'image': image,
      if (percentage != null) 'percentage': percentage,
      if (isFriend != null) 'is_friend': isFriend,
      if (isPendingRequest != null) 'is_pending_request': isPendingRequest,
      if (createdAt != null) 'created_at': createdAt,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedFriendsCompanion copyWith({
    Value<String>? id,
    Value<String?>? userId,
    Value<String?>? name,
    Value<String?>? mainGoal,
    Value<String?>? image,
    Value<int?>? percentage,
    Value<bool>? isFriend,
    Value<bool>? isPendingRequest,
    Value<DateTime?>? createdAt,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return CachedFriendsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      mainGoal: mainGoal ?? this.mainGoal,
      image: image ?? this.image,
      percentage: percentage ?? this.percentage,
      isFriend: isFriend ?? this.isFriend,
      isPendingRequest: isPendingRequest ?? this.isPendingRequest,
      createdAt: createdAt ?? this.createdAt,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (mainGoal.present) {
      map['main_goal'] = Variable<String>(mainGoal.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (percentage.present) {
      map['percentage'] = Variable<int>(percentage.value);
    }
    if (isFriend.present) {
      map['is_friend'] = Variable<bool>(isFriend.value);
    }
    if (isPendingRequest.present) {
      map['is_pending_request'] = Variable<bool>(isPendingRequest.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedFriendsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('mainGoal: $mainGoal, ')
          ..write('image: $image, ')
          ..write('percentage: $percentage, ')
          ..write('isFriend: $isFriend, ')
          ..write('isPendingRequest: $isPendingRequest, ')
          ..write('createdAt: $createdAt, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PendingActionsTable extends PendingActions
    with TableInfo<$PendingActionsTable, PendingAction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingActionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endpointMeta = const VerificationMeta(
    'endpoint',
  );
  @override
  late final GeneratedColumn<String> endpoint = GeneratedColumn<String>(
    'endpoint',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    false,
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
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _queryParametersMeta = const VerificationMeta(
    'queryParameters',
  );
  @override
  late final GeneratedColumn<String> queryParameters = GeneratedColumn<String>(
    'query_parameters',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    endpoint,
    method,
    type,
    data,
    queryParameters,
    retryCount,
    createdAt,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_actions';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingAction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('endpoint')) {
      context.handle(
        _endpointMeta,
        endpoint.isAcceptableOrUnknown(data['endpoint']!, _endpointMeta),
      );
    } else if (isInserting) {
      context.missing(_endpointMeta);
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    } else if (isInserting) {
      context.missing(_methodMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    }
    if (data.containsKey('query_parameters')) {
      context.handle(
        _queryParametersMeta,
        queryParameters.isAcceptableOrUnknown(
          data['query_parameters']!,
          _queryParametersMeta,
        ),
      );
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingAction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingAction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      endpoint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}endpoint'],
      )!,
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      ),
      queryParameters: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}query_parameters'],
      ),
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $PendingActionsTable createAlias(String alias) {
    return $PendingActionsTable(attachedDatabase, alias);
  }
}

class PendingAction extends DataClass implements Insertable<PendingAction> {
  final String id;
  final String endpoint;
  final String method;
  final String type;
  final String? data;
  final String? queryParameters;
  final int retryCount;
  final DateTime createdAt;
  final String status;
  const PendingAction({
    required this.id,
    required this.endpoint,
    required this.method,
    required this.type,
    this.data,
    this.queryParameters,
    required this.retryCount,
    required this.createdAt,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['endpoint'] = Variable<String>(endpoint);
    map['method'] = Variable<String>(method);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || data != null) {
      map['data'] = Variable<String>(data);
    }
    if (!nullToAbsent || queryParameters != null) {
      map['query_parameters'] = Variable<String>(queryParameters);
    }
    map['retry_count'] = Variable<int>(retryCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['status'] = Variable<String>(status);
    return map;
  }

  PendingActionsCompanion toCompanion(bool nullToAbsent) {
    return PendingActionsCompanion(
      id: Value(id),
      endpoint: Value(endpoint),
      method: Value(method),
      type: Value(type),
      data: data == null && nullToAbsent ? const Value.absent() : Value(data),
      queryParameters: queryParameters == null && nullToAbsent
          ? const Value.absent()
          : Value(queryParameters),
      retryCount: Value(retryCount),
      createdAt: Value(createdAt),
      status: Value(status),
    );
  }

  factory PendingAction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingAction(
      id: serializer.fromJson<String>(json['id']),
      endpoint: serializer.fromJson<String>(json['endpoint']),
      method: serializer.fromJson<String>(json['method']),
      type: serializer.fromJson<String>(json['type']),
      data: serializer.fromJson<String?>(json['data']),
      queryParameters: serializer.fromJson<String?>(json['queryParameters']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'endpoint': serializer.toJson<String>(endpoint),
      'method': serializer.toJson<String>(method),
      'type': serializer.toJson<String>(type),
      'data': serializer.toJson<String?>(data),
      'queryParameters': serializer.toJson<String?>(queryParameters),
      'retryCount': serializer.toJson<int>(retryCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'status': serializer.toJson<String>(status),
    };
  }

  PendingAction copyWith({
    String? id,
    String? endpoint,
    String? method,
    String? type,
    Value<String?> data = const Value.absent(),
    Value<String?> queryParameters = const Value.absent(),
    int? retryCount,
    DateTime? createdAt,
    String? status,
  }) => PendingAction(
    id: id ?? this.id,
    endpoint: endpoint ?? this.endpoint,
    method: method ?? this.method,
    type: type ?? this.type,
    data: data.present ? data.value : this.data,
    queryParameters: queryParameters.present
        ? queryParameters.value
        : this.queryParameters,
    retryCount: retryCount ?? this.retryCount,
    createdAt: createdAt ?? this.createdAt,
    status: status ?? this.status,
  );
  PendingAction copyWithCompanion(PendingActionsCompanion data) {
    return PendingAction(
      id: data.id.present ? data.id.value : this.id,
      endpoint: data.endpoint.present ? data.endpoint.value : this.endpoint,
      method: data.method.present ? data.method.value : this.method,
      type: data.type.present ? data.type.value : this.type,
      data: data.data.present ? data.data.value : this.data,
      queryParameters: data.queryParameters.present
          ? data.queryParameters.value
          : this.queryParameters,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingAction(')
          ..write('id: $id, ')
          ..write('endpoint: $endpoint, ')
          ..write('method: $method, ')
          ..write('type: $type, ')
          ..write('data: $data, ')
          ..write('queryParameters: $queryParameters, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    endpoint,
    method,
    type,
    data,
    queryParameters,
    retryCount,
    createdAt,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingAction &&
          other.id == this.id &&
          other.endpoint == this.endpoint &&
          other.method == this.method &&
          other.type == this.type &&
          other.data == this.data &&
          other.queryParameters == this.queryParameters &&
          other.retryCount == this.retryCount &&
          other.createdAt == this.createdAt &&
          other.status == this.status);
}

class PendingActionsCompanion extends UpdateCompanion<PendingAction> {
  final Value<String> id;
  final Value<String> endpoint;
  final Value<String> method;
  final Value<String> type;
  final Value<String?> data;
  final Value<String?> queryParameters;
  final Value<int> retryCount;
  final Value<DateTime> createdAt;
  final Value<String> status;
  final Value<int> rowid;
  const PendingActionsCompanion({
    this.id = const Value.absent(),
    this.endpoint = const Value.absent(),
    this.method = const Value.absent(),
    this.type = const Value.absent(),
    this.data = const Value.absent(),
    this.queryParameters = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PendingActionsCompanion.insert({
    required String id,
    required String endpoint,
    required String method,
    required String type,
    this.data = const Value.absent(),
    this.queryParameters = const Value.absent(),
    this.retryCount = const Value.absent(),
    required DateTime createdAt,
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       endpoint = Value(endpoint),
       method = Value(method),
       type = Value(type),
       createdAt = Value(createdAt);
  static Insertable<PendingAction> custom({
    Expression<String>? id,
    Expression<String>? endpoint,
    Expression<String>? method,
    Expression<String>? type,
    Expression<String>? data,
    Expression<String>? queryParameters,
    Expression<int>? retryCount,
    Expression<DateTime>? createdAt,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (endpoint != null) 'endpoint': endpoint,
      if (method != null) 'method': method,
      if (type != null) 'type': type,
      if (data != null) 'data': data,
      if (queryParameters != null) 'query_parameters': queryParameters,
      if (retryCount != null) 'retry_count': retryCount,
      if (createdAt != null) 'created_at': createdAt,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PendingActionsCompanion copyWith({
    Value<String>? id,
    Value<String>? endpoint,
    Value<String>? method,
    Value<String>? type,
    Value<String?>? data,
    Value<String?>? queryParameters,
    Value<int>? retryCount,
    Value<DateTime>? createdAt,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return PendingActionsCompanion(
      id: id ?? this.id,
      endpoint: endpoint ?? this.endpoint,
      method: method ?? this.method,
      type: type ?? this.type,
      data: data ?? this.data,
      queryParameters: queryParameters ?? this.queryParameters,
      retryCount: retryCount ?? this.retryCount,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (endpoint.present) {
      map['endpoint'] = Variable<String>(endpoint.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (queryParameters.present) {
      map['query_parameters'] = Variable<String>(queryParameters.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingActionsCompanion(')
          ..write('id: $id, ')
          ..write('endpoint: $endpoint, ')
          ..write('method: $method, ')
          ..write('type: $type, ')
          ..write('data: $data, ')
          ..write('queryParameters: $queryParameters, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CachedUsersTable cachedUsers = $CachedUsersTable(this);
  late final $CachedMealsTable cachedMeals = $CachedMealsTable(this);
  late final $CachedProgressTable cachedProgress = $CachedProgressTable(this);
  late final $CachedFriendsTable cachedFriends = $CachedFriendsTable(this);
  late final $PendingActionsTable pendingActions = $PendingActionsTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final MealDao mealDao = MealDao(this as AppDatabase);
  late final ProgressDao progressDao = ProgressDao(this as AppDatabase);
  late final FriendDao friendDao = FriendDao(this as AppDatabase);
  late final PendingActionDao pendingActionDao = PendingActionDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cachedUsers,
    cachedMeals,
    cachedProgress,
    cachedFriends,
    pendingActions,
  ];
}

typedef $$CachedUsersTableCreateCompanionBuilder =
    CachedUsersCompanion Function({
      required String id,
      Value<String?> name,
      Value<String?> firstName,
      Value<String?> lastName,
      Value<String?> email,
      Value<String?> gender,
      Value<int?> age,
      Value<double?> height,
      Value<String?> activityLevel,
      Value<String?> foodVibe,
      Value<String?> mainGoal,
      Value<String?> result,
      Value<String?> training,
      Value<String?> image,
      Value<String?> profileImage,
      Value<double?> weight,
      Value<double?> calorie,
      Value<String?> subscriptionPlan,
      Value<bool> isTwoFactor,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });
typedef $$CachedUsersTableUpdateCompanionBuilder =
    CachedUsersCompanion Function({
      Value<String> id,
      Value<String?> name,
      Value<String?> firstName,
      Value<String?> lastName,
      Value<String?> email,
      Value<String?> gender,
      Value<int?> age,
      Value<double?> height,
      Value<String?> activityLevel,
      Value<String?> foodVibe,
      Value<String?> mainGoal,
      Value<String?> result,
      Value<String?> training,
      Value<String?> image,
      Value<String?> profileImage,
      Value<double?> weight,
      Value<double?> calorie,
      Value<String?> subscriptionPlan,
      Value<bool> isTwoFactor,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$CachedUsersTableFilterComposer
    extends Composer<_$AppDatabase, $CachedUsersTable> {
  $$CachedUsersTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityLevel => $composableBuilder(
    column: $table.activityLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get foodVibe => $composableBuilder(
    column: $table.foodVibe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mainGoal => $composableBuilder(
    column: $table.mainGoal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get training => $composableBuilder(
    column: $table.training,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profileImage => $composableBuilder(
    column: $table.profileImage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get calorie => $composableBuilder(
    column: $table.calorie,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subscriptionPlan => $composableBuilder(
    column: $table.subscriptionPlan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isTwoFactor => $composableBuilder(
    column: $table.isTwoFactor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedUsersTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedUsersTable> {
  $$CachedUsersTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityLevel => $composableBuilder(
    column: $table.activityLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get foodVibe => $composableBuilder(
    column: $table.foodVibe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mainGoal => $composableBuilder(
    column: $table.mainGoal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get training => $composableBuilder(
    column: $table.training,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profileImage => $composableBuilder(
    column: $table.profileImage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get calorie => $composableBuilder(
    column: $table.calorie,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subscriptionPlan => $composableBuilder(
    column: $table.subscriptionPlan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isTwoFactor => $composableBuilder(
    column: $table.isTwoFactor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedUsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedUsersTable> {
  $$CachedUsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<String> get activityLevel => $composableBuilder(
    column: $table.activityLevel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get foodVibe =>
      $composableBuilder(column: $table.foodVibe, builder: (column) => column);

  GeneratedColumn<String> get mainGoal =>
      $composableBuilder(column: $table.mainGoal, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<String> get training =>
      $composableBuilder(column: $table.training, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get profileImage => $composableBuilder(
    column: $table.profileImage,
    builder: (column) => column,
  );

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<double> get calorie =>
      $composableBuilder(column: $table.calorie, builder: (column) => column);

  GeneratedColumn<String> get subscriptionPlan => $composableBuilder(
    column: $table.subscriptionPlan,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isTwoFactor => $composableBuilder(
    column: $table.isTwoFactor,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedUsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedUsersTable,
          CachedUser,
          $$CachedUsersTableFilterComposer,
          $$CachedUsersTableOrderingComposer,
          $$CachedUsersTableAnnotationComposer,
          $$CachedUsersTableCreateCompanionBuilder,
          $$CachedUsersTableUpdateCompanionBuilder,
          (
            CachedUser,
            BaseReferences<_$AppDatabase, $CachedUsersTable, CachedUser>,
          ),
          CachedUser,
          PrefetchHooks Function()
        > {
  $$CachedUsersTableTableManager(_$AppDatabase db, $CachedUsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedUsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedUsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedUsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<int?> age = const Value.absent(),
                Value<double?> height = const Value.absent(),
                Value<String?> activityLevel = const Value.absent(),
                Value<String?> foodVibe = const Value.absent(),
                Value<String?> mainGoal = const Value.absent(),
                Value<String?> result = const Value.absent(),
                Value<String?> training = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String?> profileImage = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<double?> calorie = const Value.absent(),
                Value<String?> subscriptionPlan = const Value.absent(),
                Value<bool> isTwoFactor = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedUsersCompanion(
                id: id,
                name: name,
                firstName: firstName,
                lastName: lastName,
                email: email,
                gender: gender,
                age: age,
                height: height,
                activityLevel: activityLevel,
                foodVibe: foodVibe,
                mainGoal: mainGoal,
                result: result,
                training: training,
                image: image,
                profileImage: profileImage,
                weight: weight,
                calorie: calorie,
                subscriptionPlan: subscriptionPlan,
                isTwoFactor: isTwoFactor,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> name = const Value.absent(),
                Value<String?> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<int?> age = const Value.absent(),
                Value<double?> height = const Value.absent(),
                Value<String?> activityLevel = const Value.absent(),
                Value<String?> foodVibe = const Value.absent(),
                Value<String?> mainGoal = const Value.absent(),
                Value<String?> result = const Value.absent(),
                Value<String?> training = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String?> profileImage = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<double?> calorie = const Value.absent(),
                Value<String?> subscriptionPlan = const Value.absent(),
                Value<bool> isTwoFactor = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedUsersCompanion.insert(
                id: id,
                name: name,
                firstName: firstName,
                lastName: lastName,
                email: email,
                gender: gender,
                age: age,
                height: height,
                activityLevel: activityLevel,
                foodVibe: foodVibe,
                mainGoal: mainGoal,
                result: result,
                training: training,
                image: image,
                profileImage: profileImage,
                weight: weight,
                calorie: calorie,
                subscriptionPlan: subscriptionPlan,
                isTwoFactor: isTwoFactor,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedUsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedUsersTable,
      CachedUser,
      $$CachedUsersTableFilterComposer,
      $$CachedUsersTableOrderingComposer,
      $$CachedUsersTableAnnotationComposer,
      $$CachedUsersTableCreateCompanionBuilder,
      $$CachedUsersTableUpdateCompanionBuilder,
      (
        CachedUser,
        BaseReferences<_$AppDatabase, $CachedUsersTable, CachedUser>,
      ),
      CachedUser,
      PrefetchHooks Function()
    >;
typedef $$CachedMealsTableCreateCompanionBuilder =
    CachedMealsCompanion Function({
      required String id,
      Value<String?> userId,
      Value<String?> name,
      Value<String?> mealType,
      Value<double?> calorie,
      Value<double?> protein,
      Value<double?> carb,
      Value<double?> fat,
      Value<String?> image,
      Value<String?> prepTime,
      Value<String?> ingredientsJson,
      Value<String?> instructions,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });
typedef $$CachedMealsTableUpdateCompanionBuilder =
    CachedMealsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<String?> name,
      Value<String?> mealType,
      Value<double?> calorie,
      Value<double?> protein,
      Value<double?> carb,
      Value<double?> fat,
      Value<String?> image,
      Value<String?> prepTime,
      Value<String?> ingredientsJson,
      Value<String?> instructions,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$CachedMealsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedMealsTable> {
  $$CachedMealsTableFilterComposer({
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

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mealType => $composableBuilder(
    column: $table.mealType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get calorie => $composableBuilder(
    column: $table.calorie,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carb => $composableBuilder(
    column: $table.carb,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prepTime => $composableBuilder(
    column: $table.prepTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ingredientsJson => $composableBuilder(
    column: $table.ingredientsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedMealsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedMealsTable> {
  $$CachedMealsTableOrderingComposer({
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

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mealType => $composableBuilder(
    column: $table.mealType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get calorie => $composableBuilder(
    column: $table.calorie,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carb => $composableBuilder(
    column: $table.carb,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prepTime => $composableBuilder(
    column: $table.prepTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredientsJson => $composableBuilder(
    column: $table.ingredientsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedMealsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedMealsTable> {
  $$CachedMealsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get mealType =>
      $composableBuilder(column: $table.mealType, builder: (column) => column);

  GeneratedColumn<double> get calorie =>
      $composableBuilder(column: $table.calorie, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get carb =>
      $composableBuilder(column: $table.carb, builder: (column) => column);

  GeneratedColumn<double> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get prepTime =>
      $composableBuilder(column: $table.prepTime, builder: (column) => column);

  GeneratedColumn<String> get ingredientsJson => $composableBuilder(
    column: $table.ingredientsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedMealsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedMealsTable,
          CachedMeal,
          $$CachedMealsTableFilterComposer,
          $$CachedMealsTableOrderingComposer,
          $$CachedMealsTableAnnotationComposer,
          $$CachedMealsTableCreateCompanionBuilder,
          $$CachedMealsTableUpdateCompanionBuilder,
          (
            CachedMeal,
            BaseReferences<_$AppDatabase, $CachedMealsTable, CachedMeal>,
          ),
          CachedMeal,
          PrefetchHooks Function()
        > {
  $$CachedMealsTableTableManager(_$AppDatabase db, $CachedMealsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedMealsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedMealsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedMealsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> mealType = const Value.absent(),
                Value<double?> calorie = const Value.absent(),
                Value<double?> protein = const Value.absent(),
                Value<double?> carb = const Value.absent(),
                Value<double?> fat = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String?> prepTime = const Value.absent(),
                Value<String?> ingredientsJson = const Value.absent(),
                Value<String?> instructions = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedMealsCompanion(
                id: id,
                userId: userId,
                name: name,
                mealType: mealType,
                calorie: calorie,
                protein: protein,
                carb: carb,
                fat: fat,
                image: image,
                prepTime: prepTime,
                ingredientsJson: ingredientsJson,
                instructions: instructions,
                createdAt: createdAt,
                updatedAt: updatedAt,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> userId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> mealType = const Value.absent(),
                Value<double?> calorie = const Value.absent(),
                Value<double?> protein = const Value.absent(),
                Value<double?> carb = const Value.absent(),
                Value<double?> fat = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String?> prepTime = const Value.absent(),
                Value<String?> ingredientsJson = const Value.absent(),
                Value<String?> instructions = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedMealsCompanion.insert(
                id: id,
                userId: userId,
                name: name,
                mealType: mealType,
                calorie: calorie,
                protein: protein,
                carb: carb,
                fat: fat,
                image: image,
                prepTime: prepTime,
                ingredientsJson: ingredientsJson,
                instructions: instructions,
                createdAt: createdAt,
                updatedAt: updatedAt,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedMealsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedMealsTable,
      CachedMeal,
      $$CachedMealsTableFilterComposer,
      $$CachedMealsTableOrderingComposer,
      $$CachedMealsTableAnnotationComposer,
      $$CachedMealsTableCreateCompanionBuilder,
      $$CachedMealsTableUpdateCompanionBuilder,
      (
        CachedMeal,
        BaseReferences<_$AppDatabase, $CachedMealsTable, CachedMeal>,
      ),
      CachedMeal,
      PrefetchHooks Function()
    >;
typedef $$CachedProgressTableCreateCompanionBuilder =
    CachedProgressCompanion Function({
      required String id,
      Value<String?> userId,
      required String type,
      Value<double?> weight,
      Value<int?> percentage,
      Value<String?> imageUrl,
      Value<DateTime?> recordedAt,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });
typedef $$CachedProgressTableUpdateCompanionBuilder =
    CachedProgressCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<String> type,
      Value<double?> weight,
      Value<int?> percentage,
      Value<String?> imageUrl,
      Value<DateTime?> recordedAt,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$CachedProgressTableFilterComposer
    extends Composer<_$AppDatabase, $CachedProgressTable> {
  $$CachedProgressTableFilterComposer({
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

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get percentage => $composableBuilder(
    column: $table.percentage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedProgressTable> {
  $$CachedProgressTableOrderingComposer({
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

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get percentage => $composableBuilder(
    column: $table.percentage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedProgressTable> {
  $$CachedProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<int> get percentage => $composableBuilder(
    column: $table.percentage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedProgressTable,
          CachedProgressData,
          $$CachedProgressTableFilterComposer,
          $$CachedProgressTableOrderingComposer,
          $$CachedProgressTableAnnotationComposer,
          $$CachedProgressTableCreateCompanionBuilder,
          $$CachedProgressTableUpdateCompanionBuilder,
          (
            CachedProgressData,
            BaseReferences<
              _$AppDatabase,
              $CachedProgressTable,
              CachedProgressData
            >,
          ),
          CachedProgressData,
          PrefetchHooks Function()
        > {
  $$CachedProgressTableTableManager(
    _$AppDatabase db,
    $CachedProgressTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<int?> percentage = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<DateTime?> recordedAt = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedProgressCompanion(
                id: id,
                userId: userId,
                type: type,
                weight: weight,
                percentage: percentage,
                imageUrl: imageUrl,
                recordedAt: recordedAt,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> userId = const Value.absent(),
                required String type,
                Value<double?> weight = const Value.absent(),
                Value<int?> percentage = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<DateTime?> recordedAt = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedProgressCompanion.insert(
                id: id,
                userId: userId,
                type: type,
                weight: weight,
                percentage: percentage,
                imageUrl: imageUrl,
                recordedAt: recordedAt,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedProgressTable,
      CachedProgressData,
      $$CachedProgressTableFilterComposer,
      $$CachedProgressTableOrderingComposer,
      $$CachedProgressTableAnnotationComposer,
      $$CachedProgressTableCreateCompanionBuilder,
      $$CachedProgressTableUpdateCompanionBuilder,
      (
        CachedProgressData,
        BaseReferences<_$AppDatabase, $CachedProgressTable, CachedProgressData>,
      ),
      CachedProgressData,
      PrefetchHooks Function()
    >;
typedef $$CachedFriendsTableCreateCompanionBuilder =
    CachedFriendsCompanion Function({
      required String id,
      Value<String?> userId,
      Value<String?> name,
      Value<String?> mainGoal,
      Value<String?> image,
      Value<int?> percentage,
      Value<bool> isFriend,
      Value<bool> isPendingRequest,
      Value<DateTime?> createdAt,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });
typedef $$CachedFriendsTableUpdateCompanionBuilder =
    CachedFriendsCompanion Function({
      Value<String> id,
      Value<String?> userId,
      Value<String?> name,
      Value<String?> mainGoal,
      Value<String?> image,
      Value<int?> percentage,
      Value<bool> isFriend,
      Value<bool> isPendingRequest,
      Value<DateTime?> createdAt,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$CachedFriendsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedFriendsTable> {
  $$CachedFriendsTableFilterComposer({
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

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mainGoal => $composableBuilder(
    column: $table.mainGoal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get percentage => $composableBuilder(
    column: $table.percentage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFriend => $composableBuilder(
    column: $table.isFriend,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPendingRequest => $composableBuilder(
    column: $table.isPendingRequest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedFriendsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedFriendsTable> {
  $$CachedFriendsTableOrderingComposer({
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

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mainGoal => $composableBuilder(
    column: $table.mainGoal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get percentage => $composableBuilder(
    column: $table.percentage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFriend => $composableBuilder(
    column: $table.isFriend,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPendingRequest => $composableBuilder(
    column: $table.isPendingRequest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedFriendsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedFriendsTable> {
  $$CachedFriendsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get mainGoal =>
      $composableBuilder(column: $table.mainGoal, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<int> get percentage => $composableBuilder(
    column: $table.percentage,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isFriend =>
      $composableBuilder(column: $table.isFriend, builder: (column) => column);

  GeneratedColumn<bool> get isPendingRequest => $composableBuilder(
    column: $table.isPendingRequest,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedFriendsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedFriendsTable,
          CachedFriend,
          $$CachedFriendsTableFilterComposer,
          $$CachedFriendsTableOrderingComposer,
          $$CachedFriendsTableAnnotationComposer,
          $$CachedFriendsTableCreateCompanionBuilder,
          $$CachedFriendsTableUpdateCompanionBuilder,
          (
            CachedFriend,
            BaseReferences<_$AppDatabase, $CachedFriendsTable, CachedFriend>,
          ),
          CachedFriend,
          PrefetchHooks Function()
        > {
  $$CachedFriendsTableTableManager(_$AppDatabase db, $CachedFriendsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedFriendsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedFriendsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedFriendsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> mainGoal = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<int?> percentage = const Value.absent(),
                Value<bool> isFriend = const Value.absent(),
                Value<bool> isPendingRequest = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedFriendsCompanion(
                id: id,
                userId: userId,
                name: name,
                mainGoal: mainGoal,
                image: image,
                percentage: percentage,
                isFriend: isFriend,
                isPendingRequest: isPendingRequest,
                createdAt: createdAt,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> userId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> mainGoal = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<int?> percentage = const Value.absent(),
                Value<bool> isFriend = const Value.absent(),
                Value<bool> isPendingRequest = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedFriendsCompanion.insert(
                id: id,
                userId: userId,
                name: name,
                mainGoal: mainGoal,
                image: image,
                percentage: percentage,
                isFriend: isFriend,
                isPendingRequest: isPendingRequest,
                createdAt: createdAt,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedFriendsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedFriendsTable,
      CachedFriend,
      $$CachedFriendsTableFilterComposer,
      $$CachedFriendsTableOrderingComposer,
      $$CachedFriendsTableAnnotationComposer,
      $$CachedFriendsTableCreateCompanionBuilder,
      $$CachedFriendsTableUpdateCompanionBuilder,
      (
        CachedFriend,
        BaseReferences<_$AppDatabase, $CachedFriendsTable, CachedFriend>,
      ),
      CachedFriend,
      PrefetchHooks Function()
    >;
typedef $$PendingActionsTableCreateCompanionBuilder =
    PendingActionsCompanion Function({
      required String id,
      required String endpoint,
      required String method,
      required String type,
      Value<String?> data,
      Value<String?> queryParameters,
      Value<int> retryCount,
      required DateTime createdAt,
      Value<String> status,
      Value<int> rowid,
    });
typedef $$PendingActionsTableUpdateCompanionBuilder =
    PendingActionsCompanion Function({
      Value<String> id,
      Value<String> endpoint,
      Value<String> method,
      Value<String> type,
      Value<String?> data,
      Value<String?> queryParameters,
      Value<int> retryCount,
      Value<DateTime> createdAt,
      Value<String> status,
      Value<int> rowid,
    });

class $$PendingActionsTableFilterComposer
    extends Composer<_$AppDatabase, $PendingActionsTable> {
  $$PendingActionsTableFilterComposer({
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

  ColumnFilters<String> get endpoint => $composableBuilder(
    column: $table.endpoint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get queryParameters => $composableBuilder(
    column: $table.queryParameters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingActionsTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingActionsTable> {
  $$PendingActionsTableOrderingComposer({
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

  ColumnOrderings<String> get endpoint => $composableBuilder(
    column: $table.endpoint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get queryParameters => $composableBuilder(
    column: $table.queryParameters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingActionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingActionsTable> {
  $$PendingActionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get endpoint =>
      $composableBuilder(column: $table.endpoint, builder: (column) => column);

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<String> get queryParameters => $composableBuilder(
    column: $table.queryParameters,
    builder: (column) => column,
  );

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$PendingActionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PendingActionsTable,
          PendingAction,
          $$PendingActionsTableFilterComposer,
          $$PendingActionsTableOrderingComposer,
          $$PendingActionsTableAnnotationComposer,
          $$PendingActionsTableCreateCompanionBuilder,
          $$PendingActionsTableUpdateCompanionBuilder,
          (
            PendingAction,
            BaseReferences<_$AppDatabase, $PendingActionsTable, PendingAction>,
          ),
          PendingAction,
          PrefetchHooks Function()
        > {
  $$PendingActionsTableTableManager(
    _$AppDatabase db,
    $PendingActionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingActionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingActionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendingActionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> endpoint = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> data = const Value.absent(),
                Value<String?> queryParameters = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PendingActionsCompanion(
                id: id,
                endpoint: endpoint,
                method: method,
                type: type,
                data: data,
                queryParameters: queryParameters,
                retryCount: retryCount,
                createdAt: createdAt,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String endpoint,
                required String method,
                required String type,
                Value<String?> data = const Value.absent(),
                Value<String?> queryParameters = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                required DateTime createdAt,
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PendingActionsCompanion.insert(
                id: id,
                endpoint: endpoint,
                method: method,
                type: type,
                data: data,
                queryParameters: queryParameters,
                retryCount: retryCount,
                createdAt: createdAt,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingActionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PendingActionsTable,
      PendingAction,
      $$PendingActionsTableFilterComposer,
      $$PendingActionsTableOrderingComposer,
      $$PendingActionsTableAnnotationComposer,
      $$PendingActionsTableCreateCompanionBuilder,
      $$PendingActionsTableUpdateCompanionBuilder,
      (
        PendingAction,
        BaseReferences<_$AppDatabase, $PendingActionsTable, PendingAction>,
      ),
      PendingAction,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CachedUsersTableTableManager get cachedUsers =>
      $$CachedUsersTableTableManager(_db, _db.cachedUsers);
  $$CachedMealsTableTableManager get cachedMeals =>
      $$CachedMealsTableTableManager(_db, _db.cachedMeals);
  $$CachedProgressTableTableManager get cachedProgress =>
      $$CachedProgressTableTableManager(_db, _db.cachedProgress);
  $$CachedFriendsTableTableManager get cachedFriends =>
      $$CachedFriendsTableTableManager(_db, _db.cachedFriends);
  $$PendingActionsTableTableManager get pendingActions =>
      $$PendingActionsTableTableManager(_db, _db.pendingActions);
}
