import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:projeto_crianca/ui/pages/Games/Encaixar/components/dragable_block_component.dart';

class FixedBlockComponent extends PositionComponent with CollisionCallbacks {
  final String? key;

  FixedBlockComponent({this.key}) {
    super.size = Vector2.all(24);
    super.anchor = Anchor.center;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is DragableBlockComponent && key == other.key) {
      other.position = absolutePosition;
      other.fixed = true;
    }
  }
}
