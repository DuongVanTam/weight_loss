import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../shared/styles/app_spacing.dart';
import 'base_form_page.dart';

// Provider to manage target weight selection state
final targetWeightSelectionProvider = StateProvider<int>((ref) => 60);

class TargetWeightPage extends BaseFormPage {
  const TargetWeightPage({super.key});

  @override
  String get title => 'Cân nặng mục tiêu?';

  @override
  String get subtitle => 'Bạn muốn đạt được cân nặng bao nhiêu?';

  @override
  int get stepNumber => 3;

  /// Calculate weight change percentage
  double _calculateWeightChangePercentage(double? currentWeight, int targetWeight) {
    if (currentWeight == null || currentWeight <= 0) return 0.0;
    return ((currentWeight - targetWeight) / currentWeight * 100);
  }

  /// Get goal difficulty assessment
  String _getGoalDifficulty(double changePercentage) {
    final absChange = changePercentage.abs();
    if (absChange <= 5) return 'Dễ đạt được';
    if (absChange <= 15) return 'Có thể đạt được';
    return 'Mục tiêu thách thức';
  }

  /// Get goal difficulty color
  Color _getGoalDifficultyColor(double changePercentage) {
    final absChange = changePercentage.abs();
    if (absChange <= 5) return AppColors.success;
    if (absChange <= 15) return AppColors.warning;
    return AppColors.danger;
  }

  /// Get weight change description
  String _getWeightChangeDescription(double changePercentage) {
    if (changePercentage > 0) {
      return 'Bạn sẽ giảm ${changePercentage.abs().toStringAsFixed(1)}% cân nặng';
    } else if (changePercentage < 0) {
      return 'Bạn sẽ tăng ${changePercentage.abs().toStringAsFixed(1)}% cân nặng';
    } else {
      return 'Bạn sẽ duy trì cân nặng hiện tại';
    }
  }

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    final selectedTargetWeight = ref.watch(targetWeightSelectionProvider);
    final userProfile = ref.watch(userFormServiceProvider);
    final currentWeight = userProfile.currentWeight;
    
    final changePercentage = _calculateWeightChangePercentage(currentWeight, selectedTargetWeight);
    final goalDifficulty = _getGoalDifficulty(changePercentage);
    final goalColor = _getGoalDifficultyColor(changePercentage);
    final changeDescription = _getWeightChangeDescription(changePercentage);

    return Column(
      children: [
        const Spacer(flex: 1),
        
        // Target weight picker with premium design
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.gray300.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Stack(
            children: [
              // Horizontal target weight picker using PageView
              PageView.builder(
                controller: PageController(
                  initialPage: selectedTargetWeight - 30, // Integer increment
                  viewportFraction: 0.2, // Show 5 items at once
                ),
                onPageChanged: (index) {
                  final weight = 30 + index;
                  ref.read(targetWeightSelectionProvider.notifier).state = weight;
                },
                itemCount: 171, // 30-200 kg with 1 kg increments
                itemBuilder: (context, index) {
                  final weight = 30 + index;
                  final isSelected = weight == selectedTargetWeight;
                  
                  return Container(
                    alignment: Alignment.center,
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 200),
                      style: isSelected
                          ? AppTypography.statsNumber.copyWith(
                              fontSize: 48,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            )
                          : AppTypography.titleLarge.copyWith(
                              color: AppColors.gray400,
                              fontWeight: FontWeight.w500,
                            ),
                      child: Text('$weight'),
                    ),
                  );
                },
              ),
              
              // Selection indicator overlay
              Positioned.fill(
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2, // Match viewport fraction
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        vertical: BorderSide(
                          color: AppColors.primary.withOpacity(0.2),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: AppSpacing.m),
        
        // Unit label
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.l,
            vertical: AppSpacing.s,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryLight.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'kg',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        
        const SizedBox(height: AppSpacing.xl),
        
        // Weight Change Information Card
        if (currentWeight != null && currentWeight > 0) ...[
          Container(
            padding: const EdgeInsets.all(AppSpacing.l),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: goalColor.withOpacity(0.2),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.gray200.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Mục tiêu của bạn',
                  style: AppTypography.titleMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.s),
                Text(
                  changeDescription,
                  style: AppTypography.titleLarge.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.m),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _getGoalIcon(changePercentage),
                      color: goalColor,
                      size: 24,
                    ),
                    const SizedBox(width: AppSpacing.s),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.m,
                        vertical: AppSpacing.s,
                      ),
                      decoration: BoxDecoration(
                        color: goalColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        goalDifficulty,
                        style: AppTypography.labelLarge.copyWith(
                          color: goalColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.s),
                Text(
                  'Từ ${currentWeight.toInt()}kg → ${selectedTargetWeight}kg',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
        
        const Spacer(flex: 2),
      ],
    );
  }

  /// Get appropriate icon for goal difficulty
  IconData _getGoalIcon(double changePercentage) {
    final absChange = changePercentage.abs();
    if (absChange <= 5) return Icons.sentiment_satisfied;
    if (absChange <= 15) return Icons.sentiment_neutral;
    return Icons.sentiment_very_dissatisfied;
  }

  @override
  bool isContinueEnabled(WidgetRef ref) {
    return true; // Target weight is always selected (has default value)
  }

  @override
  Future<void> onContinue(BuildContext context, WidgetRef ref) async {
    final service = ref.read(userFormServiceProvider.notifier);
    final selectedTargetWeight = ref.read(targetWeightSelectionProvider);
    
    // Save target weight data
    await service.updateTargetWeight(selectedTargetWeight.toDouble());
    
    // Navigate to next step
    final nextRoute = await service.moveToNextStep();
    context.go(nextRoute);
  }
}
