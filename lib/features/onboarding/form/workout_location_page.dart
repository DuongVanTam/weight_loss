import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import 'base_form_page.dart';

class WorkoutLocationPage extends BaseFormPage {
  const WorkoutLocationPage({super.key});

  @override
  String get title => 'Bạn thường tập ở đâu?';

  @override
  String get subtitle => 'Địa điểm tập luyện sẽ ảnh hưởng đến các bài tập phù hợp.';

  @override
  int get stepNumber => 13;

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        'Workout Location Form - Coming Soon',
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
