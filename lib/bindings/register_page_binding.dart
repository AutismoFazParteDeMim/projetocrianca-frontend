import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/register_page_controller.dart';
import 'package:projeto_crianca/data/providers/auth_provider.dart';
import 'package:projeto_crianca/data/providers/user_provider.dart';
import 'package:projeto_crianca/data/repositorys/register_repository.dart';

class RegisterPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RegisterPageController(
        RegisterRepository(AuthProvider(), UserProvider()),
      ),
    );
  }
}
