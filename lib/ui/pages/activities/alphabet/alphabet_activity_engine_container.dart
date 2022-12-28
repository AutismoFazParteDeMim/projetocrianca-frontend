import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/mixins/vibration_mixin.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/alphabet_activity_engine.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/alphabet_activity_page.dart';
import 'package:projeto_crianca/ui/pages/activities/components/canvas_component.dart';
import 'package:projeto_crianca/ui/pages/activities/components/image_component.dart';

class AlphabetActivityEngineContainer extends RectangleComponent
    with
        HasGameRef<AlphabetActivityEngine>,
        FlameBlocListenable<GameBloc, dynamic>,
        FlameBlocReader<GameBloc, dynamic>,
        VibrationMixin {
  LetterModel? letter;

  @override
  void onNewState(dynamic state) {
    //print(state);
    letter = state;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    final parte1Default = [
      PointModel(
        positionTop: Vector2(88, 478),
        positionBottom: Vector2(112, 502),
      ),
      PointModel(
        positionTop: Vector2(126, 388),
        positionBottom: Vector2(150, 412),
      ),
      PointModel(
        positionTop: Vector2(168, 296),
        positionBottom: Vector2(192, 320),
      ),
      PointModel(
        positionTop: Vector2(210, 388),
        positionBottom: Vector2(234, 412),
      ),
      PointModel(
        positionTop: Vector2(248, 478),
        positionBottom: Vector2(272, 502),
      ),
    ];
    final parte2Default = [
      PointModel(
        positionTop: Vector2(126, 388),
        positionBottom: Vector2(150, 412),
      ),
      PointModel(
        positionTop: Vector2(210, 388),
        positionBottom: Vector2(234, 412),
      ),
    ];

    List parte1 = [];
    List parte2 = [];

    void onTrailPositionUpdate(Vector2 trailPosition) {
      /*for (var i = 0; i < letter!.points.length; i++) {
        if (letter!.points[i].isNotEmpty) {
          PointModel? current = letter!.points[i].firstWhereOrNull((element) =>
              trailPosition.x >= element.positionTop.x &&
              trailPosition.x <= element.positionBottom.x &&
              trailPosition.y >= element.positionTop.y &&
              trailPosition.y <= element.positionBottom.y);

          for (var j = 0; j < letter!.points[i].length; j++) {
            if (current != null) {
              if (current == letter!.points[i].first) {
                vibrate(duration: 10);
                letter!.points[i].remove(current);
              } else {
                letter = LetterModel(
                  points: [
                    [
                      PointModel(
                        positionTop: Vector2(88, 478),
                        positionBottom: Vector2(112, 502),
                      ),
                      PointModel(
                        positionTop: Vector2(126, 388),
                        positionBottom: Vector2(150, 412),
                      ),
                      PointModel(
                        positionTop: Vector2(168, 296),
                        positionBottom: Vector2(192, 320),
                      ),
                      PointModel(
                        positionTop: Vector2(210, 388),
                        positionBottom: Vector2(234, 412),
                      ),
                      PointModel(
                        positionTop: Vector2(248, 478),
                        positionBottom: Vector2(272, 502),
                      ),
                    ],
                    [
                      PointModel(
                        positionTop: Vector2(126, 388),
                        positionBottom: Vector2(150, 412),
                      ),
                      PointModel(
                        positionTop: Vector2(210, 388),
                        positionBottom: Vector2(234, 412),
                      ),
                    ]
                  ],
                );
              }
            } else {
              print("ddd");
            }
          }
        } else {
          print("Fim de jogo");
        }
      }*/

      if (parte1.isNotEmpty) {
        List<Vector2>? current = parte1.firstWhereOrNull((element) =>
            trailPosition.x >= element[0].x &&
            trailPosition.x <= element[1].x &&
            trailPosition.y >= element[0].y &&
            trailPosition.y <= element[1].y);

        if (current != null) {
          if (current == parte1.first) {
            parte1.remove(current); //remove
            vibrate(duration: 10);
          } else {
            parte1 = parte1Default.toList();
          }
        }
      } else if (parte2.isNotEmpty) {
        List<Vector2>? current = parte2.firstWhereOrNull((element) =>
            trailPosition.x >= element[0].x &&
            trailPosition.x <= element[1].x &&
            trailPosition.y >= element[0].y &&
            trailPosition.y <= element[1].y);

        if (current != null) {
          if (current == parte2.first) {
            parte2.remove(current); //remove
            vibrate(duration: 10);
          } else {
            parte2 = parte1Default.toList();
          }
        }
      }
    }

    addAll([
      RectangleHitbox()
        ..paint = paint
        ..renderShape = true,
      ImageComponent(image: "alphabet/A.png")
        ..position = Vector2(size.x / 2, size.y / 2),
      CanvasComponent(
        onTrailPositionUpdate: (trailPosition) =>
            onTrailPositionUpdate(trailPosition),
      ),
    ]);
  }
}
