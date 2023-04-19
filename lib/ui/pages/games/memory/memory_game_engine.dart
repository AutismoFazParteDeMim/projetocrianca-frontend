import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:projeto_crianca/ui/pages/games/memory/bloc/memory_game_bloc.dart';
import 'package:projeto_crianca/ui/pages/games/memory/bloc/memory_game_bloc_states.dart';
import 'package:projeto_crianca/ui/pages/games/memory/memory_game_engine_container.dart';

class MemoryGameEngine extends FlameGame
    with HasCollisionDetection, HasDraggableComponents, HasTappableComponents {
  @override
  void onMount() {
    super.onMount();
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play("games/parDeCores/background.mp3");
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(
      FlameBlocProvider<MemoryGameBloc, MemoryGameState>(
        create: () => MemoryGameBloc(),
        children: [
          MemoryGameEngineContainer()
            ..size = Vector2(
              size.x,
              size.y,
            ),
        ],
      ),
    );
  }

  @override
  void onRemove() {
    FlameAudio.bgm.pause();
  }
}
