import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../shared/styles/app_spacing.dart';
import 'base_form_page.dart';

class MealFrequencyPage extends BaseFormPage {
  const MealFrequencyPage({super.key});

  @override
  String get title => 'Bạn thường ăn mấy bữa/ngày?';

  @override
  String get subtitle => 'Thói quen ăn uống hiện tại của bạn như thế nào?';

  @override
  int get stepNumber => 9;

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userFormServiceProvider);
    final selectedFrequency = userProfile.mealFrequency;

    final mealOptions = [
      _MealOption(
        frequency: 1,
        title: '1 bữa/ngày',
        subtitle: 'Intermittent Fasting cực kỳ',
        icon: Icons.restaurant,
        color: AppColors.warning,
      ),
      _MealOption(
        frequency: 2,
        title: '2 bữa/ngày',
        subtitle: 'Intermittent Fasting 16:8',
        icon: Icons.restaurant_menu,
        color: AppColors.secondary,
      ),
      _MealOption(
        frequency: 3,
        title: '3 bữa/ngày',
        subtitle: 'Sáng - Trưa - Tối (phổ biến)',
        icon: Icons.dining,
        color: AppColors.primary,
      ),
      _MealOption(
        frequency: 4,
        title: '4-5 bữa/ngày',
        subtitle: '3 bữa chính + 1-2 bữa phụ',
        icon: Icons.local_dining,
        color: AppColors.success,
      ),
      _MealOption(
        frequency: 6,
        title: '6+ bữa/ngày',
        subtitle: 'Ăn nhiều bữa nhỏ',
        icon: Icons.bakery_dining,
        color: AppColors.primaryLight,
      ),
    ];

    return Column(
      children: [
        // Helpful tip
        Container(
          padding: AppSpacing.paddingM,
          decoration: BoxDecoration(
            color: AppColors.primaryLight.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primaryLight.withValues(alpha: 0.3)),
          ),
          child: Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: AppColors.primary,
                size: 20,
              ),
              AppSpacing.horizontalS,
              Expanded(
                child: Text(
                  'Chọn số bữa ăn phù hợp với lối sống hiện tại của bạn',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        
        AppSpacing.verticalL,
        
        // Meal frequency options
        Expanded(
          child: ListView.separated(
            itemCount: mealOptions.length,
            separatorBuilder: (context, index) => AppSpacing.verticalM,
            itemBuilder: (context, index) {
              final option = mealOptions[index];
              final isSelected = selectedFrequency == option.frequency;
              
              return _MealFrequencyCard(
                option: option,
                isSelected: isSelected,
                onTap: () {
                  final service = ref.read(userFormServiceProvider.notifier);
                  service.updateMealFrequency(option.frequency);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  bool isContinueEnabled(WidgetRef ref) {
    final userProfile = ref.watch(userFormServiceProvider);
    return userProfile.mealFrequency != null;
  }

  @override
  Future<void> onContinue(BuildContext context, WidgetRef ref) async {
    final service = ref.read(userFormServiceProvider.notifier);
    final nextRoute = await service.moveToNextStep();
    context.go(nextRoute);
  }
}

class _MealOption {
  final int frequency;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _MealOption({
    required this.frequency,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}

class _MealFrequencyCard extends StatelessWidget {
  final _MealOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const _MealFrequencyCard({
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: AppSpacing.paddingM,
        decoration: BoxDecoration(
          color: isSelected ? option.color.withValues(alpha: 0.1) : AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? option.color : AppColors.borderLight,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: option.color.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: option.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                option.icon,
                color: option.color,
                size: 28,
              ),
            ),
            
            AppSpacing.horizontalM,
            
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.title,
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppSpacing.verticalXs,
                  Text(
                    option.subtitle,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            
            // Selection indicator
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? option.color : Colors.transparent,
                border: Border.all(
                  color: isSelected ? option.color : AppColors.gray300,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
