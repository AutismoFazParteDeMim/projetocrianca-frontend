import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/alphabet_activity_engine_container.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/alphabet_activity_page.dart';

class AlphabetActivityEngine extends FlameGame with HasDraggableComponents {
  final GameBloc gameBloc;

  AlphabetActivityEngine({required this.gameBloc});

  @override
  void onMount() {
    super.onMount();
    FlameAudio.bgm.initialize();
    //FlameAudio.bgm.play("activities/alphabet/background.mp3");
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(
      FlameBlocProvider<GameBloc, dynamic>.value(
        value: gameBloc,
        children: [
          AlphabetActivityEngineContainer()
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
