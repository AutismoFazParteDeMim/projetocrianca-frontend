import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:projeto_crianca/ui/pages/games/memory/memory_game_engine_container.dart';

class MemoryGameEngine extends FlameGame
    with HasCollisionDetection, HasDraggableComponents {
  @override
  void onMount() {
    super.onMount();
    FlameAudio.bgm.initialize();
    //FlameAudio.bgm.play("encaixar/background.mp3");
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(
      MemoryGameEngineContainer()..size = Vector2(size.x, size.y),
    );
  }

  @override
  void onRemove() {
    FlameAudio.bgm.pause();
  }
}
