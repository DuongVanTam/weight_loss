import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import 'base_form_page.dart';

class PreviousAttemptsPage extends BaseFormPage {
  const PreviousAttemptsPage({super.key});

  @override
  String get title => 'Bạn đã từng giảm cân chưa?';

  @override
  String get subtitle => 'Thông tin này giúp chúng tôi hiểu rõ hơn về hành trình của bạn.';

  @override
  int get stepNumber => 3;

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        'Previous Attempts Form - Coming Soon',
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
    
    // Save previous attempts data (temporary value for now)
    // await service.updatePreviousAttempts(false, null); // TODO: Get from form input

    
    // Navigate to next step
    final nextRoute = await service.moveToNextStep();
    context.go(nextRoute);
  }
}
