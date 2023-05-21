import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/games/paint_game_controller.dart';

class PaintGamePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaintGameController());
  }
}
