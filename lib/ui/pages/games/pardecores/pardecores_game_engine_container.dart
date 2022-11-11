import 'package:flame/components.dart';
import 'package:projeto_crianca/ui/pages/games/components/bottom_container_component.dart';
import 'package:projeto_crianca/ui/pages/games/components/dragable_block_component.dart';
import 'package:projeto_crianca/ui/pages/games/components/hint_container_component.dart';
import 'package:projeto_crianca/ui/pages/games/components/top_container_component.dart';
import 'package:projeto_crianca/ui/pages/games/components/fixed_block_component.dart';

class ParDeCoresGameEngineContainer extends RectangleComponent {
  final Iterable<Component> _data = [
    FixedBlockComponent(key: "green")
      ..position = Vector2(
        (315 / 5) * 1 - (315 / 5) / 2,
        (230 / 4) * 2 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: "orange")
      ..position = Vector2(
        (315 / 5) * 2 - (315 / 5) / 2,
        (230 / 4) * 2 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: "purple")
      ..position = Vector2(
        (315 / 5) * 3 - (315 / 5) / 2,
        (230 / 4) * 2 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: "red")
      ..position = Vector2(
        (315 / 5) * 4 - (315 / 5) / 2,
        (230 / 4) * 2 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: "brown")
      ..position = Vector2(
        (315 / 5) * 5 - (315 / 5) / 2,
        (230 / 4) * 2 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: "black")
      ..position = Vector2(
        (315 / 5) * 1 - (315 / 5) / 2,
        (230 / 4) * 4 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: "yellow")
      ..position = Vector2(
        (315 / 5) * 2 - (315 / 5) / 2,
        (230 / 4) * 4 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: "pink")
      ..position = Vector2(
        (315 / 5) * 3 - (315 / 5) / 2,
        (230 / 4) * 4 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: "blue")
      ..position = Vector2(
        (315 / 5) * 4 - (315 / 5) / 2,
        (230 / 4) * 4 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: "grey")
      ..position = Vector2(
        (315 / 5) * 5 - (315 / 5) / 2,
        (230 / 4) * 4 - (230 / 4) / 2,
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
        image: "parDeCores/hint.png",
        imageSize: Vector2(315, 230),
      )
        ..size = Vector2(315, 230)
        ..position = Vector2(size.x / 2, size.y / 3)
        ..anchor = Anchor.center,
      DragableBlockComponent(key: "yellow", image: "parDeCores/yellow.png")
        ..position =
            Vector2((315 / 5) * 1 - (315 / 5) / 5, size.y / 2 + size.y / 6),
      DragableBlockComponent(key: "red", image: "parDeCores/red.png")
        ..position =
            Vector2((315 / 5) * 2 - (315 / 5) / 5, size.y / 2 + size.y / 6),
      DragableBlockComponent(key: "grey", image: "parDeCores/grey.png")
        ..position =
            Vector2((315 / 5) * 3 - (315 / 5) / 5, size.y / 2 + size.y / 6),
      DragableBlockComponent(key: "black", image: "parDeCores/black.png")
        ..position =
            Vector2((315 / 5) * 4 - (315 / 5) / 5, size.y / 2 + size.y / 6),
      DragableBlockComponent(key: "orange", image: "parDeCores/orange.png")
        ..position =
            Vector2((315 / 5) * 5 - (315 / 5) / 5, size.y / 2 + size.y / 6),
      DragableBlockComponent(key: "brown", image: "parDeCores/brown.png")
        ..position =
            Vector2((315 / 5) * 1 - (315 / 5) / 5, size.y / 2 + size.y / 4),
      DragableBlockComponent(key: "blue", image: "parDeCores/blue.png")
        ..position =
            Vector2((315 / 5) * 2 - (315 / 5) / 5, size.y / 2 + size.y / 4),
      DragableBlockComponent(key: "pink", image: "parDeCores/pink.png")
        ..position =
            Vector2((315 / 5) * 3 - (315 / 5) / 5, size.y / 2 + size.y / 4),
      DragableBlockComponent(key: "green", image: "parDeCores/green.png")
        ..position =
            Vector2((315 / 5) * 4 - (315 / 5) / 5, size.y / 2 + size.y / 4),
      DragableBlockComponent(key: "purple", image: "parDeCores/purple.png")
        ..position =
            Vector2((315 / 5) * 5 - (315 / 5) / 5, size.y / 2 + size.y / 4),
    ]);
  }
}
