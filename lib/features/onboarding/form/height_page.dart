import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import 'base_form_page.dart';

class HeightPage extends BaseFormPage {
  const HeightPage({super.key});

  @override
  String get title => 'Chiều cao của bạn?';

  @override
  String get subtitle => 'Chiều cao giúp tính toán BMI và lượng calo cần thiết.';

  @override
  int get stepNumber => 1;

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        'Height Form - Coming Soon',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  bool isContinueEnabled(WidgetRef ref) {
    return true; // Temporary
  }

  @override
  Future<void> onContinue(BuildContext context, WidgetRef ref) async {
    final service = ref.read(userFormServiceProvider.notifier);
    
    // Save height data (temporary value for now)
    await service.updateHeight(170.0); // TODO: Get from form input
    
    // Navigate to next step
    final nextRoute = await service.moveToNextStep();
    context.go(nextRoute);
  }
}
