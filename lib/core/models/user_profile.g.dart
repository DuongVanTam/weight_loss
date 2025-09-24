// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      currentWeight: (json['current_weight'] as num?)?.toDouble(),
      targetWeight: (json['target_weight'] as num?)?.toDouble(),
      hasPreviousAttempts: json['has_previous_attempts'] as bool?,
      previousAttemptsDetails: json['previous_attempts_details'] as String?,
      birthYear: (json['birth_year'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toDouble(),
      targetAreas:
          (json['target_areas'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$TargetAreaEnumMap, e))
              .toList() ??
          const [],
      currentBodyShape: $enumDecodeNullable(
        _$BodyShapeEnumMap,
        json['current_body_shape'],
      ),
      targetBodyShape: $enumDecodeNullable(
        _$BodyShapeEnumMap,
        json['target_body_shape'],
      ),
      mealFrequency: (json['meal_frequency'] as num?)?.toInt(),
      eatingSchedule: json['eating_schedule'] as String?,
      activityLevel: $enumDecodeNullable(
        _$ActivityLevelEnumMap,
        json['activity_level'],
      ),
      workoutPreferences:
          (json['workout_preferences'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$WorkoutPreferenceEnumMap, e))
              .toList() ??
          const [],
      workoutLocation: $enumDecodeNullable(
        _$WorkoutLocationEnumMap,
        json['workout_location'],
      ),
      availableEquipment:
          (json['available_equipment'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$EquipmentEnumMap, e))
              .toList() ??
          const [],
      avoidAreas:
          (json['avoid_areas'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      currentStep: (json['current_step'] as num?)?.toInt() ?? 1,
      completedSteps:
          (json['completed_steps'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(int.parse(k), e as bool),
          ) ??
          const {},
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      if (instance.currentWeight case final value?) 'current_weight': value,
      if (instance.targetWeight case final value?) 'target_weight': value,
      if (instance.hasPreviousAttempts case final value?)
        'has_previous_attempts': value,
      if (instance.previousAttemptsDetails case final value?)
        'previous_attempts_details': value,
      if (instance.birthYear case final value?) 'birth_year': value,
      if (instance.height case final value?) 'height': value,
      'target_areas': instance.targetAreas
          .map((e) => _$TargetAreaEnumMap[e]!)
          .toList(),
      if (_$BodyShapeEnumMap[instance.currentBodyShape] case final value?)
        'current_body_shape': value,
      if (_$BodyShapeEnumMap[instance.targetBodyShape] case final value?)
        'target_body_shape': value,
      if (instance.mealFrequency case final value?) 'meal_frequency': value,
      if (instance.eatingSchedule case final value?) 'eating_schedule': value,
      if (_$ActivityLevelEnumMap[instance.activityLevel] case final value?)
        'activity_level': value,
      'workout_preferences': instance.workoutPreferences
          .map((e) => _$WorkoutPreferenceEnumMap[e]!)
          .toList(),
      if (_$WorkoutLocationEnumMap[instance.workoutLocation] case final value?)
        'workout_location': value,
      'available_equipment': instance.availableEquipment
          .map((e) => _$EquipmentEnumMap[e]!)
          .toList(),
      'avoid_areas': instance.avoidAreas,
      'current_step': instance.currentStep,
      'completed_steps': instance.completedSteps.map(
        (k, e) => MapEntry(k.toString(), e),
      ),
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
    };

const _$TargetAreaEnumMap = {
  TargetArea.belly: 'belly',
  TargetArea.arms: 'arms',
  TargetArea.glutes: 'glutes',
  TargetArea.legs: 'legs',
  TargetArea.overall: 'overall',
};

const _$BodyShapeEnumMap = {
  BodyShape.shape1: 'shape1',
  BodyShape.shape2: 'shape2',
  BodyShape.shape3: 'shape3',
  BodyShape.shape4: 'shape4',
  BodyShape.shape5: 'shape5',
  BodyShape.shape6: 'shape6',
};

const _$ActivityLevelEnumMap = {
  ActivityLevel.sedentary: 'sedentary',
  ActivityLevel.light: 'light',
  ActivityLevel.moderate: 'moderate',
  ActivityLevel.active: 'active',
};

const _$WorkoutPreferenceEnumMap = {
  WorkoutPreference.cardio: 'cardio',
  WorkoutPreference.hiit: 'hiit',
  WorkoutPreference.yoga: 'yoga',
  WorkoutPreference.strength: 'strength',
  WorkoutPreference.pilates: 'pilates',
  WorkoutPreference.dance: 'dance',
};

const _$WorkoutLocationEnumMap = {
  WorkoutLocation.home: 'home',
  WorkoutLocation.gym: 'gym',
  WorkoutLocation.outdoor: 'outdoor',
  WorkoutLocation.mixed: 'mixed',
};

const _$EquipmentEnumMap = {
  Equipment.dumbbells: 'dumbbells',
  Equipment.resistanceBands: 'resistanceBands',
  Equipment.yogaMat: 'yogaMat',
  Equipment.kettlebells: 'kettlebells',
  Equipment.barbell: 'barbell',
  Equipment.none: 'none',
};

_$FormProgressImpl _$$FormProgressImplFromJson(Map<String, dynamic> json) =>
    _$FormProgressImpl(
      currentStep: (json['current_step'] as num?)?.toInt() ?? 0,
      totalSteps: (json['total_steps'] as num?)?.toInt() ?? 15,
      completedSteps:
          (json['completed_steps'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(int.parse(k), e as bool),
          ) ??
          const {},
    );

Map<String, dynamic> _$$FormProgressImplToJson(_$FormProgressImpl instance) =>
    <String, dynamic>{
      'current_step': instance.currentStep,
      'total_steps': instance.totalSteps,
      'completed_steps': instance.completedSteps.map(
        (k, e) => MapEntry(k.toString(), e),
      ),
    };
