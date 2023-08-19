import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame_svg/flame_svg.dart';
import 'package:projeto_crianca/mixins/vibration_mixin.dart';

class CardGameComponent extends PositionComponent
    with TapCallbacks, VibrationMixin {
  CardGameComponent({
    required this.image,
    required this.onPressed,
    this.key,
    this.isFaceUp,
  }) {
    super.size = Vector2(80, 100);
  }

  final String? key;
  final bool? isFaceUp;
  final String image;
  final void Function() onPressed;
  late Svg emptyCard;
  late Svg faceDown;

  @override
  Future<void> onLoad() async {
    late RectangleComponent component;

    await Flame.images.load(image);
    await Flame.images.load('memoryGame/card.png');
    await Flame.images.load('memoryGame/emptycard.png');

    component = RectangleComponent()
      ..anchor = Anchor.center
      ..add(
        SpriteComponent.fromImage(
          isFaceUp == false
              ? Flame.images.fromCache('memoryGame/card.png')
              : Flame.images.fromCache('memoryGame/emptycard.png'),
          size: Vector2(80, 100),
          position: Vector2(size.x / 2, size.y / 2),
          anchor: Anchor.center,
          children: [
            if (isFaceUp == false)
              PositionComponent()
            else
              SpriteComponent.fromImage(
                Flame.images.fromCache(image),
                size: Vector2(60, 60),
                position: Vector2(size.x / 2, size.y / 2),
                anchor: Anchor.center,
              ),
          ],
        ),
      );

    add(component);
  }

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    scale = Vector2.all(1.1);
    vibrate(duration: 10);
    onPressed();
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    scale = Vector2.all(1);
  }
}
