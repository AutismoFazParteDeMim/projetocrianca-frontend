import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:get/get.dart';

import 'package:projeto_crianca/core/mixins/vibration_mixin.dart';
import 'package:projeto_crianca/modules/activities/activities/numbers/bloc/numbers_activity_bloc.dart';
import 'package:projeto_crianca/modules/activities/activities/numbers/bloc/numbers_activity_bloc_events.dart';
import 'package:projeto_crianca/modules/activities/activities/numbers/bloc/numbers_activity_bloc_states.dart';
import 'package:projeto_crianca/modules/activities/activities/numbers/components/hint_container_component.dart';

class NumbersActivityEngineContainer extends RectangleComponent
    with
        FlameBlocListenable<NumbersActivityBloc, NumbersActivityState>,
        VibrationMixin,
        HasGameRef {
  NumbersActivityEngineContainer(this.setAvatarMessage);

  final void Function(String message) setAvatarMessage;
  NumberModel currentNumber = numbers.entries.elementAt(0).value;

  Future<void> _showAvatarOverlay(String message) async {
    setAvatarMessage(message);
    gameRef.overlays.add('avatar');
    await Future.delayed(
      const Duration(seconds: 5),
      () {
        gameRef.overlays.remove('avatar');
      },
    );
  }

  @override
  void onMount() {
    super.onMount();
    _showAvatarOverlay('Vamos começar!');
  }

  @override
  void onNewState(NumbersActivityState state) {
    super.onNewState(state);
    currentNumber = state.number;
    onLoad();

    if (state.avatarMessage != null) {
      _showAvatarOverlay(state.avatarMessage!);
    }
  }

  void nextNumberCallback() {
    bloc.add(NextNumberBlocEvent());
  }

  @override
  Future<void> onLoad() async {
    var index = 0;
    var total = currentNumber.points.entries.length - 1;
    var etapaAtual = currentNumber.points.entries.elementAt(index).value;
    var devPoints = <PointModel>[];

    void onTrailPositionUpdate(Vector2 trailPosition) {
      final current = etapaAtual.firstWhereOrNull(
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
          etapaAtual = currentNumber.points.entries.elementAt(index).value;
        }

        //next level when complete
        if (etapaAtual.isEmpty && index == total) {
          nextNumberCallback();
          index = 0;
          total = currentNumber.points.entries.length - 1;
          etapaAtual = currentNumber.points.entries.elementAt(index).value;
          devPoints = [];
        }
      }
    }

    //development screen points
    for (final number in currentNumber.points.entries) {
      for (final l in number.value) {
        devPoints.add(l);
      }
    }

    await addAll([
      HintContainerComponent(
        image: currentNumber.image,
        imageSize: Vector2(230, 230),
        onTrailPositionUpdate: onTrailPositionUpdate,
        data: devPoints.map(
          (e) => PositionComponent()
            ..size = Vector2(24, 24)
            ..position = e.position - Vector2(12, 12)
            ..debugMode = false,
        ),
      )
        ..position = Vector2(
          size.x / 2,
          size.y / 2,
        )
        ..size = Vector2(230, 230)
        ..anchor = Anchor.center,
    ]);
  }
}
