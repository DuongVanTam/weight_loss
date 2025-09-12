import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/services/local_storage_service.dart';
import '../../core/router/app_router.dart';
import '../../core/constants/app_constants.dart';

/// Splash screen with woman background image and LOOSE WEIGHT text
/// Shows for 2 seconds with slide + fade animations
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with TickerProviderStateMixin {
  late AnimationController _slideAnimationController;
  late AnimationController _progressAnimationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimationSequence();
  }

  void _initializeAnimations() {
    // Slide + Fade animation controller (800ms)
    _slideAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Progress animation controller (2 seconds)
    _progressAnimationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Slide animation from top to bottom
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -2.0), // Start from further top
      end: Offset.zero, // End at normal position
    ).animate(CurvedAnimation(
      parent: _slideAnimationController,
      curve: Curves.easeOutBack, // More dramatic easing
    ));

    // Fade animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _slideAnimationController,
      curve: const Interval(0.0, 0.8, curve: Curves.easeIn), // Start fade earlier
    ));

    // Progress animation
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _progressAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  Future<void> _startAnimationSequence() async {
    // Start slide + fade animation immediately
    await _slideAnimationController.forward();
    
    // Wait a bit then start progress animation
    await Future.delayed(const Duration(milliseconds: 200));
    
    // Start progress animation and wait for it to complete
    await _progressAnimationController.forward();
    
    if (!mounted) return;
    _determineNavigationRoute();
  }

  void _determineNavigationRoute() {
    final bool hasProfile = LocalStorageService.hasUserProfile();
    final bool hasSeenIntro = LocalStorageService.hasSeenIntro();

    if (hasProfile) {
      // User has completed setup, go to dashboard
      context.go(AppRouter.dashboard);
    } else if (hasSeenIntro) {
      // User has seen intro but hasn't completed setup
      context.go(AppRouter.onboarding);
    } else {
      // First time user, show intro
      context.go(AppRouter.intro);
    }
  }

  @override
  void dispose() {
    _slideAnimationController.dispose();
    _progressAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_bg.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              // Bottom content with slide + fade animation
              AnimatedBuilder(
                animation: Listenable.merge([_slideAnimationController, _progressAnimationController]),
                builder: (context, child) {
                  return SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppConstants.spacingL),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // LOOSE WEIGHT text
                            Text(
                              'LOOSE WEIGHT',
                              style: GoogleFonts.poppins(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            
                            const SizedBox(height: AppConstants.spacingL),
                            
                            // Linear Progress Indicator
                            Container(
                              width: double.infinity,
                              height: 4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.white.withValues(alpha: 0.3),
                              ),
                              child: AnimatedBuilder(
                                animation: _progressAnimation,
                                builder: (context, child) {
                                  return LinearProgressIndicator(
                                    value: _progressAnimation.value,
                                    backgroundColor: Colors.transparent,
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                      Color(0xFF4ECDC4), // Brand primary color
                                    ),
                                    borderRadius: BorderRadius.circular(2),
                                  );
                                },
                              ),
                            ),
                            
                            const SizedBox(height: AppConstants.spacingXl),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

