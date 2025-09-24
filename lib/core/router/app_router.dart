import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/_demo/theme_preview_page.dart';
import '../../features/onboarding/splash_page.dart';
import '../../features/onboarding/intro_page.dart';
import '../../features/onboarding/onboarding_page.dart';
import '../../features/dashboard/dashboard_page.dart';
import '../../features/auth/auth_page.dart';
// Form pages
import '../../features/onboarding/form/current_weight_page.dart';
import '../../features/onboarding/form/target_weight_page.dart';
import '../../features/onboarding/form/previous_attempts_page.dart';
import '../../features/onboarding/form/birth_year_page.dart';
import '../../features/onboarding/form/height_page.dart';
import '../../features/onboarding/form/target_areas_page.dart';
import '../../features/onboarding/form/current_body_shape_page.dart';
import '../../features/onboarding/form/target_body_shape_page.dart';
import '../../features/onboarding/form/meal_frequency_page.dart';
import '../../features/onboarding/form/eating_schedule_page.dart';
import '../../features/onboarding/form/activity_level_page.dart';
import '../../features/onboarding/form/form_summary_page.dart';

/// Application router configuration using GoRouter
class AppRouter {
  static const String splash = '/';
  static const String intro = '/intro';
  static const String onboarding = '/onboarding';
  static const String dashboard = '/dashboard';
  static const String auth = '/auth';
  static const String themePreview = '/theme-preview';
  
  // Form routes
  static const String formCurrentWeight = '/form/current-weight';
  static const String formTargetWeight = '/form/target-weight';
  static const String formPreviousAttempts = '/form/previous-attempts';
  static const String formBirthYear = '/form/birth-year';
  static const String formHeight = '/form/height';
  static const String formTargetAreas = '/form/target-areas';
  static const String formCurrentBodyShape = '/form/current-body-shape';
  static const String formTargetBodyShape = '/form/target-body-shape';
  static const String formMealFrequency = '/form/meal-frequency';
  static const String formEatingSchedule = '/form/eating-schedule';
  static const String formActivityLevel = '/form/activity-level';
  static const String formSummary = '/form/summary';

  static final GoRouter _router = GoRouter(
    initialLocation: splash, // Start with splash screen
    debugLogDiagnostics: true,
    routes: [
      // Splash Screen
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),

      // Intro/Onboarding Flow
      GoRoute(
        path: intro,
        name: 'intro',
        builder: (context, state) => const IntroPage(),
      ),

      GoRoute(
        path: onboarding,
        name: 'onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),

      // Main Dashboard
      GoRoute(
        path: dashboard,
        name: 'dashboard',
        builder: (context, state) => const DashboardPage(),
      ),

      // Authentication
      GoRoute(
        path: auth,
        name: 'auth',
        builder: (context, state) => const AuthPage(),
      ),

      // Theme Preview (Development only)
      GoRoute(
        path: themePreview,
        name: 'theme-preview',
        builder: (context, state) => const ThemePreviewPage(),
      ),

      // Form routes
      GoRoute(
        path: formCurrentWeight,
        name: 'form-current-weight',
        builder: (context, state) => const CurrentWeightPage(),
      ),
      
      GoRoute(
        path: formTargetWeight,
        name: 'form-target-weight',
        builder: (context, state) => const TargetWeightPage(),
      ),
      
      GoRoute(
        path: formPreviousAttempts,
        name: 'form-previous-attempts',
        builder: (context, state) => const PreviousAttemptsPage(),
      ),
      
      GoRoute(
        path: formBirthYear,
        name: 'form-birth-year',
        builder: (context, state) => const BirthYearPage(),
      ),
      
      GoRoute(
        path: formHeight,
        name: 'form-height',
        builder: (context, state) => const HeightPage(),
      ),
      
      GoRoute(
        path: formTargetAreas,
        name: 'form-target-areas',
        builder: (context, state) => const TargetAreasPage(),
      ),
      
      GoRoute(
        path: formCurrentBodyShape,
        name: 'form-current-body-shape',
        builder: (context, state) => const CurrentBodyShapePage(),
      ),
      
      GoRoute(
        path: formTargetBodyShape,
        name: 'form-target-body-shape',
        builder: (context, state) => const TargetBodyShapePage(),
      ),
      
      GoRoute(
        path: formMealFrequency,
        name: 'form-meal-frequency',
        builder: (context, state) => const MealFrequencyPage(),
      ),
      
      GoRoute(
        path: formEatingSchedule,
        name: 'form-eating-schedule',
        builder: (context, state) => const EatingSchedulePage(),
      ),
      
      GoRoute(
        path: formActivityLevel,
        name: 'form-activity-level',
        builder: (context, state) => const ActivityLevelPage(),
      ),
      
      GoRoute(
        path: formSummary,
        name: 'form-summary',
        builder: (context, state) => const FormSummaryPage(),
      ),
    ],
    
    // Error handling
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'The page "${state.uri}" could not be found.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(dashboard),
              child: const Text('Go to Dashboard'),
            ),
          ],
        ),
      ),
    ),
  );

  static GoRouter get router => _router;
}
