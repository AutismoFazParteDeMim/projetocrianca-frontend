import 'package:flame/components.dart';
import 'package:projeto_crianca/ui/pages/Games/Puzzle/components/bottom_container_component.dart';
import 'package:projeto_crianca/ui/pages/Games/Puzzle/components/dragable_block_component.dart';
import 'package:projeto_crianca/ui/pages/Games/Puzzle/components/hint_container_component.dart';
import 'package:projeto_crianca/ui/pages/Games/Puzzle/components/top_container_component.dart';

class PuzzleGameEngineContainer extends RectangleComponent {
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
      HintContainerComponent()
        ..size = Vector2(230, 230)
        ..position = Vector2(size.x / 2, size.y / 3)
        ..anchor = Anchor.center,
      DragableBlockComponent(key: "puzzle_1", image: "puzzle_1.png")
        ..position = Vector2(size.x - 100, size.y - 100),
      DragableBlockComponent(key: "puzzle_2", image: "puzzle_2.png")
        ..position = Vector2(size.x - 200, size.y - 300),
      DragableBlockComponent(key: "puzzle_3", image: "puzzle_3.png")
        ..position = Vector2(size.x - 300, size.y - 100),
      DragableBlockComponent(key: "puzzle_4", image: "puzzle_4.png")
        ..position = Vector2(size.x - 200, size.y - 100),
      DragableBlockComponent(key: "puzzle_5", image: "puzzle_5.png")
        ..position = Vector2(size.x - 50, size.y - 200),
      DragableBlockComponent(key: "puzzle_6", image: "puzzle_6.png")
        ..position = Vector2(size.x - 100, size.y - 200),
    ]);
  }
}
