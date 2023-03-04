import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class BottomContainerComponent extends RectangleComponent {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    add(
      RectangleHitbox()
        ..paint = paint
        ..renderShape = true,
    );
  }
}
