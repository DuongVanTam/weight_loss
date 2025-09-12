import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import 'base_form_page.dart';

class AvoidAreasPage extends BaseFormPage {
  const AvoidAreasPage({super.key});

  @override
  String get title => 'Vùng cơ thể cần tránh?';

  @override
  String get subtitle => 'Nếu bạn có chấn thương hoặc vùng nào cần tránh, hãy cho chúng tôi biết.';

  @override
  int get stepNumber => 15;

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        'Avoid Areas Form - Coming Soon',
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
    // This is the last step, update step and go to summary
    final service = ref.read(userFormServiceProvider.notifier);
    await service.moveToNextStep(); // This will set currentStep to 15 (completed)
    context.go('/form/summary');
  }
}
