import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';

class _Trail extends Component {
  _Trail(Vector2 origin)
      : _paths = [Path()..moveTo(origin.x, origin.y)],
        _opacities = [1],
        _lastPoint = origin.clone(),
        _color =
            HSLColor.fromAHSL(1, random.nextDouble() * 360, 1, 0.8).toColor();

  final List<Path> _paths;
  final List<double> _opacities;
  Color _color;
  late final _linePaint = Paint()..style = PaintingStyle.stroke;
  late final _circlePaint = Paint()..color = _color;
  bool _released = false;
  double _timer = 0;
  final _vanishInterval = 0.03;
  final Vector2 _lastPoint;

  static final random = Random();
  static const lineWidth = 10.0;

  @override
  void render(Canvas canvas) {
    assert(_paths.length == _opacities.length);
    for (var i = 0; i < _paths.length; i++) {
      final path = _paths[i];
      final opacity = _opacities[i];
      if (opacity > 0) {
        _linePaint.color = _color.withOpacity(opacity);
        _linePaint.strokeWidth = lineWidth * opacity;
        canvas.drawPath(path, _linePaint);
      }
    }
    canvas.drawCircle(
      _lastPoint.toOffset(),
      (lineWidth - 2) * _opacities.last + 2,
      _circlePaint,
    );
  }

  @override
  void update(double dt) {
    assert(_paths.length == _opacities.length);
    _timer += dt;
    while (_timer > _vanishInterval) {
      _timer -= _vanishInterval;
      for (var i = 0; i < _paths.length; i++) {
        _opacities[i] -= 0.01;
        if (_opacities[i] <= 0) {
          _paths[i].reset();
        }
      }
      if (!_released) {
        _paths.add(Path()..moveTo(_lastPoint.x, _lastPoint.y));
        _opacities.add(1);
      }
    }
    if (_opacities.last < 0) {
      removeFromParent();
    }
  }

  void addPoint(Vector2 point) {
    if (!point.x.isNaN) {
      for (final path in _paths) {
        path.lineTo(point.x, point.y);
      }
      _lastPoint.setFrom(point);
    }
  }

  void end() => _released = true;

  void cancel() {
    _released = true;
    _color = const Color(0xFFFFFFFF);
  }
}

class CanvasComponent extends PositionComponent with DragCallbacks {
  final _rectPaint = Paint()..color = Colors.transparent; //canvas color
  final Map<int, _Trail> _trails = {}; //fingers
  final Function(Vector2 tailPosition)? onTrailPositionUpdate;

  CanvasComponent({super.anchor = Anchor.center, this.onTrailPositionUpdate});

  @override
  // ignore: avoid_renaming_method_parameters
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);
    size = canvasSize - size;
    if (size.x < 100 || size.y < 100) {
      size = canvasSize;
    }
    position = canvasSize / 2;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _rectPaint);
  }

  @override
  void onDragStart(DragStartEvent event) {
    final trail = _Trail(event.localPosition);
    _trails[event.pointerId] = trail;
    addAll([
      trail,
    ]);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    _trails[event.pointerId]!.addPoint(event.localPosition);
    onTrailPositionUpdate != null
        ? onTrailPositionUpdate!(_trails[event.pointerId]!._lastPoint)
        : null;
  }

  @override
  void onDragEnd(DragEndEvent event) {
    _trails.remove(event.pointerId)!.end();
  }

  @override
  void onDragCancel(DragCancelEvent event) {
    _trails.remove(event.pointerId)!.cancel();
  }
}
