import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/mixins/vibration_mixin.dart';
import 'package:projeto_crianca/ui/pages/activities/components/canvas_component.dart';
import 'package:projeto_crianca/ui/pages/activities/components/image_component.dart';

class AlphabetActivityEngineContainer extends RectangleComponent
    with VibrationMixin {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    final List<List<Vector2>> parte1Default = [
      [
        Vector2(88, 478),
        Vector2(112, 502),
      ],
      [
        Vector2(126, 388),
        Vector2(150, 412),
      ],
      [
        Vector2(168, 296),
        Vector2(192, 320),
      ],
      [
        Vector2(210, 388),
        Vector2(234, 412),
      ],
      [
        Vector2(248, 478),
        Vector2(272, 502),
      ],
    ];

    final List<List<Vector2>> parte2Default = [
      [
        Vector2(126, 388),
        Vector2(150, 412),
      ],
      [
        Vector2(210, 388),
        Vector2(234, 412),
      ],
    ];

    List<List<Vector2>> parte1 = parte1Default.toList();
    List<List<Vector2>> parte2 = parte2Default.toList();

    void onTrailPositionUpdate(Vector2 trailPosition) {
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
      } else {
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
