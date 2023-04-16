import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame_svg/flame_svg.dart';
import 'package:projeto_crianca/mixins/vibration_mixin.dart';

class CardGameComponent extends PositionComponent
    with TapCallbacks, VibrationMixin {
  final String? key;
  final bool? isFaceUp;
  final String image;
  final void Function() onPressed;

  CardGameComponent({
    this.key,
    required this.image,
    required this.onPressed,
    this.isFaceUp,
  });

  @override
  Future<void> onLoad() async {
    late RectangleComponent component;
    final emptyCard = await Svg.load("images/memoryGame/emptyCard.svg");
    final faceDown = await Svg.load("images/memoryGame/card.svg");

    await Flame.images.load(image);

    component = RectangleComponent()..anchor = Anchor.center;
    component.add(
      SvgComponent(
        svg: isFaceUp == true ? emptyCard : faceDown,
        size: size,
        position: Vector2(size.x / 2, size.y / 2),
        anchor: anchor,
        children: [
          isFaceUp == true
              ? SpriteComponent.fromImage(
                  Flame.images.fromCache(image),
                  size: Vector2(60, 60),
                  position: Vector2(size.x / 2, size.y / 2),
                  anchor: Anchor.center,
                )
              : PositionComponent(),
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
