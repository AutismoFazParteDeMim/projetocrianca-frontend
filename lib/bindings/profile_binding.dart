import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/profile_controler.dart';
import 'package:projeto_crianca/data/providers/avatar_provider.dart';
import 'package:projeto_crianca/data/repositorys/avatar_repository.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(AvatarRepository(AvatarProvider())));
  }
}
