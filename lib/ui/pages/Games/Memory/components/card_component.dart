import 'package:flame/components.dart';
import 'package:flame_svg/flame_svg.dart';
import 'package:flutter/material.dart';

class CardComponent extends PositionComponent {
  final paintt = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.blueGrey;

  @override
  Future<void>? onLoad() async {
    super.onLoad();
    final svgInstance = await Svg.load('memoryGame/card.svg');
    final size = Vector2.all(100);

    add(SvgComponent(size: size, svg: svgInstance));
  }
}
