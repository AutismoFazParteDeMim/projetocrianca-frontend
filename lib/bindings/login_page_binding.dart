import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/login_page_controller.dart';
import 'package:projeto_crianca/data/providers/auth_provider.dart';
import 'package:projeto_crianca/data/repositories/auth_repository.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController(AuthRepository(AuthProvider())));
  }
}
