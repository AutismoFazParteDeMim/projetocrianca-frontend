import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:projeto_crianca/ui/pages/Games/Puzzle/components/fixed_block_component.dart';

class HintContainerComponent extends RectangleComponent {
  Map<String, FixedBlockComponent> list = {
    "puzzle_1": FixedBlockComponent(key: "puzzle_1"),
    "puzzle_2": FixedBlockComponent(key: "puzzle_2"),
    "puzzle_3": FixedBlockComponent(key: "puzzle_3"),
    "puzzle_4": FixedBlockComponent(key: "puzzle_4"),
    "puzzle_5": FixedBlockComponent(key: "puzzle_5"),
    "puzzle_6": FixedBlockComponent(key: "puzzle_6"),
  };

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await Flame.images.load("puzzle/puzzle_fundo.png");

    add(
      SpriteComponent.fromImage(
        Flame.images.fromCache("puzzle/puzzle_fundo.png"),
        size: Vector2(287, 176),
        position: Vector2(size.x / 2, size.y / 2),
        anchor: Anchor.center,
      ),
    );

    addAll([
      list["puzzle_2"]!
        ..position = Vector2(
          (size.x / 2) + 0,
          (size.y / 2) - 43,
        ),
      list["puzzle_3"]!
        ..position = Vector2(
          (size.x / 2) + 94,
          (size.y / 2) - 43,
        ),
      list["puzzle_4"]!
        ..position = Vector2(
          (size.x / 2) - 94,
          (size.y / 2) + 44,
        ),
      list["puzzle_1"]!
        ..position = Vector2(
          (size.x / 2) - 94,
          (size.y / 2) - 43,
        ),
      list["puzzle_5"]!
        ..position = Vector2(
          (size.x / 2) - 1,
          (size.y / 2) + 44,
        ),
      list["puzzle_6"]!
        ..position = Vector2(
          (size.x / 2) + 94,
          (size.y / 2) + 43,
        ),
    ]);
  }
}
