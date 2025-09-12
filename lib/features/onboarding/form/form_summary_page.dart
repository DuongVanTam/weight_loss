import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import '../../../shared/widgets/primary_button.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../shared/styles/app_spacing.dart';

class FormSummaryPage extends ConsumerWidget {
  const FormSummaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userFormServiceProvider);

    return Scaffold(
      backgroundColor: AppColors.neutralBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Tóm tắt thông tin',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.l),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.xl),
                    
                    // Title
                    Text(
                      'Tuyệt vời! 🎉',
                      style: AppTypography.headlineMedium.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.s),
                    
                    // Subtitle
                    Text(
                      'Chúng tôi đã thu thập đủ thông tin để tạo kế hoạch luyện tập phù hợp với bạn.',
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.xl),
                    
                    // Summary content
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSummarySection(
                              'Thông tin cơ bản',
                              [
                                'Cân nặng hiện tại: ${userProfile.currentWeight ?? "Chưa nhập"} kg',
                                'Cân nặng mục tiêu: ${userProfile.targetWeight ?? "Chưa nhập"} kg',
                                'Năm sinh: ${userProfile.birthYear ?? "Chưa nhập"}',
                                'Chiều cao: ${userProfile.height ?? "Chưa nhập"} cm',
                              ],
                            ),
                            
                            const SizedBox(height: AppSpacing.l),
                            
                            _buildSummarySection(
                              'Thói quen ăn uống',
                              [
                                'Số bữa ăn: ${userProfile.mealFrequency?.displayName ?? "Chưa chọn"}',
                                'Ăn đúng giờ: ${userProfile.hasRegularEatingSchedule == true ? "Có" : userProfile.hasRegularEatingSchedule == false ? "Không" : "Chưa chọn"}',
                              ],
                            ),
                            
                            const SizedBox(height: AppSpacing.l),
                            
                            _buildSummarySection(
                              'Luyện tập',
                              [
                                'Mức độ vận động: ${userProfile.activityLevel?.displayName ?? "Chưa chọn"}',
                                'Địa điểm tập: ${userProfile.workoutLocation?.displayName ?? "Chưa chọn"}',
                                'Sở thích: ${userProfile.workoutPreferences.map((e) => e.displayName).join(", ")}',
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Action buttons
            Padding(
              padding: const EdgeInsets.all(AppSpacing.l),
              child: Column(
                children: [
                  PrimaryButton(
                    text: 'Tạo kế hoạch luyện tập',
                    onPressed: () => _createWorkoutPlan(context, ref),
                  ),
                  
                  const SizedBox(height: AppSpacing.s),
                  
                  TextButton(
                    onPressed: () => _editForm(context),
                    child: Text(
                      'Chỉnh sửa thông tin',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummarySection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.titleMedium.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        
        const SizedBox(height: AppSpacing.s),
        
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xs),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: AppSpacing.s),
              Expanded(
                child: Text(
                  item,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  void _createWorkoutPlan(BuildContext context, WidgetRef ref) {
    // Complete the form and navigate to dashboard
    ref.read(userFormServiceProvider.notifier).completeForm();
    context.go('/dashboard');
  }

  void _editForm(BuildContext context) {
    // Go back to first incomplete step
    context.go('/form/current-weight');
  }
}
