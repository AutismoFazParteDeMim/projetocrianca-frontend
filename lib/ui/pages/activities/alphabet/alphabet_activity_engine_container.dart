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
        VibrationMixin,
        HasGameRef {
  LetterModel currentLetter = letters.entries.elementAt(0).value;

  @override
  void onNewState(AlphabetActivityState state) {
    super.onNewState(state);
    currentLetter = state.letter;
    onLoad();
  }

  void nextLetterCallback() {
    bloc.add(NextLetterBlocEvent());
  }

  @override
  void onMount() {
    super.onMount();
    gameRef.overlays.add("avatar");
  }

  @override
  Future<void> onLoad() async {
    int index = 0;
    int total = currentLetter.points.entries.length - 1;
    List<PointModel> etapaAtual =
        currentLetter.points.entries.elementAt(index).value;
    List<PointModel> devPoints = [];

    void onTrailPositionUpdate(Vector2 trailPosition) {
      PointModel? current = etapaAtual.firstWhereOrNull(
        (element) =>
            trailPosition.x >= element.position.x - 12 &&
            trailPosition.x <= element.position.x - 12 + 24 &&
            trailPosition.y >= element.position.y - 12 &&
            trailPosition.y <= element.position.y - 12 + 24,
      );

      //if current point is correct
      if (current != null && current == etapaAtual.first) {
        etapaAtual.removeAt(0);
        vibrate(duration: 50);

        //next step when complete
        if (etapaAtual.isEmpty && index < total) {
          index++;
          etapaAtual = currentLetter.points.entries.elementAt(index).value;
        }

        //next level when complete
        if (etapaAtual.isEmpty && index == total) {
          nextLetterCallback();
          index = 0;
          total = currentLetter.points.entries.length - 1;
          etapaAtual = currentLetter.points.entries.elementAt(index).value;
          devPoints = [];
        }
      }
    }

    //devlopment screen points
    for (var letter in currentLetter.points.entries) {
      for (var l in letter.value) {
        devPoints.add(l);
      }
    }

    addAll([
      HintContainerComponent(
          image: currentLetter.image,
          imageSize: Vector2(230, 230),
          onTrailPositionUpdate: onTrailPositionUpdate,
          data: devPoints.map(
            (e) => PositionComponent()
              ..size = Vector2(24, 24)
              ..position = e.position - Vector2(12, 12)
              ..debugMode = false,
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
