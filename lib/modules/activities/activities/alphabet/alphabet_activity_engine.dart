// ignore_for_file: use_setters_to_change_properties

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_bloc/flame_bloc.dart';

import 'package:projeto_crianca/modules/activities/activities/alphabet/alphabet_activity_engine_container.dart';
import 'package:projeto_crianca/modules/activities/activities/alphabet/bloc/alphabet_activity_bloc.dart';
import 'package:projeto_crianca/modules/activities/activities/alphabet/bloc/alphabet_activity_bloc_states.dart';

class AlphabetActivityEngine extends FlameGame with DragCallbacks {
  String avatarMessage = 'Vamos começar!';

  // setters
  void setAvatarMessage(String message) => avatarMessage = message;

  @override
  void onMount() {
    super.onMount();
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('activities/alphabet/background.mp3');
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(
      FlameBlocProvider<AlphabetActivityBloc, AlphabetActivityState>(
        create: AlphabetActivityBloc.new,
        children: [
          AlphabetActivityEngineContainer(setAvatarMessage)
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
