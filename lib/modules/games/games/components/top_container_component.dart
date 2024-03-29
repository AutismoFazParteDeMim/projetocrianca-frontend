import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class TopContainerComponent extends RectangleComponent {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF00A7DF);

    add(
      RectangleHitbox()
        ..paint = paint
        ..renderShape = true,
    );
  }
}
