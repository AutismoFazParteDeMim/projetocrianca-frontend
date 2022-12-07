import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/pages/games/components/dragable_block_component.dart';
import 'package:projeto_crianca/ui/pages/games/controllers/vibration_controller.dart';

class FixedBlockComponent extends PositionComponent with CollisionCallbacks {
  final VibrationController _vibrationController = VibrationController();
  final String? key;

  FixedBlockComponent({
    this.key,
  }) {
    super.size = Vector2.all(24);
    super.anchor = Anchor.center;
    super.debugMode = true;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is DragableBlockComponent && key == other.key) {
      other.position = absolutePosition;
      other.fixed = true;
      _vibrationController.vibrate(duration: 50);
    }
  }
}
