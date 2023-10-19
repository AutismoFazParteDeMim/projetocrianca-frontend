import 'package:get/get.dart';
import 'package:projeto_crianca/modules/settings/presentation/controllers/settings_page_controller.dart';

class SettingsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(SettingsPageController.new);
  }
}
