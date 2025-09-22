import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../shared/styles/app_spacing.dart';
import 'base_form_page.dart';

// State provider for this page
final previousAttemptsStateProvider = StateNotifierProvider<PreviousAttemptsNotifier, PreviousAttemptsState>((ref) {
  return PreviousAttemptsNotifier();
});

// State class
class PreviousAttemptsState {
  final bool? hasPreviousAttempts;
  final String? details;
  final bool isDetailsExpanded;

  const PreviousAttemptsState({
    this.hasPreviousAttempts,
    this.details,
    this.isDetailsExpanded = false,
  });

  PreviousAttemptsState copyWith({
    bool? hasPreviousAttempts,
    String? details,
    bool? isDetailsExpanded,
  }) {
    return PreviousAttemptsState(
      hasPreviousAttempts: hasPreviousAttempts ?? this.hasPreviousAttempts,
      details: details ?? this.details,
      isDetailsExpanded: isDetailsExpanded ?? this.isDetailsExpanded,
    );
  }
}

// State notifier
class PreviousAttemptsNotifier extends StateNotifier<PreviousAttemptsState> {
  PreviousAttemptsNotifier() : super(const PreviousAttemptsState());

  void setHasPreviousAttempts(bool value) {
    state = state.copyWith(
      hasPreviousAttempts: value,
      isDetailsExpanded: value,
      // Clear details if user says no
      details: value ? state.details : null,
    );
  }

  void setDetails(String value) {
    state = state.copyWith(details: value);
  }
}

class PreviousAttemptsPage extends BaseFormPage {
  const PreviousAttemptsPage({super.key});

  @override
  String get title => 'Bạn đã từng giảm cân chưa?';

  @override
  String get subtitle => 'Thông tin này giúp chúng tôi hiểu rõ hơn về hành trình của bạn và tạo kế hoạch phù hợp.';

  @override
  int get stepNumber => 4;

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    final state = ref.watch(previousAttemptsStateProvider);
    final notifier = ref.read(previousAttemptsStateProvider.notifier);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main question with options
          _buildMainQuestion(state, notifier),
          
          const SizedBox(height: AppSpacing.xl),
          
          // Details section (shown when user selects "Yes")
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: state.isDetailsExpanded ? null : 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: state.isDetailsExpanded ? 1.0 : 0.0,
              child: state.isDetailsExpanded 
                ? _buildDetailsSection(state, notifier)
                : const SizedBox.shrink(),
            ),
          ),
          
          // Motivational message
          if (state.hasPreviousAttempts != null)
            _buildMotivationalMessage(state.hasPreviousAttempts!),
        ],
      ),
    );
  }

  Widget _buildMainQuestion(PreviousAttemptsState state, PreviousAttemptsNotifier notifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Yes option
        _buildOptionCard(
          title: 'Có, tôi đã từng thử giảm cân',
          subtitle: 'Tôi đã có kinh nghiệm giảm cân trước đây',
          icon: Icons.history,
          isSelected: state.hasPreviousAttempts == true,
          onTap: () => notifier.setHasPreviousAttempts(true),
        ),
        
        const SizedBox(height: AppSpacing.m),
        
        // No option
        _buildOptionCard(
          title: 'Không, đây là lần đầu tiên',
          subtitle: 'Tôi chưa từng thử giảm cân một cách nghiêm túc',
          icon: Icons.new_releases,
          isSelected: state.hasPreviousAttempts == false,
          onTap: () => notifier.setHasPreviousAttempts(false),
        ),
      ],
    );
  }

  Widget _buildOptionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(AppSpacing.l),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderLight,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : [
                BoxShadow(
                  color: AppColors.gray200.withValues(alpha: 0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
        ),
        child: Row(
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.gray100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : AppColors.textSecondary,
                size: 24,
              ),
            ),
            
            const SizedBox(width: AppSpacing.m),
            
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.titleMedium.copyWith(
                      color: isSelected ? AppColors.primary : AppColors.textPrimary,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            
            // Selection indicator
            if (isSelected)
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsSection(PreviousAttemptsState state, PreviousAttemptsNotifier notifier) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.l),
      decoration: BoxDecoration(
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.edit_note,
                  color: AppColors.secondary,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppSpacing.s),
              Text(
                'Chia sẻ thêm về trải nghiệm của bạn',
                style: AppTypography.titleSmall.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: AppSpacing.m),
          
          // Helper text
          Text(
            'Hãy chia sẻ những gì bạn đã thử, kết quả như thế nào và tại sao bạn muốn bắt đầu lại. Thông tin này sẽ giúp chúng tôi tạo kế hoạch phù hợp hơn.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          
          const SizedBox(height: AppSpacing.m),
          
          // Text input
          TextField(
            onChanged: notifier.setDetails,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Ví dụ: Tôi đã thử chế độ ăn kiêng keto trong 3 tháng, giảm được 5kg nhưng sau đó tăng lại. Tôi cũng đã tập gym nhưng không đều đặn...',
              hintStyle: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary.withValues(alpha: 0.7),
                height: 1.4,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.borderLight),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.borderLight),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primary, width: 2),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textPrimary,
              height: 1.4,
            ),
          ),
          
          const SizedBox(height: AppSpacing.s),
          
          // Optional note
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                'Thông tin này là tùy chọn và hoàn toàn bảo mật',
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMotivationalMessage(bool hasPreviousAttempts) {
    return Container(
      margin: const EdgeInsets.only(top: AppSpacing.xl),
      padding: const EdgeInsets.all(AppSpacing.l),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: hasPreviousAttempts 
            ? [
                AppColors.secondary.withValues(alpha: 0.1),
                AppColors.primary.withValues(alpha: 0.1),
              ]
            : [
                AppColors.success.withValues(alpha: 0.1),
                AppColors.primary.withValues(alpha: 0.1),
              ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: hasPreviousAttempts ? AppColors.secondary.withValues(alpha: 0.3) : AppColors.success.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: hasPreviousAttempts ? AppColors.secondary : AppColors.success,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              hasPreviousAttempts ? Icons.psychology : Icons.celebration,
              color: Colors.white,
              size: 24,
            ),
          ),
          
          const SizedBox(width: AppSpacing.m),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hasPreviousAttempts 
                    ? 'Kinh nghiệm là tài sản quý giá!'
                    : 'Khởi đầu mới, cơ hội tuyệt vời!',
                  style: AppTypography.titleSmall.copyWith(
                    color: hasPreviousAttempts ? AppColors.secondary : AppColors.success,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  hasPreviousAttempts 
                    ? 'Những trải nghiệm trước đây sẽ giúp bạn thành công hơn lần này. Chúng tôi sẽ tạo kế hoạch tránh những khó khăn bạn đã gặp.'
                    : 'Bắt đầu từ con số 0 có thể là lợi thế! Chúng tôi sẽ hướng dẫn bạn từng bước một cách khoa học và bền vững.',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool isContinueEnabled(WidgetRef ref) {
    final state = ref.watch(previousAttemptsStateProvider);
    return state.hasPreviousAttempts != null;
  }

  @override
  Future<void> onContinue(BuildContext context, WidgetRef ref) async {
    final state = ref.read(previousAttemptsStateProvider);
    final service = ref.read(userFormServiceProvider.notifier);
    
    // Save previous attempts data
    await service.updatePreviousAttempts(
      state.hasPreviousAttempts!,
      state.details?.trim().isNotEmpty == true ? state.details!.trim() : null,
    );
    
    // Navigate to next step
    final nextRoute = await service.moveToNextStep();
    if (context.mounted) {
      context.go(nextRoute);
    }
  }
}
