import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/login_page_controller.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController());
  }
}
