import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user_profile.dart';
import 'local_storage_service_provider.dart';

part 'user_form_service.g.dart';

/// Service to manage user form data and progress
@riverpod
class UserFormService extends _$UserFormService {
  static const String _userProfileKey = 'user_profile';
  static const String _formProgressKey = 'form_progress';

  @override
  UserProfile build() {
    _loadUserProfile();
    return const UserProfile(); // Default currentStep is now 1
  }

  /// Load user profile from local storage
  Future<void> _loadUserProfile() async {
    try {
      final storage = ref.read(localStorageServiceProviderProvider.notifier);
      final profileData = await storage.getString(_userProfileKey);
      
      if (profileData != null) {
        final profile = UserProfile.fromJson(profileData);
        state = profile;
      }
    } catch (e) {
      // Handle error - keep default state
      print('Error loading user profile: $e');
    }
  }

  /// Save current profile to local storage
  Future<void> _saveUserProfile() async {
    try {
      final storage = ref.read(localStorageServiceProviderProvider.notifier);
      await storage.saveString(_userProfileKey, state.toJson());
    } catch (e) {
      print('Error saving user profile: $e');
    }
  }

  /// Update current weight (Step 1)
  Future<void> updateCurrentWeight(double weight) async {
    state = state.copyWith(
      currentWeight: weight,
      currentStep: state.currentStep < 1 ? 1 : state.currentStep,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Update target weight (Step 2)
  Future<void> updateTargetWeight(double weight) async {
    state = state.copyWith(
      targetWeight: weight,
      currentStep: state.currentStep < 2 ? 2 : state.currentStep,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Update previous attempts (Step 3)
  Future<void> updatePreviousAttempts(bool hasAttempts, String? details) async {
    state = state.copyWith(
      hasPreviousAttempts: hasAttempts,
      previousAttemptsDetails: details,
      currentStep: state.currentStep < 3 ? 3 : state.currentStep,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Update birth year (Step 4)
  Future<void> updateBirthYear(int year) async {
    state = state.copyWith(
      birthYear: year,
      currentStep: state.currentStep < 4 ? 4 : state.currentStep,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Update height (Step 5)
  Future<void> updateHeight(double height) async {
    state = state.copyWith(
      height: height,
      currentStep: state.currentStep < 5 ? 5 : state.currentStep,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Update target areas (Step 6)
  Future<void> updateTargetAreas(List<TargetArea> areas) async {
    state = state.copyWith(
      targetAreas: areas,
      currentStep: state.currentStep < 6 ? 6 : state.currentStep,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Update current body shape (Step 7)
  Future<void> updateCurrentBodyShape(BodyShape shape) async {
    state = state.copyWith(
      currentBodyShape: shape,
      currentStep: state.currentStep < 7 ? 7 : state.currentStep,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Update target body shape (Step 8)
  Future<void> updateTargetBodyShape(BodyShape shape) async {
    state = state.copyWith(
      targetBodyShape: shape,
      currentStep: state.currentStep < 8 ? 8 : state.currentStep,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Update meal frequency (Step 9)
  Future<void> updateMealFrequency(MealFrequency frequency) async {
    state = state.copyWith(
      mealFrequency: frequency,
      currentStep: state.currentStep < 9 ? 9 : state.currentStep,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Update eating schedule (Step 10)
  Future<void> updateEatingSchedule(bool hasRegular) async {
    state = state.copyWith(
      hasRegularEatingSchedule: hasRegular,
      currentStep: state.currentStep < 10 ? 10 : state.currentStep,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Update activity level (Step 11)
  Future<void> updateActivityLevel(ActivityLevel level) async {
    state = state.copyWith(
      activityLevel: level,
      currentStep: state.currentStep < 11 ? 11 : state.currentStep,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Update workout preferences (Step 12)
  Future<void> updateWorkoutPreferences(List<WorkoutPreference> preferences) async {
    state = state.copyWith(
      workoutPreferences: preferences,
      currentStep: state.currentStep < 12 ? 12 : state.currentStep,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Update workout location (Step 13)
  Future<void> updateWorkoutLocation(WorkoutLocation location) async {
    state = state.copyWith(
      workoutLocation: location,
      currentStep: state.currentStep < 13 ? 13 : state.currentStep,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Update available equipment (Step 14)
  Future<void> updateAvailableEquipment(List<Equipment> equipment) async {
    state = state.copyWith(
      availableEquipment: equipment,
      currentStep: state.currentStep < 14 ? 14 : state.currentStep,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Update avoid areas (Step 15)
  Future<void> updateAvoidAreas(List<String> areas) async {
    state = state.copyWith(
      avoidAreas: areas,
      currentStep: state.currentStep < 15 ? 15 : state.currentStep,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Complete the form
  Future<void> completeForm() async {
    state = state.copyWith(
      currentStep: 15,
      updatedAt: DateTime.now(),
    );
    await _saveUserProfile();
  }

  /// Reset form data
  Future<void> resetForm() async {
    state = const UserProfile(); // Default currentStep is now 1
    final storage = ref.read(localStorageServiceProviderProvider.notifier);
    await storage.remove(_userProfileKey);
    await storage.remove(_formProgressKey);
  }

  /// Get route for current step (used for navigation after loading)
  String getNextStepRoute() {
    return _getStepRoute(state.currentStep);
  }

  /// Force sync currentStep with actual step number
  Future<void> syncCurrentStep(int actualStepNumber) async {
    if (state.currentStep != actualStepNumber) {
      print('DEBUG: syncCurrentStep() - syncing from ${state.currentStep} to $actualStepNumber');
      state = state.copyWith(
        currentStep: actualStepNumber,
        updatedAt: DateTime.now(),
      );
      await _saveUserProfile();
    }
  }

  /// Get route for a specific step number
  String _getStepRoute(int stepNumber) {
    // stepNumber is 1-based to match UI stepNumber
    switch (stepNumber) {
      case 1:
        return '/form/current-weight';
      case 2:
        return '/form/target-weight';
      case 3:
        return '/form/previous-attempts';
      case 4:
        return '/form/birth-year';
      case 5:
        return '/form/height';
      case 6:
        return '/form/target-areas';
      case 7:
        return '/form/current-body-shape';
      case 8:
        return '/form/target-body-shape';
      case 9:
        return '/form/meal-frequency';
      case 10:
        return '/form/eating-schedule';
      case 11:
        return '/form/activity-level';
      case 12:
        return '/form/workout-preferences';
      case 13:
        return '/form/workout-location';
      case 14:
        return '/form/available-equipment';
      case 15:
        return '/form/avoid-areas';
      default:
        return '/form/summary'; // Form completed
    }
  }

  /// Check if form is completed
  bool get isFormCompleted => state.currentStep > 15;

  /// Get completion percentage
  double get completionPercentage => (state.currentStep / 15.0).clamp(0.0, 1.0);

  /// Move to next step and return the route
  Future<String> moveToNextStep() async {
    final currentStep = state.currentStep;
    final nextStep = currentStep + 1;
    
    print('DEBUG: moveToNextStep() - currentStep: $currentStep -> nextStep: $nextStep');
    
    // Update state immediately
    state = state.copyWith(
      currentStep: nextStep,
      updatedAt: DateTime.now(),
    );
    
    final route = _getStepRoute(nextStep);
    print('DEBUG: moveToNextStep() - route: $route');
    print('DEBUG: moveToNextStep() - new currentStep: ${state.currentStep}');
    
    // Save after getting route
    await _saveUserProfile();
    
    return route;
  }

  /// Move to previous step and return the route
  Future<String> moveToPreviousStep() async {
    final currentStep = state.currentStep;
    print('DEBUG: moveToPreviousStep() - currentStep: $currentStep');
    
    if (currentStep > 1) {
      final previousStep = currentStep - 1;
      print('DEBUG: moveToPreviousStep() - previousStep: $previousStep');
      
      state = state.copyWith(
        currentStep: previousStep,
        updatedAt: DateTime.now(),
      );
      await _saveUserProfile();
      
      final route = _getStepRoute(previousStep);
      print('DEBUG: moveToPreviousStep() - route: $route');
      
      return route;
    } else {
      print('DEBUG: moveToPreviousStep() - going to intro');
      return '/intro'; // Go back to intro if at first step
    }
  }

}
