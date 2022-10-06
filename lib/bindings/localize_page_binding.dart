import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/localize_page_controller.dart';
import 'package:projeto_crianca/data/providers/profissional_provider.dart';
import 'package:projeto_crianca/data/repositorys/localize_repository.dart';

class LocalizePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalizePageController(LocalizeRepository(ProfissionalProvider())));
  }

}