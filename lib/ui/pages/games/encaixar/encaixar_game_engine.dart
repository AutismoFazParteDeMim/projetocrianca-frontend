// ignore_for_file: use_setters_to_change_properties

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';

import 'package:projeto_crianca/ui/pages/games/encaixar/encaixar_game_engine_container.dart';

class EncaixarGameEngine extends FlameGame
    with HasCollisionDetection, DragCallbacks {
  String avatarMessage = 'Vamos começar!';

  // setters
  void setAvatarMessage(String message) => avatarMessage = message;

  @override
  void onMount() {
    super.onMount();
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('games/encaixar/background.mp3');
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await addAll([
      EncaixarGameEngineContainer(setAvatarMessage)
        ..size = Vector2(size.x, size.y),
    ]);
  }

  @override
  void onRemove() {
    FlameAudio.bgm.pause();
  }
}
