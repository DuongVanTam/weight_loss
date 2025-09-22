import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/user_form_service.dart';
import '../../../core/models/user_profile.dart';
import '../../../shared/widgets/body_shape_selector.dart';
import 'base_form_page.dart';

class TargetBodyShapePage extends BaseFormPage {
  const TargetBodyShapePage({super.key});

  @override
  String get title => 'Hình dáng mục tiêu của bạn?';

  @override
  String get subtitle => 'Chọn hình dáng bạn muốn đạt được sau khi hoàn thành chương trình.';

  @override
  int get stepNumber => 8;

  @override
  Widget buildFormContent(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userFormServiceProvider);
    
    return BodyShapeSelector(
      selectedShape: userProfile.targetBodyShape,
      onShapeChanged: (BodyShape shape) {
        final service = ref.read(userFormServiceProvider.notifier);
        service.updateTargetBodyShape(shape);
      },
    );
  }

  @override
  bool isContinueEnabled(WidgetRef ref) {
    final userProfile = ref.watch(userFormServiceProvider);
    return userProfile.targetBodyShape != null;
  }

  @override
  Future<void> onContinue(BuildContext context, WidgetRef ref) async {
    final service = ref.read(userFormServiceProvider.notifier);
    final nextRoute = await service.moveToNextStep();
    context.go(nextRoute);
  }
}