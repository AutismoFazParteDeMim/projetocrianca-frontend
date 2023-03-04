import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class HintContainerComponent extends RectangleComponent {
  final Iterable<Component> data;
  final String image;
  final Vector2 imageSize;

  HintContainerComponent({
    required this.data,
    required this.image,
    required this.imageSize,
  }) {
    paint = Paint()..color = Colors.transparent;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await Flame.images.load(image);

    add(
      SpriteComponent.fromImage(
        Flame.images.fromCache(image),
        size: imageSize,
        position: Vector2(size.x / 2, size.y / 2),
        anchor: Anchor.center,
      ),
    );

    addAll(data);
  }
}
