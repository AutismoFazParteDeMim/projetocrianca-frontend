import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/auth_controller.dart';
import 'package:projeto_crianca/data/providers/auth_provider.dart';
import 'package:projeto_crianca/data/repositorys/auth_repository.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(AuthRepository(AuthProvider())));
  }
}
