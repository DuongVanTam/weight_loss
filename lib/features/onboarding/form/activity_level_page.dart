import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import '../../../core/models/user_profile.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../shared/styles/app_spacing.dart';
import 'base_form_page.dart';

class ActivityLevelPage extends BaseFormPage {
  const ActivityLevelPage({super.key});

  @override
  String get title => 'Mức độ vận động hàng ngày?';

  @override
  String get subtitle => 'Hãy chọn mức độ phù hợp với hoạt động thường ngày của bạn.';

  @override
  int get stepNumber => 11;

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userFormServiceProvider);
    final selectedLevel = userProfile.activityLevel;

    final activityOptions = [
      _ActivityOption(
        level: ActivityLevel.sedentary,
        title: 'Ít vận động',
        subtitle: 'Tôi chủ yếu ngồi làm việc, ít hoạt động thể chất',
        description: 'Văn phòng, học sinh, công việc ít vận động',
        examples: ['Ngồi máy tính 6-8 tiếng/ngày', 'Ít đi bộ', 'Không tập thể dục thường xuyên'],
        icon: Icons.chair_outlined,
        color: AppColors.danger,
        calorieMultiplier: 1.2,
        weeklyExerciseHours: '< 1 giờ',
      ),
      _ActivityOption(
        level: ActivityLevel.light,
        title: 'Vận động nhẹ',
        subtitle: 'Tôi có một chút hoạt động thể chất trong ngày',
        description: 'Đi bộ, làm việc nhà, tập thể dục nhẹ',
        examples: ['Đi bộ 30 phút/ngày', 'Làm việc nhà thường xuyên', 'Tập thể dục 1-2 lần/tuần'],
        icon: Icons.directions_walk,
        color: AppColors.warning,
        calorieMultiplier: 1.375,
        weeklyExerciseHours: '1-3 giờ',
      ),
      _ActivityOption(
        level: ActivityLevel.moderate,
        title: 'Vừa phải',
        subtitle: 'Tôi tập thể dục đều đặn và có hoạt động thể chất tốt',
        description: 'Tập gym, chạy bộ, thể thao nhóm',
        examples: ['Tập gym 3-4 lần/tuần', 'Chạy bộ thường xuyên', 'Chơi thể thao cuối tuần'],
        icon: Icons.fitness_center,
        color: AppColors.primary,
        calorieMultiplier: 1.55,
        weeklyExerciseHours: '3-5 giờ',
      ),
      _ActivityOption(
        level: ActivityLevel.active,
        title: 'Năng động',
        subtitle: 'Tôi rất tích cực trong hoạt động thể chất',
        description: 'Vận động viên, huấn luyện viên, công việc thể lực',
        examples: ['Tập luyện hằng ngày', 'Thi đấu thể thao', 'Công việc đòi hỏi thể lực cao'],
        icon: Icons.sports_gymnastics,
        color: AppColors.success,
        calorieMultiplier: 1.725,
        weeklyExerciseHours: '> 5 giờ',
      ),
    ];

    return Column(
      children: [
        // Health tip
        Container(
          padding: AppSpacing.paddingM,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: AppColors.primary,
                size: 20,
              ),
              AppSpacing.horizontalS,
              Expanded(
                child: Text(
                  'Thông tin này giúp tính toán lượng calo cần thiết cho mục tiêu của bạn',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        
        AppSpacing.verticalL,
        
        // Activity level options
        Expanded(
          child: ListView.separated(
            itemCount: activityOptions.length,
            separatorBuilder: (context, index) => AppSpacing.verticalM,
            itemBuilder: (context, index) {
              final option = activityOptions[index];
              final isSelected = selectedLevel == option.level;
              
              return _ActivityLevelCard(
                option: option,
                isSelected: isSelected,
                onTap: () {
                  final service = ref.read(userFormServiceProvider.notifier);
                  service.updateActivityLevel(option.level);
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
    return userProfile.activityLevel != null;
  }

  @override
  Future<void> onContinue(BuildContext context, WidgetRef ref) async {
    final service = ref.read(userFormServiceProvider.notifier);
    final nextRoute = await service.moveToNextStep();
    if (context.mounted) {
      context.go(nextRoute);
    }
  }
}

class _ActivityOption {
  final ActivityLevel level;
  final String title;
  final String subtitle;
  final String description;
  final List<String> examples;
  final IconData icon;
  final Color color;
  final double calorieMultiplier;
  final String weeklyExerciseHours;

  const _ActivityOption({
    required this.level,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.examples,
    required this.icon,
    required this.color,
    required this.calorieMultiplier,
    required this.weeklyExerciseHours,
  });
}

class _ActivityLevelCard extends StatelessWidget {
  final _ActivityOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const _ActivityLevelCard({
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
        child: Column(
          children: [
            Row(
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
            
            AppSpacing.verticalM,
            
            // Details section
            Container(
              padding: AppSpacing.paddingS,
              decoration: BoxDecoration(
                color: option.color.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Description
                  Text(
                    option.description,
                    style: AppTypography.bodySmall.copyWith(
                      color: option.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  
                  AppSpacing.verticalS,
                  
                  // Stats row
                  Row(
                    children: [
                      Expanded(
                        child: _StatItem(
                          label: 'Tập luyện/tuần',
                          value: option.weeklyExerciseHours,
                          color: option.color,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 32,
                        color: AppColors.gray300,
                      ),
                      Expanded(
                        child: _StatItem(
                          label: 'Hệ số calo',
                          value: '×${option.calorieMultiplier}',
                          color: option.color,
                        ),
                      ),
                    ],
                  ),
                  
                  AppSpacing.verticalS,
                  
                  // Examples
                  Text(
                    'Ví dụ:',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppSpacing.verticalXs,
                  ...option.examples.map((example) => Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• ',
                          style: AppTypography.bodySmall.copyWith(
                            color: option.color,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            example,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatItem({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppTypography.titleSmall.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppSpacing.verticalXs,
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
