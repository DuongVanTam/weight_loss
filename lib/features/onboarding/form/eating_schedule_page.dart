import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import 'base_form_page.dart';

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
    return const Center(
      child: Text(
        'Eating Schedule Form - Coming Soon',
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
    final nextRoute = await service.moveToNextStep();
    context.go(nextRoute);
  }
}
