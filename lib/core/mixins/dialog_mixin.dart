import 'package:get/get.dart';
import 'package:projeto_crianca/core/presentation/widgets/alert_modal_component.dart';

mixin DialogMixin {
  void showAlertDialog({
    required String title,
    required String message,
    required AlertModalComponentType type,
  }) {
    Get.dialog<void>(
      AlertModalComponent(
        title: title,
        message: message,
        type: type,
      ),
    );
  }
}
