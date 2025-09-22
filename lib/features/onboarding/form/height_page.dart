import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../shared/styles/app_spacing.dart';
import 'base_form_page.dart';

// Provider to manage height selection state
final heightSelectionProvider = StateProvider<int>((ref) => 165);

class HeightPage extends BaseFormPage {
  const HeightPage({super.key});

  @override
  String get title => 'Chiều cao của bạn là bao nhiêu?';

  @override
  String get subtitle => 'Chiều cao giúp tính toán BMI và lượng calo cần thiết.';

  @override
  int get stepNumber => 1;

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    final selectedHeight = ref.watch(heightSelectionProvider);
    
    return Column(
      children: [
        const Spacer(flex: 1),
        
        // Height picker with premium design
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
              // Height picker
              ListWheelScrollView(
                itemExtent: 60,
                perspective: 0.003,
                diameterRatio: 2.0,
                physics: const FixedExtentScrollPhysics(),
                controller: FixedExtentScrollController(
                  initialItem: selectedHeight - 100, // Start at selected height
                ),
                onSelectedItemChanged: (index) {
                  ref.read(heightSelectionProvider.notifier).state = 100 + index;
                },
                children: List.generate(151, (index) {
                  final height = 100 + index;
                  final isSelected = height == selectedHeight;
                  
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
                      child: Text('$height'),
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
            'cm',
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
    return true; // Height is always selected (has default value)
  }

  @override
  Future<void> onContinue(BuildContext context, WidgetRef ref) async {
    final service = ref.read(userFormServiceProvider.notifier);
    final selectedHeight = ref.read(heightSelectionProvider);
    
    // Save height data
    await service.updateHeight(selectedHeight.toDouble());
    
    // Navigate to next step
    final nextRoute = await service.moveToNextStep();
    context.go(nextRoute);
  }
}
