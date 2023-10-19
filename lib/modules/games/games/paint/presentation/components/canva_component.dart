import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/modules/games/games/paint/presentation/controllers/paint_game_controller.dart';

class CanvaComponent extends GetView<PaintGameController> {
  const CanvaComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      child: GestureDetector(
        onPanDown: (details) {
          controller.addPoint(
            DrawingArea(
              points: details.localPosition,
              areaPaint: Paint()
                ..color = controller.getColor
                ..strokeCap = StrokeCap.round
                ..strokeWidth = controller.getStrokeWidth
                ..isAntiAlias = true,
            ),
          );
        },
        onPanUpdate: (details) {
          controller.addPoint(
            DrawingArea(
              points: details.localPosition,
              areaPaint: Paint()
                ..color = controller.getColor
                ..strokeCap = StrokeCap.round
                ..strokeWidth = controller.getStrokeWidth
                ..isAntiAlias = true,
            ),
          );
        },
        onPanEnd: (details) {
          controller.addPoint(null);
        },
        child: ClipRRect(
          child: Obx(
            () => CustomPaint(
              painter: _PaintCustomPainter(
                points: controller.getPoints,
                color: controller.getColor,
                strokeWidth: controller.getStrokeWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PaintCustomPainter extends CustomPainter {
  _PaintCustomPainter({
    required this.points,
    required this.color,
    required this.strokeWidth,
  });

  final List<DrawingArea?> points;
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final background = Paint()..color = Colors.white;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

    for (var x = 0; x < points.length - 1; x++) {
      if (points[x] != null && points[x + 1] != null) {
        final draw = points[x]!.areaPaint;
        canvas.drawLine(points[x]!.points, points[x + 1]!.points, draw);
      } else if (points[x] != null && points[x + 1] == null) {
        final draw = points[x]!.areaPaint;
        canvas.drawPoints(PointMode.points, [points[x]!.points], draw);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
