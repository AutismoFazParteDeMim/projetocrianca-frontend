import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class ImageComponent extends PositionComponent {
  final String? key;
  late bool fixed;
  final String image;

  ImageComponent({
    this.key,
    required this.image,
    this.fixed = false,
  }) {
    super.size = Vector2.all(50);
    super.anchor = Anchor.center;
  }

  @override
  Future<void> onLoad() async {
    late ShapeHitbox hitbox;

    await Flame.images.load(image);

    hitbox = RectangleHitbox();
    hitbox.add(
      SpriteComponent.fromImage(
        Flame.images.fromCache(image),
        position: Vector2(size.x / 2, size.y / 2),
        anchor: Anchor.center,
      ),
    );

    add(hitbox);
  }
}
