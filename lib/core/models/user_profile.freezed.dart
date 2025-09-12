// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  // Step 1: Current weight
  double? get currentWeight =>
      throw _privateConstructorUsedError; // Step 2: Target weight
  double? get targetWeight =>
      throw _privateConstructorUsedError; // Step 3: Previous weight loss attempts
  bool? get hasPreviousAttempts => throw _privateConstructorUsedError;
  String? get previousAttemptsDetails =>
      throw _privateConstructorUsedError; // Step 4: Birth year
  int? get birthYear => throw _privateConstructorUsedError; // Step 5: Height
  double? get height =>
      throw _privateConstructorUsedError; // Step 6: Target areas
  List<TargetArea> get targetAreas =>
      throw _privateConstructorUsedError; // Step 7: Current body shape
  BodyShape? get currentBodyShape =>
      throw _privateConstructorUsedError; // Step 8: Target body shape
  BodyShape? get targetBodyShape =>
      throw _privateConstructorUsedError; // Step 9: Meal frequency
  MealFrequency? get mealFrequency =>
      throw _privateConstructorUsedError; // Step 10: Regular eating schedule
  bool? get hasRegularEatingSchedule =>
      throw _privateConstructorUsedError; // Step 11: Activity level
  ActivityLevel? get activityLevel =>
      throw _privateConstructorUsedError; // Step 12: Workout preferences
  List<WorkoutPreference> get workoutPreferences =>
      throw _privateConstructorUsedError; // Step 13: Workout location
  WorkoutLocation? get workoutLocation =>
      throw _privateConstructorUsedError; // Step 14: Available equipment
  List<Equipment> get availableEquipment =>
      throw _privateConstructorUsedError; // Step 15: Areas to avoid (injuries)
  List<String> get avoidAreas => throw _privateConstructorUsedError; // Metadata
  int get currentStep => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
    UserProfile value,
    $Res Function(UserProfile) then,
  ) = _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call({
    double? currentWeight,
    double? targetWeight,
    bool? hasPreviousAttempts,
    String? previousAttemptsDetails,
    int? birthYear,
    double? height,
    List<TargetArea> targetAreas,
    BodyShape? currentBodyShape,
    BodyShape? targetBodyShape,
    MealFrequency? mealFrequency,
    bool? hasRegularEatingSchedule,
    ActivityLevel? activityLevel,
    List<WorkoutPreference> workoutPreferences,
    WorkoutLocation? workoutLocation,
    List<Equipment> availableEquipment,
    List<String> avoidAreas,
    int currentStep,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentWeight = freezed,
    Object? targetWeight = freezed,
    Object? hasPreviousAttempts = freezed,
    Object? previousAttemptsDetails = freezed,
    Object? birthYear = freezed,
    Object? height = freezed,
    Object? targetAreas = null,
    Object? currentBodyShape = freezed,
    Object? targetBodyShape = freezed,
    Object? mealFrequency = freezed,
    Object? hasRegularEatingSchedule = freezed,
    Object? activityLevel = freezed,
    Object? workoutPreferences = null,
    Object? workoutLocation = freezed,
    Object? availableEquipment = null,
    Object? avoidAreas = null,
    Object? currentStep = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            currentWeight: freezed == currentWeight
                ? _value.currentWeight
                : currentWeight // ignore: cast_nullable_to_non_nullable
                      as double?,
            targetWeight: freezed == targetWeight
                ? _value.targetWeight
                : targetWeight // ignore: cast_nullable_to_non_nullable
                      as double?,
            hasPreviousAttempts: freezed == hasPreviousAttempts
                ? _value.hasPreviousAttempts
                : hasPreviousAttempts // ignore: cast_nullable_to_non_nullable
                      as bool?,
            previousAttemptsDetails: freezed == previousAttemptsDetails
                ? _value.previousAttemptsDetails
                : previousAttemptsDetails // ignore: cast_nullable_to_non_nullable
                      as String?,
            birthYear: freezed == birthYear
                ? _value.birthYear
                : birthYear // ignore: cast_nullable_to_non_nullable
                      as int?,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as double?,
            targetAreas: null == targetAreas
                ? _value.targetAreas
                : targetAreas // ignore: cast_nullable_to_non_nullable
                      as List<TargetArea>,
            currentBodyShape: freezed == currentBodyShape
                ? _value.currentBodyShape
                : currentBodyShape // ignore: cast_nullable_to_non_nullable
                      as BodyShape?,
            targetBodyShape: freezed == targetBodyShape
                ? _value.targetBodyShape
                : targetBodyShape // ignore: cast_nullable_to_non_nullable
                      as BodyShape?,
            mealFrequency: freezed == mealFrequency
                ? _value.mealFrequency
                : mealFrequency // ignore: cast_nullable_to_non_nullable
                      as MealFrequency?,
            hasRegularEatingSchedule: freezed == hasRegularEatingSchedule
                ? _value.hasRegularEatingSchedule
                : hasRegularEatingSchedule // ignore: cast_nullable_to_non_nullable
                      as bool?,
            activityLevel: freezed == activityLevel
                ? _value.activityLevel
                : activityLevel // ignore: cast_nullable_to_non_nullable
                      as ActivityLevel?,
            workoutPreferences: null == workoutPreferences
                ? _value.workoutPreferences
                : workoutPreferences // ignore: cast_nullable_to_non_nullable
                      as List<WorkoutPreference>,
            workoutLocation: freezed == workoutLocation
                ? _value.workoutLocation
                : workoutLocation // ignore: cast_nullable_to_non_nullable
                      as WorkoutLocation?,
            availableEquipment: null == availableEquipment
                ? _value.availableEquipment
                : availableEquipment // ignore: cast_nullable_to_non_nullable
                      as List<Equipment>,
            avoidAreas: null == avoidAreas
                ? _value.avoidAreas
                : avoidAreas // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            currentStep: null == currentStep
                ? _value.currentStep
                : currentStep // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
    _$UserProfileImpl value,
    $Res Function(_$UserProfileImpl) then,
  ) = __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double? currentWeight,
    double? targetWeight,
    bool? hasPreviousAttempts,
    String? previousAttemptsDetails,
    int? birthYear,
    double? height,
    List<TargetArea> targetAreas,
    BodyShape? currentBodyShape,
    BodyShape? targetBodyShape,
    MealFrequency? mealFrequency,
    bool? hasRegularEatingSchedule,
    ActivityLevel? activityLevel,
    List<WorkoutPreference> workoutPreferences,
    WorkoutLocation? workoutLocation,
    List<Equipment> availableEquipment,
    List<String> avoidAreas,
    int currentStep,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
    _$UserProfileImpl _value,
    $Res Function(_$UserProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentWeight = freezed,
    Object? targetWeight = freezed,
    Object? hasPreviousAttempts = freezed,
    Object? previousAttemptsDetails = freezed,
    Object? birthYear = freezed,
    Object? height = freezed,
    Object? targetAreas = null,
    Object? currentBodyShape = freezed,
    Object? targetBodyShape = freezed,
    Object? mealFrequency = freezed,
    Object? hasRegularEatingSchedule = freezed,
    Object? activityLevel = freezed,
    Object? workoutPreferences = null,
    Object? workoutLocation = freezed,
    Object? availableEquipment = null,
    Object? avoidAreas = null,
    Object? currentStep = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$UserProfileImpl(
        currentWeight: freezed == currentWeight
            ? _value.currentWeight
            : currentWeight // ignore: cast_nullable_to_non_nullable
                  as double?,
        targetWeight: freezed == targetWeight
            ? _value.targetWeight
            : targetWeight // ignore: cast_nullable_to_non_nullable
                  as double?,
        hasPreviousAttempts: freezed == hasPreviousAttempts
            ? _value.hasPreviousAttempts
            : hasPreviousAttempts // ignore: cast_nullable_to_non_nullable
                  as bool?,
        previousAttemptsDetails: freezed == previousAttemptsDetails
            ? _value.previousAttemptsDetails
            : previousAttemptsDetails // ignore: cast_nullable_to_non_nullable
                  as String?,
        birthYear: freezed == birthYear
            ? _value.birthYear
            : birthYear // ignore: cast_nullable_to_non_nullable
                  as int?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as double?,
        targetAreas: null == targetAreas
            ? _value._targetAreas
            : targetAreas // ignore: cast_nullable_to_non_nullable
                  as List<TargetArea>,
        currentBodyShape: freezed == currentBodyShape
            ? _value.currentBodyShape
            : currentBodyShape // ignore: cast_nullable_to_non_nullable
                  as BodyShape?,
        targetBodyShape: freezed == targetBodyShape
            ? _value.targetBodyShape
            : targetBodyShape // ignore: cast_nullable_to_non_nullable
                  as BodyShape?,
        mealFrequency: freezed == mealFrequency
            ? _value.mealFrequency
            : mealFrequency // ignore: cast_nullable_to_non_nullable
                  as MealFrequency?,
        hasRegularEatingSchedule: freezed == hasRegularEatingSchedule
            ? _value.hasRegularEatingSchedule
            : hasRegularEatingSchedule // ignore: cast_nullable_to_non_nullable
                  as bool?,
        activityLevel: freezed == activityLevel
            ? _value.activityLevel
            : activityLevel // ignore: cast_nullable_to_non_nullable
                  as ActivityLevel?,
        workoutPreferences: null == workoutPreferences
            ? _value._workoutPreferences
            : workoutPreferences // ignore: cast_nullable_to_non_nullable
                  as List<WorkoutPreference>,
        workoutLocation: freezed == workoutLocation
            ? _value.workoutLocation
            : workoutLocation // ignore: cast_nullable_to_non_nullable
                  as WorkoutLocation?,
        availableEquipment: null == availableEquipment
            ? _value._availableEquipment
            : availableEquipment // ignore: cast_nullable_to_non_nullable
                  as List<Equipment>,
        avoidAreas: null == avoidAreas
            ? _value._avoidAreas
            : avoidAreas // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        currentStep: null == currentStep
            ? _value.currentStep
            : currentStep // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl({
    this.currentWeight,
    this.targetWeight,
    this.hasPreviousAttempts,
    this.previousAttemptsDetails,
    this.birthYear,
    this.height,
    final List<TargetArea> targetAreas = const [],
    this.currentBodyShape,
    this.targetBodyShape,
    this.mealFrequency,
    this.hasRegularEatingSchedule,
    this.activityLevel,
    final List<WorkoutPreference> workoutPreferences = const [],
    this.workoutLocation,
    final List<Equipment> availableEquipment = const [],
    final List<String> avoidAreas = const [],
    this.currentStep = 1,
    this.createdAt,
    this.updatedAt,
  }) : _targetAreas = targetAreas,
       _workoutPreferences = workoutPreferences,
       _availableEquipment = availableEquipment,
       _avoidAreas = avoidAreas;

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  // Step 1: Current weight
  @override
  final double? currentWeight;
  // Step 2: Target weight
  @override
  final double? targetWeight;
  // Step 3: Previous weight loss attempts
  @override
  final bool? hasPreviousAttempts;
  @override
  final String? previousAttemptsDetails;
  // Step 4: Birth year
  @override
  final int? birthYear;
  // Step 5: Height
  @override
  final double? height;
  // Step 6: Target areas
  final List<TargetArea> _targetAreas;
  // Step 6: Target areas
  @override
  @JsonKey()
  List<TargetArea> get targetAreas {
    if (_targetAreas is EqualUnmodifiableListView) return _targetAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetAreas);
  }

  // Step 7: Current body shape
  @override
  final BodyShape? currentBodyShape;
  // Step 8: Target body shape
  @override
  final BodyShape? targetBodyShape;
  // Step 9: Meal frequency
  @override
  final MealFrequency? mealFrequency;
  // Step 10: Regular eating schedule
  @override
  final bool? hasRegularEatingSchedule;
  // Step 11: Activity level
  @override
  final ActivityLevel? activityLevel;
  // Step 12: Workout preferences
  final List<WorkoutPreference> _workoutPreferences;
  // Step 12: Workout preferences
  @override
  @JsonKey()
  List<WorkoutPreference> get workoutPreferences {
    if (_workoutPreferences is EqualUnmodifiableListView)
      return _workoutPreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workoutPreferences);
  }

  // Step 13: Workout location
  @override
  final WorkoutLocation? workoutLocation;
  // Step 14: Available equipment
  final List<Equipment> _availableEquipment;
  // Step 14: Available equipment
  @override
  @JsonKey()
  List<Equipment> get availableEquipment {
    if (_availableEquipment is EqualUnmodifiableListView)
      return _availableEquipment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableEquipment);
  }

  // Step 15: Areas to avoid (injuries)
  final List<String> _avoidAreas;
  // Step 15: Areas to avoid (injuries)
  @override
  @JsonKey()
  List<String> get avoidAreas {
    if (_avoidAreas is EqualUnmodifiableListView) return _avoidAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_avoidAreas);
  }

  // Metadata
  @override
  @JsonKey()
  final int currentStep;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserProfile(currentWeight: $currentWeight, targetWeight: $targetWeight, hasPreviousAttempts: $hasPreviousAttempts, previousAttemptsDetails: $previousAttemptsDetails, birthYear: $birthYear, height: $height, targetAreas: $targetAreas, currentBodyShape: $currentBodyShape, targetBodyShape: $targetBodyShape, mealFrequency: $mealFrequency, hasRegularEatingSchedule: $hasRegularEatingSchedule, activityLevel: $activityLevel, workoutPreferences: $workoutPreferences, workoutLocation: $workoutLocation, availableEquipment: $availableEquipment, avoidAreas: $avoidAreas, currentStep: $currentStep, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.currentWeight, currentWeight) ||
                other.currentWeight == currentWeight) &&
            (identical(other.targetWeight, targetWeight) ||
                other.targetWeight == targetWeight) &&
            (identical(other.hasPreviousAttempts, hasPreviousAttempts) ||
                other.hasPreviousAttempts == hasPreviousAttempts) &&
            (identical(
                  other.previousAttemptsDetails,
                  previousAttemptsDetails,
                ) ||
                other.previousAttemptsDetails == previousAttemptsDetails) &&
            (identical(other.birthYear, birthYear) ||
                other.birthYear == birthYear) &&
            (identical(other.height, height) || other.height == height) &&
            const DeepCollectionEquality().equals(
              other._targetAreas,
              _targetAreas,
            ) &&
            (identical(other.currentBodyShape, currentBodyShape) ||
                other.currentBodyShape == currentBodyShape) &&
            (identical(other.targetBodyShape, targetBodyShape) ||
                other.targetBodyShape == targetBodyShape) &&
            (identical(other.mealFrequency, mealFrequency) ||
                other.mealFrequency == mealFrequency) &&
            (identical(
                  other.hasRegularEatingSchedule,
                  hasRegularEatingSchedule,
                ) ||
                other.hasRegularEatingSchedule == hasRegularEatingSchedule) &&
            (identical(other.activityLevel, activityLevel) ||
                other.activityLevel == activityLevel) &&
            const DeepCollectionEquality().equals(
              other._workoutPreferences,
              _workoutPreferences,
            ) &&
            (identical(other.workoutLocation, workoutLocation) ||
                other.workoutLocation == workoutLocation) &&
            const DeepCollectionEquality().equals(
              other._availableEquipment,
              _availableEquipment,
            ) &&
            const DeepCollectionEquality().equals(
              other._avoidAreas,
              _avoidAreas,
            ) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    currentWeight,
    targetWeight,
    hasPreviousAttempts,
    previousAttemptsDetails,
    birthYear,
    height,
    const DeepCollectionEquality().hash(_targetAreas),
    currentBodyShape,
    targetBodyShape,
    mealFrequency,
    hasRegularEatingSchedule,
    activityLevel,
    const DeepCollectionEquality().hash(_workoutPreferences),
    workoutLocation,
    const DeepCollectionEquality().hash(_availableEquipment),
    const DeepCollectionEquality().hash(_avoidAreas),
    currentStep,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(this);
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile({
    final double? currentWeight,
    final double? targetWeight,
    final bool? hasPreviousAttempts,
    final String? previousAttemptsDetails,
    final int? birthYear,
    final double? height,
    final List<TargetArea> targetAreas,
    final BodyShape? currentBodyShape,
    final BodyShape? targetBodyShape,
    final MealFrequency? mealFrequency,
    final bool? hasRegularEatingSchedule,
    final ActivityLevel? activityLevel,
    final List<WorkoutPreference> workoutPreferences,
    final WorkoutLocation? workoutLocation,
    final List<Equipment> availableEquipment,
    final List<String> avoidAreas,
    final int currentStep,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  // Step 1: Current weight
  @override
  double? get currentWeight; // Step 2: Target weight
  @override
  double? get targetWeight; // Step 3: Previous weight loss attempts
  @override
  bool? get hasPreviousAttempts;
  @override
  String? get previousAttemptsDetails; // Step 4: Birth year
  @override
  int? get birthYear; // Step 5: Height
  @override
  double? get height; // Step 6: Target areas
  @override
  List<TargetArea> get targetAreas; // Step 7: Current body shape
  @override
  BodyShape? get currentBodyShape; // Step 8: Target body shape
  @override
  BodyShape? get targetBodyShape; // Step 9: Meal frequency
  @override
  MealFrequency? get mealFrequency; // Step 10: Regular eating schedule
  @override
  bool? get hasRegularEatingSchedule; // Step 11: Activity level
  @override
  ActivityLevel? get activityLevel; // Step 12: Workout preferences
  @override
  List<WorkoutPreference> get workoutPreferences; // Step 13: Workout location
  @override
  WorkoutLocation? get workoutLocation; // Step 14: Available equipment
  @override
  List<Equipment> get availableEquipment; // Step 15: Areas to avoid (injuries)
  @override
  List<String> get avoidAreas; // Metadata
  @override
  int get currentStep;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FormProgress _$FormProgressFromJson(Map<String, dynamic> json) {
  return _FormProgress.fromJson(json);
}

/// @nodoc
mixin _$FormProgress {
  int get currentStep => throw _privateConstructorUsedError;
  int get totalSteps => throw _privateConstructorUsedError;
  Map<int, bool> get completedSteps => throw _privateConstructorUsedError;

  /// Serializes this FormProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FormProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormProgressCopyWith<FormProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormProgressCopyWith<$Res> {
  factory $FormProgressCopyWith(
    FormProgress value,
    $Res Function(FormProgress) then,
  ) = _$FormProgressCopyWithImpl<$Res, FormProgress>;
  @useResult
  $Res call({int currentStep, int totalSteps, Map<int, bool> completedSteps});
}

/// @nodoc
class _$FormProgressCopyWithImpl<$Res, $Val extends FormProgress>
    implements $FormProgressCopyWith<$Res> {
  _$FormProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? totalSteps = null,
    Object? completedSteps = null,
  }) {
    return _then(
      _value.copyWith(
            currentStep: null == currentStep
                ? _value.currentStep
                : currentStep // ignore: cast_nullable_to_non_nullable
                      as int,
            totalSteps: null == totalSteps
                ? _value.totalSteps
                : totalSteps // ignore: cast_nullable_to_non_nullable
                      as int,
            completedSteps: null == completedSteps
                ? _value.completedSteps
                : completedSteps // ignore: cast_nullable_to_non_nullable
                      as Map<int, bool>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FormProgressImplCopyWith<$Res>
    implements $FormProgressCopyWith<$Res> {
  factory _$$FormProgressImplCopyWith(
    _$FormProgressImpl value,
    $Res Function(_$FormProgressImpl) then,
  ) = __$$FormProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentStep, int totalSteps, Map<int, bool> completedSteps});
}

/// @nodoc
class __$$FormProgressImplCopyWithImpl<$Res>
    extends _$FormProgressCopyWithImpl<$Res, _$FormProgressImpl>
    implements _$$FormProgressImplCopyWith<$Res> {
  __$$FormProgressImplCopyWithImpl(
    _$FormProgressImpl _value,
    $Res Function(_$FormProgressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FormProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? totalSteps = null,
    Object? completedSteps = null,
  }) {
    return _then(
      _$FormProgressImpl(
        currentStep: null == currentStep
            ? _value.currentStep
            : currentStep // ignore: cast_nullable_to_non_nullable
                  as int,
        totalSteps: null == totalSteps
            ? _value.totalSteps
            : totalSteps // ignore: cast_nullable_to_non_nullable
                  as int,
        completedSteps: null == completedSteps
            ? _value._completedSteps
            : completedSteps // ignore: cast_nullable_to_non_nullable
                  as Map<int, bool>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FormProgressImpl implements _FormProgress {
  const _$FormProgressImpl({
    this.currentStep = 0,
    this.totalSteps = 15,
    final Map<int, bool> completedSteps = const {},
  }) : _completedSteps = completedSteps;

  factory _$FormProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormProgressImplFromJson(json);

  @override
  @JsonKey()
  final int currentStep;
  @override
  @JsonKey()
  final int totalSteps;
  final Map<int, bool> _completedSteps;
  @override
  @JsonKey()
  Map<int, bool> get completedSteps {
    if (_completedSteps is EqualUnmodifiableMapView) return _completedSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_completedSteps);
  }

  @override
  String toString() {
    return 'FormProgress(currentStep: $currentStep, totalSteps: $totalSteps, completedSteps: $completedSteps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormProgressImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.totalSteps, totalSteps) ||
                other.totalSteps == totalSteps) &&
            const DeepCollectionEquality().equals(
              other._completedSteps,
              _completedSteps,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentStep,
    totalSteps,
    const DeepCollectionEquality().hash(_completedSteps),
  );

  /// Create a copy of FormProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormProgressImplCopyWith<_$FormProgressImpl> get copyWith =>
      __$$FormProgressImplCopyWithImpl<_$FormProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormProgressImplToJson(this);
  }
}

abstract class _FormProgress implements FormProgress {
  const factory _FormProgress({
    final int currentStep,
    final int totalSteps,
    final Map<int, bool> completedSteps,
  }) = _$FormProgressImpl;

  factory _FormProgress.fromJson(Map<String, dynamic> json) =
      _$FormProgressImpl.fromJson;

  @override
  int get currentStep;
  @override
  int get totalSteps;
  @override
  Map<int, bool> get completedSteps;

  /// Create a copy of FormProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormProgressImplCopyWith<_$FormProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
