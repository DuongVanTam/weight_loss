import 'dart:convert';
import 'package:flutter/services.dart';

/// Service for loading JSON data from assets
class JsonLoaderService {
  /// Load workout data from JSON file
  static Future<Map<String, dynamic>> loadWorkouts() async {
    try {
      final String jsonString = await rootBundle.loadString('lib/data/mock/workouts.json');
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      throw Exception('Failed to load workouts: $e');
    }
  }

  /// Load workout plans from JSON file
  static Future<Map<String, dynamic>> loadPlans() async {
    try {
      final String jsonString = await rootBundle.loadString('lib/data/mock/plans.json');
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      throw Exception('Failed to load plans: $e');
    }
  }

  /// Generic method to load any JSON file
  static Future<Map<String, dynamic>> loadJsonFile(String path) async {
    try {
      final String jsonString = await rootBundle.loadString(path);
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      throw Exception('Failed to load JSON file at $path: $e');
    }
  }

  /// Load and parse JSON data with error handling
  static Future<T?> loadAndParseJson<T>(
    String path,
    T Function(Map<String, dynamic>) parser,
  ) async {
    try {
      final jsonData = await loadJsonFile(path);
      return parser(jsonData);
    } catch (e) {
      // Log error in production, you might want to use a proper logging service
      // ignore: avoid_print
      print('Error loading JSON from $path: $e');
      return null;
    }
  }
}

/// Extension to add debug print functionality
extension DebugPrint on Object {
  void debugPrint(String message) {
    // ignore: avoid_print
    print('[DEBUG] $message');
  }
}
