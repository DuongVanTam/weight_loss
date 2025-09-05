import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

/// Service for managing local storage using SharedPreferences
class LocalStorageService {
  static SharedPreferences? _preferences;

  /// Initialize SharedPreferences
  static Future<void> initialize() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  /// Get SharedPreferences instance
  static SharedPreferences get _prefs {
    if (_preferences == null) {
      throw Exception('LocalStorageService not initialized. Call initialize() first.');
    }
    return _preferences!;
  }

  // User Profile Methods
  /// Save user profile data
  static Future<bool> saveUserProfile(String profileJson) async {
    return await _prefs.setString(AppConstants.keyUserProfile, profileJson);
  }

  /// Get user profile data
  static String? getUserProfile() {
    return _prefs.getString(AppConstants.keyUserProfile);
  }

  /// Check if user profile exists
  static bool hasUserProfile() {
    return _prefs.containsKey(AppConstants.keyUserProfile);
  }

  // Workout Plan Methods
  /// Save workout plan data
  static Future<bool> saveWorkoutPlan(String planJson) async {
    return await _prefs.setString(AppConstants.keyWorkoutPlan, planJson);
  }

  /// Get workout plan data
  static String? getWorkoutPlan() {
    return _prefs.getString(AppConstants.keyWorkoutPlan);
  }

  /// Check if workout plan exists
  static bool hasWorkoutPlan() {
    return _prefs.containsKey(AppConstants.keyWorkoutPlan);
  }

  // App Settings Methods
  /// Save theme mode (light/dark/system)
  static Future<bool> saveThemeMode(String themeMode) async {
    return await _prefs.setString(AppConstants.keyThemeMode, themeMode);
  }

  /// Get theme mode
  static String getThemeMode() {
    return _prefs.getString(AppConstants.keyThemeMode) ?? 'system';
  }

  /// Save onboarding completion status
  static Future<bool> setOnboardingComplete(bool isComplete) async {
    return await _prefs.setBool(AppConstants.keyOnboardingComplete, isComplete);
  }

  /// Check if onboarding is complete
  static bool isOnboardingComplete() {
    return _prefs.getBool(AppConstants.keyOnboardingComplete) ?? false;
  }

  // Generic Methods
  /// Save string value
  static Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  /// Get string value
  static String? getString(String key) {
    return _prefs.getString(key);
  }

  /// Save integer value
  static Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  /// Get integer value
  static int? getInt(String key) {
    return _prefs.getInt(key);
  }

  /// Save boolean value
  static Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  /// Get boolean value
  static bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  /// Save double value
  static Future<bool> setDouble(String key, double value) async {
    return await _prefs.setDouble(key, value);
  }

  /// Get double value
  static double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  /// Save list of strings
  static Future<bool> setStringList(String key, List<String> values) async {
    return await _prefs.setStringList(key, values);
  }

  /// Get list of strings
  static List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  /// Remove a key
  static Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  /// Clear all data
  static Future<bool> clear() async {
    return await _prefs.clear();
  }

  /// Check if key exists
  static bool containsKey(String key) {
    return _prefs.containsKey(key);
  }
}
