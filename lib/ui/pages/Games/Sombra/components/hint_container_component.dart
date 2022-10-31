import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:projeto_crianca/ui/pages/Games/Sombra/components/fixed_block_component.dart';

class HintContainerComponent extends RectangleComponent {
  Map<String, FixedBlockComponent> list = {
    "pig": FixedBlockComponent(key: "pig"),
    "rooster": FixedBlockComponent(key: "rooster"),
    "elephant": FixedBlockComponent(key: "elephant"),
  };

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await Flame.images.load("sombra/shadows.png");

    add(
      SpriteComponent.fromImage(
        Flame.images.fromCache("sombra/shadows.png"),
        size: Vector2(247, 112),
        position: Vector2(size.x / 2, size.y / 3),
        anchor: Anchor.center,
      ),
    );

    addAll([
      list["pig"]!
        ..position = Vector2(
          (size.x / 2) + 0,
          (size.y / 2) - 35,
        ),
      list["elephant"]!
        ..position = Vector2(
          (size.x / 2) + 93,
          (size.y / 2) - 35,
        ),
      list["rooster"]!
        ..position = Vector2(
          (size.x / 2) - 96,
          (size.y / 2) - 35,
        ),
    ]);
  }
}
