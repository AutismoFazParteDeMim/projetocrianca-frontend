import 'package:flame/components.dart';
import 'package:projeto_crianca/ui/pages/Games/components/bottom_container_component.dart';
import 'package:projeto_crianca/ui/pages/Games/components/dragable_block_component.dart';
import 'package:projeto_crianca/ui/pages/Games/components/hint_container_component.dart';
import 'package:projeto_crianca/ui/pages/Games/components/top_container_component.dart';
import 'package:projeto_crianca/ui/pages/Games/components/fixed_block_component.dart';

class SombraGameEngineContainer extends RectangleComponent {
  final Iterable<Component> _data = [
    FixedBlockComponent(key: "pig")
      ..position = Vector2(
        (230 / 2),
        (230 / 2),
      ),
    FixedBlockComponent(key: "elephant")
      ..position = Vector2(
        (230 / 2) + 93,
        (230 / 2),
      ),
    FixedBlockComponent(key: "rooster")
      ..position = Vector2(
        (230 / 2) - 96,
        (230 / 2),
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
        image: "sombra/shadows.png",
        imageSize: Vector2(247, 112),
      )
        ..size = Vector2(230, 230)
        ..position = Vector2(size.x / 2, size.y / 3)
        ..anchor = Anchor.center,
      DragableBlockComponent(key: "pig", image: "sombra/pig.png")
        ..position = Vector2(size.x - 100, size.y - 100),
      DragableBlockComponent(key: "rooster", image: "sombra/rooster.png")
        ..position = Vector2(size.x - 200, size.y - 300),
      DragableBlockComponent(key: "elephant", image: "sombra/elephant.png")
        ..position = Vector2(size.x - 300, size.y - 100),
    ]);
  }
}
