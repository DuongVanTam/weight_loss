import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import 'base_form_page.dart';

class ActivityLevelPage extends BaseFormPage {
  const ActivityLevelPage({super.key});

  @override
  String get title => 'Mức độ vận động hàng ngày?';

  @override
  String get subtitle => 'Hãy chọn mức độ phù hợp với hoạt động thường ngày của bạn.';

  @override
  int get stepNumber => 11;

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        'Activity Level Form - Coming Soon',
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
