import 'package:flame/components.dart';
import 'package:projeto_crianca/ui/pages/Games/Encaixar/components/bottom_container_component.dart';
import 'package:projeto_crianca/ui/pages/Games/Encaixar/components/dragable_block_component.dart';
import 'package:projeto_crianca/ui/pages/Games/Encaixar/components/hint_container_component.dart';
import 'package:projeto_crianca/ui/pages/Games/Encaixar/components/top_container_component.dart';

class EncaixarGameEngineContainer extends RectangleComponent {
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
      DragableBlockComponent(key: "head", image: "head.png")
        ..position = Vector2(size.x - 100, size.y - 100),
      DragableBlockComponent(key: "body", image: "body.png")
        ..position = Vector2(size.x - 200, size.y - 300),
      DragableBlockComponent(key: "engine", image: "engine.png")
        ..position = Vector2(size.x - 300, size.y - 100),
      DragableBlockComponent(key: "lowerWings", image: "lowerWings.png")
        ..position = Vector2(size.x - 200, size.y - 100),
      DragableBlockComponent(key: "upperWings", image: "upperWings.png")
        ..position = Vector2(size.x - 50, size.y - 200),
    ]);
  }
}
