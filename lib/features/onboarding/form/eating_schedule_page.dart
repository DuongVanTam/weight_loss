import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../shared/styles/app_spacing.dart';
import 'base_form_page.dart';

enum EatingScheduleType {
  regular,
  irregular,
  skipMeals,
  lateEater,
}

class EatingSchedulePage extends BaseFormPage {
  const EatingSchedulePage({super.key});

  @override
  String get title => 'Bạn có thường ăn đúng giờ không?';

  @override
  String get subtitle => 'Việc ăn đúng giờ giúp cải thiện quá trình trao đổi chất.';

  @override
  int get stepNumber => 10;

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userFormServiceProvider);
    final selectedSchedule = userProfile.eatingSchedule;

    final scheduleOptions = [
      _ScheduleOption(
        type: EatingScheduleType.regular,
        title: 'Rất đúng giờ',
        subtitle: 'Tôi luôn ăn đúng giờ mỗi ngày',
        description: 'Sáng 7h, Trưa 12h, Tối 18h',
        icon: Icons.schedule,
        color: AppColors.success,
        timeSlots: ['07:00', '12:00', '18:00'],
      ),
      _ScheduleOption(
        type: EatingScheduleType.irregular,
        title: 'Không thường xuyên',
        subtitle: 'Tôi ăn tùy theo công việc và hoàn cảnh',
        description: 'Giờ ăn thay đổi hàng ngày',
        icon: Icons.access_time,
        color: AppColors.warning,
        timeSlots: ['??:??', '??:??', '??:??'],
      ),
      _ScheduleOption(
        type: EatingScheduleType.skipMeals,
        title: 'Thường bỏ bữa',
        subtitle: 'Tôi hay quên ăn hoặc cố tình bỏ bữa',
        description: 'Thường bỏ bữa sáng hoặc trưa',
        icon: Icons.no_meals,
        color: AppColors.danger,
        timeSlots: ['--:--', '12:00', '18:00'],
      ),
      _ScheduleOption(
        type: EatingScheduleType.lateEater,
        title: 'Ăn muộn',
        subtitle: 'Tôi thường ăn muộn hơn mọi người',
        description: 'Bữa tối sau 20h',
        icon: Icons.nightlight_round,
        color: AppColors.secondary,
        timeSlots: ['09:00', '14:00', '21:00'],
      ),
    ];

    return Column(
      children: [
        // Health tip
        Container(
          padding: AppSpacing.paddingM,
          decoration: BoxDecoration(
            color: AppColors.success.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
          ),
          child: Row(
            children: [
              Icon(
                Icons.health_and_safety_outlined,
                color: AppColors.success,
                size: 20,
              ),
              AppSpacing.horizontalS,
              Expanded(
                child: Text(
                  'Ăn đúng giờ giúp cơ thể duy trì nhịp sinh học tự nhiên',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.success,
                  ),
                ),
              ),
            ],
          ),
        ),
        
        AppSpacing.verticalL,
        
        // Schedule options
        Expanded(
          child: ListView.separated(
            itemCount: scheduleOptions.length,
            separatorBuilder: (context, index) => AppSpacing.verticalM,
            itemBuilder: (context, index) {
              final option = scheduleOptions[index];
              final isSelected = selectedSchedule == option.type.name;
              
              return _EatingScheduleCard(
                option: option,
                isSelected: isSelected,
                onTap: () {
                  final service = ref.read(userFormServiceProvider.notifier);
                  service.updateEatingSchedule(option.type.name);
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
    return userProfile.eatingSchedule != null;
  }

  @override
  Future<void> onContinue(BuildContext context, WidgetRef ref) async {
    final service = ref.read(userFormServiceProvider.notifier);
    final nextRoute = await service.moveToNextStep();
    context.go(nextRoute);
  }
}

class _ScheduleOption {
  final EatingScheduleType type;
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color color;
  final List<String> timeSlots;

  const _ScheduleOption({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.color,
    required this.timeSlots,
  });
}

class _EatingScheduleCard extends StatelessWidget {
  final _ScheduleOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const _EatingScheduleCard({
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
            
            // Time slots visualization
            Container(
              padding: AppSpacing.paddingS,
              decoration: BoxDecoration(
                color: option.color.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.description,
                    style: AppTypography.bodySmall.copyWith(
                      color: option.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppSpacing.verticalS,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: option.timeSlots.map((time) => _TimeSlot(
                      time: time,
                      color: option.color,
                      isActive: !time.contains('--') && !time.contains('??'),
                    )).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeSlot extends StatelessWidget {
  final String time;
  final Color color;
  final bool isActive;

  const _TimeSlot({
    required this.time,
    required this.color,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? color.withValues(alpha: 0.1) : AppColors.gray100,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isActive ? color.withValues(alpha: 0.3) : AppColors.gray300,
        ),
      ),
      child: Text(
        time,
        style: AppTypography.bodySmall.copyWith(
          color: isActive ? color : AppColors.textSecondary,
          fontWeight: FontWeight.w500,
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}
