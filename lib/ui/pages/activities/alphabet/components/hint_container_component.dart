import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/components/canvas_component.dart';

class HintContainerComponent extends RectangleComponent {
  final String image;
  final Vector2 imageSize;
  final Function(Vector2 trailPosition) onTrailPositionUpdate;
  final Iterable<Component> data;

  HintContainerComponent({
    required this.image,
    required this.imageSize,
    required this.onTrailPositionUpdate,
    required this.data,
  });

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await Flame.images.load(image);

    addAll([
      SpriteComponent.fromImage(
        Flame.images.fromCache(image),
        size: imageSize,
        position: Vector2(size.x / 2, size.y / 2),
        anchor: Anchor.center,
      ),
      CanvasComponent(
        onTrailPositionUpdate: (trailPosition) =>
            onTrailPositionUpdate(trailPosition),
      )
        ..size = imageSize
        ..position = Vector2(size.x / 2, size.y / 2)
        ..anchor = Anchor.center,
    ]);

    addAll(data);
  }
}
