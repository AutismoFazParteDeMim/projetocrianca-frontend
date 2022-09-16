import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/register_page_controller.dart';

class RegisterPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterPageController());
  }
}
