import 'package:flame/components.dart';

import 'package:projeto_crianca/modules/games/games/components/bottom_container_component.dart';
import 'package:projeto_crianca/modules/games/games/components/draggable_block_component.dart';
import 'package:projeto_crianca/modules/games/games/components/fixed_block_component.dart';
import 'package:projeto_crianca/modules/games/games/components/hint_container_component.dart';
import 'package:projeto_crianca/modules/games/games/components/top_container_component.dart';

class ParDeCoresGameEngineContainer extends RectangleComponent with HasGameRef {
  ParDeCoresGameEngineContainer(this.setAvatarMessage);

  final void Function(String message) setAvatarMessage;

  final Iterable<Component> _data = [
    FixedBlockComponent(key: 'green')
      ..position = Vector2(
        (315 / 5) * 1 - (315 / 5) / 2,
        (230 / 4) * 2 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: 'orange')
      ..position = Vector2(
        (315 / 5) * 2 - (315 / 5) / 2,
        (230 / 4) * 2 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: 'purple')
      ..position = Vector2(
        (315 / 5) * 3 - (315 / 5) / 2,
        (230 / 4) * 2 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: 'red')
      ..position = Vector2(
        (315 / 5) * 4 - (315 / 5) / 2,
        (230 / 4) * 2 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: 'brown')
      ..position = Vector2(
        (315 / 5) * 5 - (315 / 5) / 2,
        (230 / 4) * 2 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: 'black')
      ..position = Vector2(
        (315 / 5) * 1 - (315 / 5) / 2,
        (230 / 4) * 4 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: 'yellow')
      ..position = Vector2(
        (315 / 5) * 2 - (315 / 5) / 2,
        (230 / 4) * 4 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: 'pink')
      ..position = Vector2(
        (315 / 5) * 3 - (315 / 5) / 2,
        (230 / 4) * 4 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: 'blue')
      ..position = Vector2(
        (315 / 5) * 4 - (315 / 5) / 2,
        (230 / 4) * 4 - (230 / 4) / 2,
      ),
    FixedBlockComponent(key: 'grey')
      ..position = Vector2(
        (315 / 5) * 5 - (315 / 5) / 2,
        (230 / 4) * 4 - (230 / 4) / 2,
      ),
  ];

  Future<void> _showAvatarOverlay(String message) async {
    setAvatarMessage(message);
    gameRef.overlays.add('avatar');
    await Future.delayed(
      const Duration(seconds: 5),
      () {
        gameRef.overlays.remove('avatar');
      },
    );
  }

  @override
  void onMount() {
    super.onMount();
    _showAvatarOverlay('Vamos começar!');
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    await addAll([
      TopContainerComponent()
        ..size = Vector2(size.x, size.y / 2)
        ..position = Vector2(0, 0),
      BottomContainerComponent()
        ..size = Vector2(size.x, size.y / 2)
        ..position = Vector2(0, size.y / 2),
      HintContainerComponent(
        data: _data,
        image: 'parDeCores/hint.png',
        imageSize: Vector2(315, 230),
      )
        ..size = Vector2(315, 230)
        ..position = Vector2(size.x / 2, size.y / 3)
        ..anchor = Anchor.center,
      DraggableBlockComponent(key: 'yellow', image: 'parDeCores/yellow.png')
        ..position =
            Vector2((315 / 5) * 1 - (315 / 5) / 5, size.y / 2 + size.y / 6),
      DraggableBlockComponent(key: 'red', image: 'parDeCores/red.png')
        ..position =
            Vector2((315 / 5) * 2 - (315 / 5) / 5, size.y / 2 + size.y / 6),
      DraggableBlockComponent(key: 'grey', image: 'parDeCores/grey.png')
        ..position =
            Vector2((315 / 5) * 3 - (315 / 5) / 5, size.y / 2 + size.y / 6),
      DraggableBlockComponent(key: 'black', image: 'parDeCores/black.png')
        ..position =
            Vector2((315 / 5) * 4 - (315 / 5) / 5, size.y / 2 + size.y / 6),
      DraggableBlockComponent(key: 'orange', image: 'parDeCores/orange.png')
        ..position =
            Vector2((315 / 5) * 5 - (315 / 5) / 5, size.y / 2 + size.y / 6),
      DraggableBlockComponent(key: 'brown', image: 'parDeCores/brown.png')
        ..position =
            Vector2((315 / 5) * 1 - (315 / 5) / 5, size.y / 2 + size.y / 4),
      DraggableBlockComponent(key: 'blue', image: 'parDeCores/blue.png')
        ..position =
            Vector2((315 / 5) * 2 - (315 / 5) / 5, size.y / 2 + size.y / 4),
      DraggableBlockComponent(key: 'pink', image: 'parDeCores/pink.png')
        ..position =
            Vector2((315 / 5) * 3 - (315 / 5) / 5, size.y / 2 + size.y / 4),
      DraggableBlockComponent(key: 'green', image: 'parDeCores/green.png')
        ..position =
            Vector2((315 / 5) * 4 - (315 / 5) / 5, size.y / 2 + size.y / 4),
      DraggableBlockComponent(key: 'purple', image: 'parDeCores/purple.png')
        ..position =
            Vector2((315 / 5) * 5 - (315 / 5) / 5, size.y / 2 + size.y / 4),
    ]);
  }
}
