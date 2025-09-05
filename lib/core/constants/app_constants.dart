/// Application-wide constants
class AppConstants {
  // App Information
  static const String appName = 'WeightLoss';
  static const String appVersion = '1.0.0';
  
  // Spacing Constants
  static const double spacingXs = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXl = 32.0;
  static const double spacingXxl = 48.0;
  
  // Border Radius Constants
  static const double radiusS = 8.0;
  static const double radiusM = 14.0;
  static const double radiusL = 20.0;
  static const double radiusXl = 28.0;
  
  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);
  
  // Form Validation
  static const int minPasswordLength = 6;
  static const int maxNameLength = 50;
  
  // Local Storage Keys
  static const String keyUserProfile = 'user_profile';
  static const String keyWorkoutPlan = 'workout_plan';
  static const String keyThemeMode = 'theme_mode';
  static const String keyOnboardingComplete = 'onboarding_complete';
  
  // API Endpoints (for future use)
  static const String baseUrl = 'https://api.weightloss.app';
  static const String endpointAuth = '/auth';
  static const String endpointWorkouts = '/workouts';
  static const String endpointPlans = '/plans';

  AppConstants._(); // Private constructor to prevent instantiation
}
