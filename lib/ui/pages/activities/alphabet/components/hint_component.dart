import 'dart:async';

import 'package:flame/components.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/components/canvas_component.dart';

class HintComponent extends RectangleComponent {
  @override
  FutureOr<void> onLoad() {
    addAll([CanvasComponent()..size = size]);

    return super.onLoad();
  }
}
