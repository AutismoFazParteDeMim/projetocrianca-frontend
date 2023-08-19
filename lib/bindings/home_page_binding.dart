import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/home_page_controller.dart';
import 'package:projeto_crianca/data/providers/user_provider.dart';
import 'package:projeto_crianca/data/repositories/user_repository.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomePageController(
        UserRepository(UserProvider()),
      ),
    );
  }
}
