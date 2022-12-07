import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/alphabet_activity_engine_container.dart';
import 'package:flame_audio/flame_audio.dart';

class AlphabetActivityEngine extends FlameGame
    with HasCollisionDetection, HasDraggableComponents {
  @override
  void onMount() {
    super.onMount();
    FlameAudio.bgm.initialize();
    //FlameAudio.bgm.play("games/encaixar/background.mp3");
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    addAll([
     AlphabetActivityEngineContainer()..size = Vector2(size.x, size.y),
    ]);
  }

  @override
  void onRemove() {
    FlameAudio.bgm.pause();
  }
}
