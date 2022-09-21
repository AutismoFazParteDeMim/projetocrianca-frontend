import 'package:flame/collisions.dart';
import 'package:flame/experimental.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class DragableBlockComponent extends PositionComponent with DragCallbacks {
  final String? key;
  late bool fixed;
  final String image;

  DragableBlockComponent({
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

    await Flame.images.load("encaixar/$image");

    hitbox = RectangleHitbox();
    hitbox.add(
      SpriteComponent.fromImage(
        Flame.images.fromCache("encaixar/$image"),
        position: Vector2(size.x / 2, size.y / 2),
        anchor: Anchor.center,
      ),
    );

    add(hitbox);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    if (!fixed) {
      position += event.delta;
    }
  }
}
