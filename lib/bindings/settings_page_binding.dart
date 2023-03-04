import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/settings_page_controller.dart';

class SettingsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsPageController());
  }
}
