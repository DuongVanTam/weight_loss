import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import 'base_form_page.dart';

class CurrentWeightPage extends BaseFormPage {
  const CurrentWeightPage({super.key});

  @override
  String get title => 'Cân nặng hiện tại của bạn?';

  @override
  String get subtitle => 'Hãy cho chúng tôi biết cân nặng hiện tại để tạo kế hoạch phù hợp.';

  @override
  int get stepNumber => 2;

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        'Current Weight Form - Coming Soon',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  bool isContinueEnabled(WidgetRef ref) {
    // TODO: Check if weight is selected
    return true; // Temporary
  }

  @override
  Future<void> onContinue(BuildContext context, WidgetRef ref) async {
    final service = ref.read(userFormServiceProvider.notifier);
    
    // Save weight data (temporary value for now)
    await service.updateCurrentWeight(70.0); // TODO: Get from form input
    
    // Navigate to next step
    final nextRoute = await service.moveToNextStep();
    context.go(nextRoute);
  }
}
