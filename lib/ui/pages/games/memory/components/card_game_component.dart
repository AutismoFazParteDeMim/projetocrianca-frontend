import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame_svg/flame_svg.dart';
import 'package:projeto_crianca/mixins/vibration_mixin.dart';

class CardGameComponent extends PositionComponent
    with DragCallbacks, VibrationMixin {
  final String? key;
  late bool fixed;
  final String image;

  CardGameComponent({
    this.key,
    required this.image,
    this.fixed = false,
  }) {
    super.size = Vector2(64, 100);
    super.anchor = Anchor.center;
  }

  @override
  Future<void> onLoad() async {
    late RectangleComponent component;

    await Flame.images.load(image);

    //final svg = await Svg.load("images/$image");
    final emptyCard = await Svg.load("images/memoryGame/emptyCard.svg");

    component = RectangleComponent();
    component.add(
      SvgComponent(
        svg: emptyCard,
        size: size,
        position: Vector2(size.x / 2, size.y / 2),
        anchor: anchor,
        children: [
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
  void onDragStart(DragStartEvent event) {
    super.onDragStart(event);
    scale = Vector2.all(1.1);
    vibrate(duration: 10);
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
    scale = Vector2.all(1);
  }
}
