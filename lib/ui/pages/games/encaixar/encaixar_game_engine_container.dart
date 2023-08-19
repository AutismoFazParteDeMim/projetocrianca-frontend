import 'package:flame/components.dart';
import 'package:projeto_crianca/ui/pages/games/components/bottom_container_component.dart';
import 'package:projeto_crianca/ui/pages/games/components/draggable_block_component.dart';
import 'package:projeto_crianca/ui/pages/games/components/fixed_block_component.dart';
import 'package:projeto_crianca/ui/pages/games/components/hint_container_component.dart';
import 'package:projeto_crianca/ui/pages/games/components/top_container_component.dart';

class EncaixarGameEngineContainer extends RectangleComponent with HasGameRef {
  EncaixarGameEngineContainer(this.setAvatarMessage);

  final void Function(String message) setAvatarMessage;
  final Iterable<Component> _data = [
    FixedBlockComponent(key: 'body')
      ..position = Vector2(
        (230 / 2) + 10,
        (230 / 2) - 28,
      ),
    FixedBlockComponent(key: 'head')
      ..position = Vector2(
        (230 / 2) + 86,
        (230 / 2) - 72,
      ),
    FixedBlockComponent(key: 'engine')
      ..position = Vector2(
        (230 / 2) - 82,
        (230 / 2) + 38,
      ),
    FixedBlockComponent(key: 'upperWings')
      ..position = Vector2(
        (230 / 2) - 80,
        (230 / 2) - 57,
      ),
    FixedBlockComponent(key: 'lowerWings')
      ..position = Vector2(
        (230 / 2) - 1,
        (230 / 2) + 74,
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
        image: 'encaixar/foguete.png',
        imageSize: Vector2(230, 230),
      )
        ..size = Vector2(230, 230)
        ..position = Vector2(size.x / 2, size.y / 3)
        ..anchor = Anchor.center,
      DraggableBlockComponent(key: 'head', image: 'encaixar/head.png')
        ..position = Vector2(size.x - 100, size.y - 100),
      DraggableBlockComponent(key: 'body', image: 'encaixar/body.png')
        ..position = Vector2(size.x - 200, size.y - 300),
      DraggableBlockComponent(key: 'engine', image: 'encaixar/engine.png')
        ..position = Vector2(size.x - 300, size.y - 100),
      DraggableBlockComponent(
        key: 'lowerWings',
        image: 'encaixar/lowerWings.png',
      )..position = Vector2(size.x - 200, size.y - 100),
      DraggableBlockComponent(
        key: 'upperWings',
        image: 'encaixar/upperWings.png',
      )..position = Vector2(size.x - 50, size.y - 200),
    ]);
  }
}
