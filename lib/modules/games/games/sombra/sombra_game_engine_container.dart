import 'package:flame/components.dart';

import 'package:projeto_crianca/modules/games/games/components/bottom_container_component.dart';
import 'package:projeto_crianca/modules/games/games/components/draggable_block_component.dart';
import 'package:projeto_crianca/modules/games/games/components/fixed_block_component.dart';
import 'package:projeto_crianca/modules/games/games/components/hint_container_component.dart';
import 'package:projeto_crianca/modules/games/games/components/top_container_component.dart';

class SombraGameEngineContainer extends RectangleComponent with HasGameRef {
  SombraGameEngineContainer(this.setAvatarMessage);

  final void Function(String message) setAvatarMessage;

  final Iterable<Component> _data = [
    FixedBlockComponent(key: 'pig')
      ..position = Vector2(
        (230 / 2),
        (230 / 2),
      ),
    FixedBlockComponent(key: 'elephant')
      ..position = Vector2(
        (230 / 2) + 93,
        (230 / 2),
      ),
    FixedBlockComponent(key: 'rooster')
      ..position = Vector2(
        (230 / 2) - 96,
        (230 / 2),
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
        image: 'sombra/shadows.png',
        imageSize: Vector2(247, 112),
      )
        ..size = Vector2(230, 230)
        ..position = Vector2(size.x / 2, size.y / 3)
        ..anchor = Anchor.center,
      DraggableBlockComponent(key: 'pig', image: 'sombra/pig.png')
        ..position = Vector2(size.x - 100, size.y - 100),
      DraggableBlockComponent(key: 'rooster', image: 'sombra/rooster.png')
        ..position = Vector2(size.x - 200, size.y - 300),
      DraggableBlockComponent(key: 'elephant', image: 'sombra/elephant.png')
        ..position = Vector2(size.x - 300, size.y - 100),
    ]);
  }
}
