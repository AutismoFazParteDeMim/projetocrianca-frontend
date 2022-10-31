import 'package:flame/components.dart';
import 'package:projeto_crianca/ui/pages/Games/Sombra/components/bottom_container_component.dart';
import 'package:projeto_crianca/ui/pages/Games/Sombra/components/dragable_block_component.dart';
import 'package:projeto_crianca/ui/pages/Games/Sombra/components/hint_container_component.dart';
import 'package:projeto_crianca/ui/pages/Games/Sombra/components/top_container_component.dart';

class SombraGameEngineContainer extends RectangleComponent {
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
      DragableBlockComponent(key: "pig", image: "pig.png")
        ..position = Vector2(size.x - 100, size.y - 100),
      DragableBlockComponent(key: "rooster", image: "rooster.png")
        ..position = Vector2(size.x - 200, size.y - 300),
      DragableBlockComponent(key: "elephant", image: "elephant.png")
        ..position = Vector2(size.x - 300, size.y - 100),
    ]);
  }
}
