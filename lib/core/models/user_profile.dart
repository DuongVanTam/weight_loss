import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// Enum for activity level
enum ActivityLevel {
  sedentary('Ít vận động'),
  light('Vận động nhẹ'),
  moderate('Vừa phải'),
  active('Năng động');

  const ActivityLevel(this.displayName);
  final String displayName;
}

/// Enum for workout preferences
enum WorkoutPreference {
  cardio('Cardio'),
  hiit('HIIT'),
  yoga('Yoga'),
  strength('Tập tạ'),
  pilates('Pilates'),
  dance('Nhảy múa');

  const WorkoutPreference(this.displayName);
  final String displayName;
}

/// Enum for workout location
enum WorkoutLocation {
  home('Tại nhà'),
  gym('Phòng gym'),
  outdoor('Ngoài trời'),
  mixed('Kết hợp');

  const WorkoutLocation(this.displayName);
  final String displayName;
}

/// Enum for body shape (current and target)
enum BodyShape {
  apple('Táo'),
  pear('Lê'),
  hourglass('Đồng hồ cát'),
  rectangle('Hình chữ nhật'),
  triangle('Tam giác ngược');

  const BodyShape(this.displayName);
  final String displayName;
}

/// Enum for target areas to reduce fat
enum TargetArea {
  belly('Bụng'),
  thighs('Đùi'),
  arms('Cánh tay'),
  back('Lưng'),
  waist('Eo'),
  overall('Toàn thân');

  const TargetArea(this.displayName);
  final String displayName;
}

/// Enum for meal frequency
enum MealFrequency {
  two('2 bữa/ngày'),
  three('3 bữa/ngày'),
  four('4 bữa/ngày'),
  five('5 bữa/ngày'),
  six('6 bữa/ngày');

  const MealFrequency(this.displayName);
  final String displayName;
}

/// Enum for equipment availability
enum Equipment {
  dumbbells('Tạ đơn'),
  resistance_bands('Dây kháng lực'),
  yoga_mat('Thảm yoga'),
  kettlebells('Tạ ấm'),
  barbell('Tạ đòn'),
  none('Không có dụng cụ');

  const Equipment(this.displayName);
  final String displayName;
}

/// Main user profile model
@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    // Step 1: Current weight
    double? currentWeight,
    
    // Step 2: Target weight
    double? targetWeight,
    
    // Step 3: Previous weight loss attempts
    bool? hasPreviousAttempts,
    String? previousAttemptsDetails,
    
    // Step 4: Birth year
    int? birthYear,
    
    // Step 5: Height
    double? height,
    
    // Step 6: Target areas
    @Default([]) List<TargetArea> targetAreas,
    
    // Step 7: Current body shape
    BodyShape? currentBodyShape,
    
    // Step 8: Target body shape
    BodyShape? targetBodyShape,
    
    // Step 9: Meal frequency
    MealFrequency? mealFrequency,
    
    // Step 10: Regular eating schedule
    bool? hasRegularEatingSchedule,
    
    // Step 11: Activity level
    ActivityLevel? activityLevel,
    
    // Step 12: Workout preferences
    @Default([]) List<WorkoutPreference> workoutPreferences,
    
    // Step 13: Workout location
    WorkoutLocation? workoutLocation,
    
    // Step 14: Available equipment
    @Default([]) List<Equipment> availableEquipment,
    
    // Step 15: Areas to avoid (injuries)
    @Default([]) List<String> avoidAreas,
    
    // Metadata
    @Default(1) int currentStep,
    @Default({}) Map<int, bool> completedSteps,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

/// Form completion status
@freezed
class FormProgress with _$FormProgress {
  const factory FormProgress({
    @Default(0) int currentStep,
    @Default(15) int totalSteps,
    @Default({}) Map<int, bool> completedSteps,
  }) = _FormProgress;

  factory FormProgress.fromJson(Map<String, dynamic> json) =>
      _$FormProgressFromJson(json);
}
