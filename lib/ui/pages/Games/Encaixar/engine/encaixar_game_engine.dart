import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:projeto_crianca/ui/pages/Games/Encaixar/engine/encaixar_game_engine_container.dart';

class EncaixarGameEngine extends FlameGame
    with HasCollisionDetection, HasDraggableComponents {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    addAll([
      EncaixarGameEngineContainer()..size = Vector2(size.x, size.y),
    ]);
  }
}
