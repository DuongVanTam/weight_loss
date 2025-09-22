import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../shared/styles/app_spacing.dart';
import 'base_form_page.dart';

// Provider to manage weight selection state
final currentWeightSelectionProvider = StateProvider<int>((ref) => 70);

class CurrentWeightPage extends BaseFormPage {
  const CurrentWeightPage({super.key});

  @override
  String get title => 'Cân nặng hiện tại của bạn?';

  @override
  String get subtitle => 'Hãy cho chúng tôi biết cân nặng hiện tại để tạo kế hoạch phù hợp.';

  @override
  int get stepNumber => 2;

  /// Calculate BMI from height and weight
  double _calculateBMI(double? height, int weight) {
    if (height == null || height <= 0) return 0.0;
    final heightInMeters = height / 100; // Convert cm to meters
    return weight / (heightInMeters * heightInMeters);
  }

  /// Get BMI category
  String _getBMICategory(double bmi) {
    if (bmi < 18.5) return 'Thiếu cân';
    if (bmi < 25.0) return 'Bình thường';
    if (bmi < 30.0) return 'Thừa cân';
    return 'Béo phì';
  }

  /// Get BMI category color
  Color _getBMIColor(double bmi) {
    if (bmi < 18.5) return AppColors.warning;
    if (bmi < 25.0) return AppColors.success;
    if (bmi < 30.0) return AppColors.warning;
    return AppColors.danger;
  }

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    final selectedWeight = ref.watch(currentWeightSelectionProvider);
    final userProfile = ref.watch(userFormServiceProvider);
    final height = userProfile.height;
    
    final bmi = _calculateBMI(height, selectedWeight);
    final bmiCategory = _getBMICategory(bmi);
    final bmiColor = _getBMIColor(bmi);

    return Column(
      children: [
        const Spacer(flex: 1),
        
        // Weight picker with premium design
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
              // Horizontal weight picker using PageView
              PageView.builder(
                controller: PageController(
                  initialPage: selectedWeight - 30, // Integer increment
                  viewportFraction: 0.2, // Show 5 items at once
                ),
                onPageChanged: (index) {
                  final weight = 30 + index;
                  ref.read(currentWeightSelectionProvider.notifier).state = weight;
                },
                itemCount: 171, // 30-200 kg with 1 kg increments
                itemBuilder: (context, index) {
                  final weight = 30 + index;
                  final isSelected = weight == selectedWeight;
                  
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
        
        // BMI Information Card
        if (height != null && height > 0) ...[
          Container(
            padding: const EdgeInsets.all(AppSpacing.l),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: bmiColor.withOpacity(0.2),
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
                  'Chỉ số BMI',
                  style: AppTypography.titleMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.s),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      bmi.toStringAsFixed(1),
                      style: AppTypography.statsNumber.copyWith(
                        fontSize: 36,
                        color: bmiColor,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.s),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.m,
                        vertical: AppSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: bmiColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        bmiCategory,
                        style: AppTypography.labelMedium.copyWith(
                          color: bmiColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.s),
                Text(
                  'Dựa trên chiều cao ${height.toInt()}cm',
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

  @override
  bool isContinueEnabled(WidgetRef ref) {
    return true; // Weight is always selected (has default value)
  }

  @override
  Future<void> onContinue(BuildContext context, WidgetRef ref) async {
    final service = ref.read(userFormServiceProvider.notifier);
    final selectedWeight = ref.read(currentWeightSelectionProvider);
    
    // Save weight data
    await service.updateCurrentWeight(selectedWeight.toDouble());
    
    // Navigate to next step
    final nextRoute = await service.moveToNextStep();
    context.go(nextRoute);
  }
}
