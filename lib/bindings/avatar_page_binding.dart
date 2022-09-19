import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/avatar_page_controller.dart';
import 'package:projeto_crianca/data/providers/avatar_provider.dart';
import 'package:projeto_crianca/data/repositorys/avatar_repository.dart';

class AvatarPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AvatarPageController(AvatarRepository(AvatarProvider())));
  }
}
