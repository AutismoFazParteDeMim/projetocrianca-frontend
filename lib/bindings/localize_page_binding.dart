import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/localize_page_controler.dart';

class LocalizePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalizePageControler());
  }

}