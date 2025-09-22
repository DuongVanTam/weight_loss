import 'package:flutter/material.dart';
import '../../core/models/user_profile.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../shared/styles/app_spacing.dart';

/// Widget for selecting body shape with image slider, indicators, and description
class BodyShapeSelector extends StatefulWidget {
  const BodyShapeSelector({
    super.key,
    required this.selectedShape,
    required this.onShapeChanged,
  });

  final BodyShape? selectedShape;
  final ValueChanged<BodyShape> onShapeChanged;

  @override
  State<BodyShapeSelector> createState() => _BodyShapeSelectorState();
}

class _BodyShapeSelectorState extends State<BodyShapeSelector> {
  late PageController _pageController;
  int _currentIndex = 0;
  
  final List<BodyShape> _bodyShapes = BodyShape.values;

  @override
  void initState() {
    super.initState();
    // Initialize with selected shape or first shape
    if (widget.selectedShape != null) {
      _currentIndex = _bodyShapes.indexOf(widget.selectedShape!);
    }
    _pageController = PageController(
      initialPage: _currentIndex,
      viewportFraction: 0.7, // Show part of adjacent images
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onShapeChanged(_bodyShapes[index]);
  }

  void _goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image slider
        Expanded(
          flex: 3,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _bodyShapes.length,
            itemBuilder: (context, index) {
              final shape = _bodyShapes[index];
              final isActive = index == _currentIndex;
              
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.symmetric(
                  horizontal: AppSpacing.s,
                  vertical: isActive ? 0 : AppSpacing.m,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ]
                    : [],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: isActive
                        ? Border.all(color: AppColors.primary, width: 3)
                        : Border.all(color: AppColors.gray200, width: 1),
                    ),
                    child: Image.asset(
                      shape.imagePath,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        // Debug: Print error information
                        debugPrint('Failed to load image: ${shape.imagePath}');
                        debugPrint('Error: $error');
                        return Container(
                          color: AppColors.gray100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                size: 80,
                                color: AppColors.gray400,
                              ),
                              const SizedBox(height: AppSpacing.s),
                              Text(
                                'Hình ${shape.shapeNumber}',
                                style: AppTypography.bodyMedium.copyWith(
                                  color: AppColors.gray600,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              Text(
                                shape.imagePath,
                                style: AppTypography.bodySmall.copyWith(
                                  color: AppColors.gray500,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        
        const SizedBox(height: AppSpacing.l),
        
        // Page indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _bodyShapes.length,
            (index) => GestureDetector(
              onTap: () => _goToPage(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: index == _currentIndex ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: index == _currentIndex
                    ? AppColors.primary
                    : AppColors.gray300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
        
        const SizedBox(height: AppSpacing.l),
        
        // Description box
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.m),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _bodyShapes[_currentIndex].displayName,
                  style: AppTypography.headlineSmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Expanded(
                  child: Text(
                    _bodyShapes[_currentIndex].description,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
