import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:projeto_crianca/ui/pages/Games/Sombra/sombra_game_engine_container.dart';

class SombraGameEngine extends FlameGame
    with HasCollisionDetection, HasDraggableComponents {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    addAll([
      SombraGameEngineContainer()..size = Vector2(size.x, size.y),
    ]);
  }
}
