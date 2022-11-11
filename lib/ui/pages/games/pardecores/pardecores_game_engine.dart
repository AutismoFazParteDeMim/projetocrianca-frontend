import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:projeto_crianca/ui/pages/games/pardecores/pardecores_game_engine_container.dart';

class ParDeCoresGameEngine extends FlameGame
    with HasCollisionDetection, HasDraggableComponents {
  @override
  void onMount() {
    super.onMount();
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play("games/sombra/background.mp3");
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    addAll([
      ParDeCoresGameEngineContainer()..size = Vector2(size.x, size.y),
    ]);
  }

  @override
  void onRemove() {
    FlameAudio.bgm.pause();
  }
}
