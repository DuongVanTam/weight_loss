import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import 'base_form_page.dart';

class WorkoutPreferencesPage extends BaseFormPage {
  const WorkoutPreferencesPage({super.key});

  @override
  String get title => 'Sở thích luyện tập?';

  @override
  String get subtitle => 'Chọn các loại hình tập luyện bạn yêu thích (có thể chọn nhiều).';

  @override
  int get stepNumber => 12;

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(
        'Workout Preferences Form - Coming Soon',
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
