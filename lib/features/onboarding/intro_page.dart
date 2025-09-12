import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/services/local_storage_service.dart';
import '../../core/router/app_router.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../core/constants/app_constants.dart';
import '../../shared/widgets/primary_button.dart';

/// Intro screen with onboarding slides
/// Shows 3-4 slides introducing the app features
class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<IntroSlide> _slides = [
    IntroSlide(
      icon: Icons.person_outline_rounded,
      title: 'Cá nhân hóa bài tập',
      description: 'Tạo kế hoạch luyện tập phù hợp với mục tiêu và thể trạng của riêng bạn',
    ),
    IntroSlide(
      icon: Icons.schedule_rounded,
      title: 'Mỗi ngày một buổi dành riêng cho bạn',
      description: 'Chỉ cần 15-30 phút mỗi ngày để có một cơ thể khỏe mạnh và vóc dáng lý tưởng',
    ),
    IntroSlide(
      icon: Icons.trending_up_rounded,
      title: 'Theo dõi tiến bộ & nhắc tập',
      description: 'Ghi lại quá trình luyện tập và nhận thông báo nhắc nhở để không bỏ lỡ buổi tập nào',
    ),
    IntroSlide(
      icon: Icons.emoji_events_rounded,
      title: 'Đạt được mục tiêu của bạn',
      description: 'Với sự kiên trì và kế hoạch phù hợp, bạn sẽ sớm có được kết quả mong muốn',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _handleSkipOrStart() async {
    // Mark intro as seen
    await LocalStorageService.setHasSeenIntro(true);
    
    if (!mounted) return;
    
    // Navigate to onboarding wizard
    context.go(AppRouter.onboarding);
  }

  void _nextPage() {
    if (_currentPage < _slides.length - 1) {
      _pageController.nextPage(
        duration: AppConstants.animationMedium,
        curve: Curves.easeInOut,
      );
    } else {
      _handleSkipOrStart();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header with skip button
            Padding(
              padding: const EdgeInsets.all(AppConstants.spacingM),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 80), // Balance the skip button
                  // Page indicator dots
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      _slides.length,
                      (index) => _buildDot(index),
                    ),
                  ),
                  // Skip button
                  TextButton(
                    onPressed: _handleSkipOrStart,
                    child: Text(
                      'Bỏ qua',
                      style: AppTypography.labelLarge.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Slides content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _slides.length,
                itemBuilder: (context, index) {
                  return _buildSlide(_slides[index]);
                },
              ),
            ),

            // Bottom navigation
            Padding(
              padding: const EdgeInsets.all(AppConstants.spacingL),
              child: Column(
                children: [
                  // Main action button
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      onPressed: _nextPage,
                      text: _currentPage == _slides.length - 1 
                          ? 'Bắt đầu' 
                          : 'Tiếp theo',
                    ),
                  ),
                  
                  if (_currentPage < _slides.length - 1) ...[
                    const SizedBox(height: AppConstants.spacingM),
                    // Previous button (only show if not on first page)
                    if (_currentPage > 0)
                      TextButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: AppConstants.animationMedium,
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          'Quay lại',
                          style: AppTypography.labelLarge.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlide(IntroSlide slide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.spacingL),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusXl),
            ),
            child: Icon(
              slide.icon,
              size: 60,
              color: AppColors.primary,
            ),
          ),
          
          const SizedBox(height: AppConstants.spacingXl),
          
          // Title
          Text(
            slide.title,
            style: AppTypography.headlineMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: AppConstants.spacingL),
          
          // Description
          Text(
            slide.description,
            style: AppTypography.bodyLarge.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    final bool isActive = index == _currentPage;
    
    return AnimatedContainer(
      duration: AppConstants.animationFast,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.gray300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

/// Data model for intro slides
class IntroSlide {
  final IconData icon;
  final String title;
  final String description;

  const IntroSlide({
    required this.icon,
    required this.title,
    required this.description,
  });
}

