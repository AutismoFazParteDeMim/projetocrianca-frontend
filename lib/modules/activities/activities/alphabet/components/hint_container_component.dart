import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:projeto_crianca/modules/activities/activities/alphabet/components/canvas_component.dart';

class HintContainerComponent extends RectangleComponent {
  HintContainerComponent({
    required this.image,
    required this.imageSize,
    required this.onTrailPositionUpdate,
    required this.data,
  });

  final String image;
  final Vector2 imageSize;
  final void Function(Vector2 trailPosition) onTrailPositionUpdate;
  final Iterable<Component> data;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await Flame.images.load(image);

    await addAll([
      SpriteComponent.fromImage(
        Flame.images.fromCache(image),
        size: imageSize,
        position: Vector2(size.x / 2, size.y / 2),
        anchor: Anchor.center,
      ),
      CanvasComponent(
        onTrailPositionUpdate: onTrailPositionUpdate,
      )
        ..size = imageSize
        ..position = Vector2(size.x / 2, size.y / 2)
        ..anchor = Anchor.center,
    ]);

    await addAll(data);
  }
}
