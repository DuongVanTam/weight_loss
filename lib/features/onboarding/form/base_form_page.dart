import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/primary_button.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../shared/styles/app_spacing.dart';
import '../../../core/services/user_form_service.dart';

/// Base class for all form pages with common UI elements
abstract class BaseFormPage extends ConsumerWidget {
  const BaseFormPage({super.key});

  /// Title of the form step
  String get title;
  
  /// Subtitle/description of the form step
  String get subtitle;
  
  /// Current step number (1-11)
  int get stepNumber;
  
  /// Total steps
  int get totalSteps => 11;
  
  /// Build the form content
  Widget buildFormContent(BuildContext context, WidgetRef ref);
  
  /// Handle continue button press
  Future<void> onContinue(BuildContext context, WidgetRef ref);
  
  /// Whether the continue button should be enabled
  bool isContinueEnabled(WidgetRef ref);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Step management is now handled purely by navigation flow
    // No need for ensureStepReached() calls
    
    return Scaffold(
      backgroundColor: AppColors.neutralBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: stepNumber > 1 
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
              onPressed: () => _handleBackNavigation(context, ref),
            )
          : null,
        title: Text(
          'Bước $stepNumber/$totalSteps',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress indicator
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
              child: LinearProgressIndicator(
                value: stepNumber / totalSteps,
                backgroundColor: AppColors.gray200,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                minHeight: 4,
              ),
            ),
            
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.l),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.xl),
                    
                    // Title
                    Text(
                      title,
                      style: AppTypography.headlineMedium.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.s),
                    
                    // Subtitle
                    Text(
                      subtitle,
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.xl),
                    
                    // Form content
                    Expanded(
                      child: buildFormContent(context, ref),
                    ),
                  ],
                ),
              ),
            ),
            
            // Continue button
            Padding(
              padding: const EdgeInsets.all(AppSpacing.l),
              child: PrimaryButton(
                text: stepNumber == totalSteps ? 'Hoàn thành' : 'Tiếp tục',
                onPressed: isContinueEnabled(ref) 
                  ? () => _handleContinue(context, ref)
                  : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Handle continue button
  void _handleContinue(BuildContext context, WidgetRef ref) async {
    // Call the page-specific onContinue directly
    // The step validation will be handled in the service
    await onContinue(context, ref);
  }

  /// Handle back navigation with proper GoRouter routing
  void _handleBackNavigation(BuildContext context, WidgetRef ref) async {
    final service = ref.read(userFormServiceProvider.notifier);
    
    final previousRoute = await service.moveToPreviousStep();
    context.go(previousRoute);
  }
}
