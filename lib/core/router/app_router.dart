import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/_demo/theme_preview_page.dart';
import '../../features/onboarding/splash_page.dart';
import '../../features/onboarding/intro_page.dart';
import '../../features/onboarding/onboarding_page.dart';
import '../../features/dashboard/dashboard_page.dart';
import '../../features/auth/auth_page.dart';

/// Application router configuration using GoRouter
class AppRouter {
  static const String splash = '/';
  static const String intro = '/intro';
  static const String onboarding = '/onboarding';
  static const String dashboard = '/dashboard';
  static const String auth = '/auth';
  static const String themePreview = '/theme-preview';

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
