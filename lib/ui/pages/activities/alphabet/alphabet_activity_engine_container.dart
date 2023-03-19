import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/mixins/vibration_mixin.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/bloc/alphabet_activity_bloc.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/bloc/alphabet_activity_bloc_events.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/bloc/alphabet_activity_bloc_states.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/components/hint_container_component.dart';

class AlphabetActivityEngineContainer extends RectangleComponent
    with
        FlameBlocListenable<AlphabetActivityBloc, AlphabetActivityState>,
        VibrationMixin {
  LetterModel currentLetter = letters.entries.elementAt(0).value;

  @override
  void onNewState(AlphabetActivityState state) {
    currentLetter = state.letter;
    onLoad();
    super.onNewState(state);
  }

  void nextLetterCallback() {
    bloc.add(NextLetterBlocEvent());
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    List<Vector2> queue = List<Vector2>.from(
      currentLetter.points.entries.elementAt(0).value,
    );

    int currentPart = 0;
    int parts = currentLetter.points.entries.length - 1;
    List pp = [];

    void onTrailPositionUpdate(Vector2 trailPosition) {
      Vector2? current = currentLetter.points.entries
          .elementAt(currentPart)
          .value
          .firstWhereOrNull(
            (element) =>
                trailPosition.x >= element.x - 12 &&
                trailPosition.x <= element.x - 12 + 24 &&
                trailPosition.y >= element.y - 12 &&
                trailPosition.y <= element.y - 12 + 24,
          );

      if (current != null) {
        final contain = queue.firstWhereOrNull(
              (element) => element == current,
            ) !=
            null;

        if (queue.isEmpty) {
          if (currentPart == parts) {
            currentPart = 0;
            pp = [];
            nextLetterCallback();
          } else {
            if (currentPart < parts) {
              currentPart += 1;
              queue = List<Vector2>.from(
                currentLetter.points.entries.elementAt(currentPart).value,
              );
              vibrate(duration: 50);
            }
          }
        } else if (queue.first == current) {
          queue.removeAt(0);
          vibrate(duration: 10);
        } else if (contain) {
          queue = List<Vector2>.from(
            currentLetter.points.entries.elementAt(currentPart).value,
          );
          vibrate(duration: 20);
        }
      }
    }

    for (var letter in currentLetter.points.entries) {
      for (var l in letter.value) {
        pp.add(l);
      }
    }

    addAll([
      HintContainerComponent(
          image: currentLetter.image,
          imageSize: Vector2(230, 230),
          onTrailPositionUpdate: onTrailPositionUpdate,
          data: pp.map(
            (e) => PositionComponent()
              ..size = Vector2(24, 24)
              ..position = e - Vector2(12, 12)
              ..debugMode = true,
          ))
        ..position = Vector2(
          size.x / 2,
          size.y / 2,
        )
        ..size = Vector2(230, 230)
        ..anchor = Anchor.center,
    ]);
  }
}
