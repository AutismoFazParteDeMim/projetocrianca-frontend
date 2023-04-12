import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/profile_page_controller.dart';
import 'package:projeto_crianca/data/providers/user_provider.dart';
import 'package:projeto_crianca/data/repositories/user_repository.dart';

class ProfilePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfilePageController(UserRepository(UserProvider())));
  }
}
