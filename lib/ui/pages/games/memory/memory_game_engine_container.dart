import 'package:flame/components.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/ui/pages/games/components/bottom_container_component.dart';
import 'package:projeto_crianca/ui/pages/games/components/dragable_block_component.dart';
import 'package:projeto_crianca/ui/pages/games/components/hint_container_component.dart';
import 'package:projeto_crianca/ui/pages/games/components/top_container_component.dart';
import 'package:projeto_crianca/ui/pages/games/components/fixed_block_component.dart';
import 'package:projeto_crianca/ui/pages/games/memory/components/card_game_component.dart';

class MemoryGameEngineContainer extends RectangleComponent {
  @override
  Future<void> onLoad() async {
    super.onLoad();

    List<Component> data = [
      CardGameComponent(image: "memoryGame/pato.png")
        ..position = Vector2((size.x / 3) * 1 - (size.x / 3) / 2,
            (500 / 3) * 1 - (500 / 3) / 2 + size.y / 3),
      CardGameComponent(image: "memoryGame/coelho.png")
        ..position = Vector2((size.x / 3) * 2 - (size.x / 3) / 2,
            (500 / 3) * 1 - (500 / 3) / 2 + size.y / 3),
      CardGameComponent(image: "memoryGame/gata.png")
        ..position = Vector2((size.x / 3) * 3 - (size.x / 3) / 2,
            (500 / 3) * 1 - (500 / 3) / 2 + size.y / 3),
      CardGameComponent(image: "memoryGame/gata.png")
        ..position = Vector2((size.x / 3) * 1 - (size.x / 3) / 2,
            (500 / 3) * 2 - (500 / 3) / 2 + size.y / 3),
      CardGameComponent(image: "memoryGame/gata.png")
        ..position = Vector2((size.x / 3) * 2 - (size.x / 3) / 2,
            (500 / 3) * 2 - (500 / 3) / 2 + size.y / 3),
      CardGameComponent(image: "memoryGame/gata.png")
        ..position = Vector2((size.x / 3) * 3 - (size.x / 3) / 2,
            (500 / 3) * 2 - (500 / 3) / 2 + size.y / 3),
      CardGameComponent(image: "memoryGame/gata.png")
        ..position = Vector2((size.x / 3) * 1 - (size.x / 3) / 2,
            (500 / 3) * 3 - (500 / 3) / 2 + size.y / 3),
      CardGameComponent(image: "memoryGame/gata.png")
        ..position = Vector2((size.x / 3) * 2 - (size.x / 3) / 2,
            (500 / 3) * 3 - (500 / 3) / 2 + size.y / 3),
      CardGameComponent(image: "memoryGame/gata.png")
        ..position = Vector2((size.x / 3) * 3 - (size.x / 3) / 2,
            (500 / 3) * 3 - (500 / 3) / 2 + size.y / 3),
    ];

    data.shuffle();
    addAll([
      TopContainerComponent()
        ..size = Vector2(size.x, size.y)
        ..position = Vector2(0, 0),
      ...data
    ]);
  }
}
