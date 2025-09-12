import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
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
    return const Center(
      child: Text(
        'Target Areas Form - Coming Soon',
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
