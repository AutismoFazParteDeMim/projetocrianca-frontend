import 'package:flame/components.dart';
import 'package:projeto_crianca/ui/pages/Games/Memory/components/card_component.dart';
import 'package:projeto_crianca/ui/pages/Games/Memory/components/container_component.dart';

class MemoryGameEngineContainer extends RectangleComponent {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    addAll([
      ContainerComponent()..size = Vector2(size.x, size.y),
      CardComponent()..size = Vector2(100,200)..position = Vector2.all(0),
    ]);
  }
}
