import 'package:get/get.dart';
import 'package:projeto_crianca/ui/widgets/alert_modal_component.dart';

mixin DialogMixin {
  showAlertDialog({
    required String title,
    required String message,
    required AlertModalComponentType type,
  }) {
    Get.dialog(
      AlertModalComponent(
        title: title,
        message: message,
        type: type,
      ),
    );
  }
}
