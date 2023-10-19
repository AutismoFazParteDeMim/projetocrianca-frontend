import 'package:get/get.dart';
import 'package:projeto_crianca/modules/games/games/paint/presentation/controllers/paint_game_controller.dart';

class PaintGamePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(PaintGameController.new);
  }
}
