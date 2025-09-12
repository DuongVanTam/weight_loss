import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:convert';
import 'local_storage_service.dart';

part 'local_storage_service_provider.g.dart';

/// Provider for LocalStorageService with async methods
@riverpod
class LocalStorageServiceProvider extends _$LocalStorageServiceProvider {
  @override
  LocalStorageService build() {
    return LocalStorageService();
  }

  /// Save JSON data as string
  Future<bool> saveString(String key, Map<String, dynamic> jsonData) async {
    try {
      final jsonString = jsonEncode(jsonData);
      return await LocalStorageService.setString(key, jsonString);
    } catch (e) {
      return false;
    }
  }

  /// Get JSON data from string
  Future<Map<String, dynamic>?> getString(String key) async {
    try {
      final jsonString = LocalStorageService.getString(key);
      if (jsonString != null) {
        return jsonDecode(jsonString) as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Remove a key
  Future<bool> remove(String key) async {
    return await LocalStorageService.remove(key);
  }

  /// Check if key exists
  bool containsKey(String key) {
    return LocalStorageService.containsKey(key);
  }
}
