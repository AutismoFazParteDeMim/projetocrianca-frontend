import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:projeto_crianca/ui/pages/Games/Encaixar/components/fixed_block_component.dart';

class HintContainerComponent extends RectangleComponent {
  Map<String, FixedBlockComponent> list = {
    "head": FixedBlockComponent(key: "head"),
    "body": FixedBlockComponent(key: "body"),
    "engine": FixedBlockComponent(key: "engine"),
    "upperWings": FixedBlockComponent(key: "upperWings"),
    "lowerWings": FixedBlockComponent(key: "lowerWings"),
  };

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await Flame.images.load("encaixar/foguete.png");

    add(
      SpriteComponent.fromImage(
        Flame.images.fromCache("encaixar/foguete.png"),
        size: Vector2(230, 230),
        position: Vector2(size.x / 2, size.y / 2),
        anchor: Anchor.center,
      ),
    );

    addAll([
      list["body"]!
        ..position = Vector2(
          (size.x / 2) + 10,
          (size.y / 2) - 28,
        ),
      list["head"]!
        ..position = Vector2(
          (size.x / 2) + 86,
          (size.y / 2) - 72,
        ),
      list["engine"]!
        ..position = Vector2(
          (size.x / 2) - 82,
          (size.y / 2) + 38,
        ),
      list["upperWings"]!
        ..position = Vector2(
          (size.x / 2) - 80,
          (size.y / 2) - 57,
        ),
      list["lowerWings"]!
        ..position = Vector2(
          (size.x / 2) - 1,
          (size.y / 2) + 74,
        ),
    ]);
  }
}
