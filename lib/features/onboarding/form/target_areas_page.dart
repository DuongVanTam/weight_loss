import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import '../../../core/models/user_profile.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../shared/styles/app_spacing.dart';
import 'base_form_page.dart';

class TargetAreasPage extends BaseFormPage {
  const TargetAreasPage({super.key});

  @override
  String get title => 'Vùng nào bạn muốn giảm mỡ?';

  @override
  String get subtitle => 'Lưu ý: Không thể giảm mỡ cục bộ, nhưng chúng tôi sẽ tập trung vào các bài tập phù hợp.';

  @override
  int get stepNumber => 6;

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userFormServiceProvider);
    final selectedAreas = userProfile.targetAreas;
    
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              // Left side - Options
              Expanded(
                flex: 2,
                child: _buildTargetAreaOptions(context, ref, selectedAreas),
              ),
              
              const SizedBox(width: AppSpacing.m),
              
              // Right side - Body diagram
              Expanded(
                flex: 3,
                child: _buildBodyDiagram(context, ref, selectedAreas),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTargetAreaOptions(BuildContext context, WidgetRef ref, List<TargetArea> selectedAreas) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Chọn vùng muốn tập trung:',
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        
        const SizedBox(height: AppSpacing.l),
        
        Expanded(
          child: ListView(
            children: TargetArea.values.map((area) {
              final isSelected = selectedAreas.contains(area);
              return Container(
                margin: const EdgeInsets.only(bottom: AppSpacing.m),
                child: _buildTargetAreaOption(
                  context,
                  ref,
                  area,
                  isSelected,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTargetAreaOption(BuildContext context, WidgetRef ref, TargetArea area, bool isSelected) {
    return GestureDetector(
      onTap: () => _toggleTargetArea(ref, area),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(AppSpacing.m),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.gray300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.gray400,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 14,
                    )
                  : null,
            ),
            
            const SizedBox(width: AppSpacing.m),
            
            Expanded(
              child: Text(
                area.displayName,
                style: AppTypography.bodyLarge.copyWith(
                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyDiagram(BuildContext context, WidgetRef ref, List<TargetArea> selectedAreas) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gray200),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Background body image
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/full-body.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              
              // Interactive overlay areas
              ..._buildInteractiveAreas(context, ref, selectedAreas, constraints),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildInteractiveAreas(BuildContext context, WidgetRef ref, List<TargetArea> selectedAreas, BoxConstraints constraints) {
    final isOverallSelected = selectedAreas.contains(TargetArea.overall);
    
    return [
      // Arms area - Left arm
      _buildInteractiveArea(
        context,
        ref,
        TargetArea.arms,
        selectedAreas.contains(TargetArea.arms) || isOverallSelected,
        const Rect.fromLTRB(0.28, 0.3, 0.38, 0.45),
        constraints,
      ),
      
      // Arms area - Right arm  
      _buildInteractiveArea(
        context,
        ref,
        TargetArea.arms,
        selectedAreas.contains(TargetArea.arms) || isOverallSelected,
        const Rect.fromLTRB(0.58, 0.3, 0.68, 0.45),
        constraints,
      ),
      
      // Belly area (center - abdominal region)
      _buildInteractiveArea(
        context,
        ref,
        TargetArea.belly,
        selectedAreas.contains(TargetArea.belly) || isOverallSelected,
        const Rect.fromLTRB(0.35, 0.4, 0.6, 0.45),
        constraints,
      ),
      
      // Glutes area (hip and buttocks region)
      _buildInteractiveArea(
        context,
        ref,
        TargetArea.glutes,
        selectedAreas.contains(TargetArea.glutes) || isOverallSelected,
        const Rect.fromLTRB(0.32, 0.45, 0.45, 0.52),
        constraints,
      ),
      
      // Legs area - Left leg
      _buildInteractiveArea(
        context,
        ref,
        TargetArea.legs,
        selectedAreas.contains(TargetArea.legs) || isOverallSelected,
        const Rect.fromLTRB(0.3, 0.55, 0.48, 0.75),
        constraints,
      ),
      
      // Legs area - Right leg
      _buildInteractiveArea(
        context,
        ref,
        TargetArea.legs,
        selectedAreas.contains(TargetArea.legs) || isOverallSelected,
        const Rect.fromLTRB(0.52, 0.55, 0.7, 0.75),
        constraints,
      ),
    ];
  }

  Widget _buildInteractiveArea(
    BuildContext context,
    WidgetRef ref,
    TargetArea area,
    bool isSelected,
    Rect relativeRect,
    BoxConstraints constraints,
  ) {
    final left = constraints.maxWidth * relativeRect.left;
    final top = constraints.maxHeight * relativeRect.top;
    final width = constraints.maxWidth * (relativeRect.right - relativeRect.left);
    final height = constraints.maxHeight * (relativeRect.bottom - relativeRect.top);
    
    return Positioned(
      left: left,
      top: top,
      width: width,
      height: height,
      child: GestureDetector(
        onTap: () => _toggleTargetArea(ref, area),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: isSelected 
                ? AppColors.primary.withOpacity(0.3)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  void _toggleTargetArea(WidgetRef ref, TargetArea area) {
    final userProfile = ref.read(userFormServiceProvider);
    final currentAreas = List<TargetArea>.from(userProfile.targetAreas);
    
    if (area == TargetArea.overall) {
      // Special handling for "Toàn thân"
      if (currentAreas.contains(TargetArea.overall)) {
        // If "Toàn thân" is selected, remove it
        currentAreas.clear();
      } else {
        // If "Toàn thân" is not selected, select only it
        currentAreas.clear();
        currentAreas.add(TargetArea.overall);
      }
    } else {
      // Regular area selection
      if (currentAreas.contains(area)) {
        currentAreas.remove(area);
      } else {
        // Remove "Toàn thân" if selecting specific area
        currentAreas.remove(TargetArea.overall);
        currentAreas.add(area);
      }
    }
    
    ref.read(userFormServiceProvider.notifier).updateTargetAreas(currentAreas);
  }

  @override
  bool isContinueEnabled(WidgetRef ref) {
    final userProfile = ref.watch(userFormServiceProvider);
    return userProfile.targetAreas.isNotEmpty;
  }

  @override
  Future<void> onContinue(BuildContext context, WidgetRef ref) async {
    final service = ref.read(userFormServiceProvider.notifier);
    final nextRoute = await service.moveToNextStep();
    context.go(nextRoute);
  }
}
