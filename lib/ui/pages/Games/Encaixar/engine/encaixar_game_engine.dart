import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:projeto_crianca/ui/pages/Games/Encaixar/engine/encaixar_game_engine_container.dart';
import 'package:flame_audio/flame_audio.dart';

class EncaixarGameEngine extends FlameGame
    with SingleGameInstance, HasCollisionDetection, HasDraggableComponents {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    FlameAudio.bgm.initialize();

    FlameAudio.bgm.play("encaixar/background.mp3");

    addAll([
      EncaixarGameEngineContainer()..size = Vector2(size.x, size.y),
    ]);
  }

  @override
  void onRemove() {
    FlameAudio.bgm.pause();
    detach();
    remove(this);
  }
}
