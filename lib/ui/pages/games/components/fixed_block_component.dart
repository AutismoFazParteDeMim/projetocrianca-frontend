import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:projeto_crianca/mixins/vibration_mixin.dart';
import 'package:projeto_crianca/ui/pages/games/components/draggable_block_component.dart';

class FixedBlockComponent extends PositionComponent with CollisionCallbacks, VibrationMixin {
  final String? key;

  FixedBlockComponent({
    this.key,
  }) {
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

    if (other is DraggableBlockComponent && key == other.key) {
      other.position = absolutePosition;
      other.fixed = true;
      vibrate(duration: 50);
    }
  }
}
