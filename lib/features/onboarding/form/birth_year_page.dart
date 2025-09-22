import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../shared/styles/app_spacing.dart';
import 'base_form_page.dart';

// Provider to manage birth year selection state
final birthYearSelectionProvider = StateProvider<int>((ref) => 1990);

class BirthYearPage extends BaseFormPage {
  const BirthYearPage({super.key});

  @override
  String get title => 'Năm sinh của bạn?';

  @override
  String get subtitle => 'Tuổi tác giúp chúng tôi tính toán chính xác hơn.';

  @override
  int get stepNumber => 5;

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    final selectedYear = ref.watch(birthYearSelectionProvider);
    final currentYear = DateTime.now().year;
    final minYear = 1930;
    final maxYear = currentYear - 13; // Minimum age 13
    
    return Column(
      children: [
        const Spacer(flex: 1),
        
        // Birth year picker with premium design
        Container(
          height: 300,
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
              // Birth year picker
              ListWheelScrollView(
                itemExtent: 60,
                perspective: 0.003,
                diameterRatio: 2.0,
                physics: const FixedExtentScrollPhysics(),
                controller: FixedExtentScrollController(
                  initialItem: selectedYear - minYear, // Start at selected year
                ),
                onSelectedItemChanged: (index) {
                  final newYear = minYear + index;
                  if (newYear <= maxYear) {
                    ref.read(birthYearSelectionProvider.notifier).state = newYear;
                  }
                },
                children: List.generate(maxYear - minYear + 1, (index) {
                  final year = minYear + index;
                  final isSelected = year == selectedYear;
                  final age = currentYear - year;
                  
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedDefaultTextStyle(
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
                          child: Text('$year'),
                        ),
                        if (isSelected)
                          Text(
                            '$age tuổi',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.primary.withOpacity(0.7),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ),
              
              // Selection indicator overlay
              Positioned.fill(
                child: Center(
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
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
        
        const SizedBox(height: AppSpacing.l),
        
        // Age display
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
            '${currentYear - selectedYear} tuổi',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        
        const Spacer(flex: 2),
      ],
    );
  }

  @override
  bool isContinueEnabled(WidgetRef ref) {
    return true; // Birth year is always selected (has default value)
  }

  @override
  Future<void> onContinue(BuildContext context, WidgetRef ref) async {
    final service = ref.read(userFormServiceProvider.notifier);
    final selectedYear = ref.read(birthYearSelectionProvider);
    
    // Save birth year data
    await service.updateBirthYear(selectedYear);
    
    // Navigate to next step
    final nextRoute = await service.moveToNextStep();
    context.go(nextRoute);
  }
}
