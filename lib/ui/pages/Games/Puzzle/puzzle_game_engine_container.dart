import 'package:flame/components.dart';
import 'package:projeto_crianca/ui/pages/Games/components/bottom_container_component.dart';
import 'package:projeto_crianca/ui/pages/Games/components/dragable_block_component.dart';
import 'package:projeto_crianca/ui/pages/Games/components/hint_container_component.dart';
import 'package:projeto_crianca/ui/pages/Games/components/top_container_component.dart';
import 'package:projeto_crianca/ui/pages/Games/components/fixed_block_component.dart';

class PuzzleGameEngineContainer extends RectangleComponent {
  final Iterable<Component> _data = [
    FixedBlockComponent(key: "puzzle_1")
      ..position = Vector2(
        (230 / 2) - 95,
        (230 / 2) - 43,
      ),
    FixedBlockComponent(key: "puzzle_2")
      ..position = Vector2(
        (230 / 2) + 0,
        (230 / 2) - 43,
      ),
    FixedBlockComponent(key: "puzzle_3")
      ..position = Vector2(
        (230 / 2) + 94,
        (230 / 2) - 43,
      ),
    FixedBlockComponent(key: "puzzle_4")
      ..position = Vector2(
        (230 / 2) - 94,
        (230 / 2) + 44,
      ),
    FixedBlockComponent(key: "puzzle_5")
      ..position = Vector2(
        (230 / 2) - 1,
        (230 / 2) + 44,
      ),
    FixedBlockComponent(key: "puzzle_6")
      ..position = Vector2(
        (230 / 2) + 94,
        (230 / 2) + 43,
      ),
  ];
  @override
  Future<void> onLoad() async {
    super.onLoad();

    addAll([
      TopContainerComponent()
        ..size = Vector2(size.x, size.y / 2)
        ..position = Vector2(0, 0),
      BottomContainerComponent()
        ..size = Vector2(size.x, size.y / 2)
        ..position = Vector2(0, size.y / 2),
      HintContainerComponent(
        data: _data,
        image: "puzzle/puzzle_fundo.png",
        imageSize: Vector2(287, 176),
      )
        ..size = Vector2(230, 230)
        ..position = Vector2(size.x / 2, size.y / 3)
        ..anchor = Anchor.center,
      DragableBlockComponent(key: "puzzle_1", image: "puzzle/puzzle_1.png")
        ..position = Vector2(size.x - 100, size.y - 100),
      DragableBlockComponent(key: "puzzle_2", image: "puzzle/puzzle_2.png")
        ..position = Vector2(size.x - 200, size.y - 300),
      DragableBlockComponent(key: "puzzle_3", image: "puzzle/puzzle_3.png")
        ..position = Vector2(size.x - 300, size.y - 100),
      DragableBlockComponent(key: "puzzle_4", image: "puzzle/puzzle_4.png")
        ..position = Vector2(size.x - 200, size.y - 100),
      DragableBlockComponent(key: "puzzle_5", image: "puzzle/puzzle_5.png")
        ..position = Vector2(size.x - 50, size.y - 200),
      DragableBlockComponent(key: "puzzle_6", image: "puzzle/puzzle_6.png")
        ..position = Vector2(size.x - 100, size.y - 200),
    ]);
  }
}
