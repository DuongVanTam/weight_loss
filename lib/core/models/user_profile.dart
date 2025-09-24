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


/// Enum for body shape (current and target)
enum BodyShape {
  shape1('Rất thon gọn', 'Cơ thể rất thon gọn, ít mỡ thừa, cơ bắp rõ nét'),
  shape2('Thon gọn', 'Cơ thể thon gọn, tỷ lệ cân đối, ít mỡ thừa'),
  shape3('Bình thường', 'Cơ thể bình thường, tỷ lệ cân đối, một chút mỡ thừa'),
  shape4('Hơi đầy đặn', 'Cơ thể hơi đầy đặn, có mỡ thừa ở một số vùng'),
  shape5('Đầy đặn', 'Cơ thể đầy đặn, mỡ thừa rõ rệt ở nhiều vùng'),
  shape6('Rất đầy đặn', 'Cơ thể rất đầy đặn, cần giảm cân để cải thiện sức khỏe');

  const BodyShape(this.displayName, this.description);
  final String displayName;
  final String description;
  
  /// Get the image asset path for this body shape
  String get imagePath {
    switch (this) {
      case BodyShape.shape1:
        return 'assets/images/body-shape/1.png';
      case BodyShape.shape2:
        return 'assets/images/body-shape/2.png';
      case BodyShape.shape3:
        return 'assets/images/body-shape/3.png';
      case BodyShape.shape4:
        return 'assets/images/body-shape/4.png';
      case BodyShape.shape5:
        return 'assets/images/body-shape/5.png';
      case BodyShape.shape6:
        return 'assets/images/body-shape/6.png';
    }
  }
  
  /// Get the shape number (1-6)
  int get shapeNumber => index + 1;
}

/// Enum for target areas to reduce fat
enum TargetArea {
  belly('Bụng'),
  arms('Tay'),
  glutes('Mông'),
  legs('Chân'),
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
    int? mealFrequency,
    
    // Step 10: Eating schedule
    String? eatingSchedule,
    
    // Step 11: Activity level
    ActivityLevel? activityLevel,
    
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
    @Default(11) int totalSteps,
    @Default({}) Map<int, bool> completedSteps,
  }) = _FormProgress;

  factory FormProgress.fromJson(Map<String, dynamic> json) =>
      _$FormProgressFromJson(json);
}
