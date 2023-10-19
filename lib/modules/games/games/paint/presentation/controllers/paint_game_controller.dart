import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaintGameController extends GetxController {
  final Rx<Color> paintColor = Rx(Colors.black);
  final Rx<double> strokeWidth = Rx(2);
  final Rx<List<DrawingArea?>> points = Rx([]);

  Color get getColor => paintColor.value;
  double get getStrokeWidth => strokeWidth.value;
  List<DrawingArea?> get getPoints => points.value;

  set setColor(Color color) => paintColor.value = color;
  set setStrokeWidth(double stroke) => strokeWidth.value = stroke;

  void addPoint(DrawingArea? point) {
    points.value.add(point);
    points.refresh();
  }

  void clearPoints() {
    points.value.clear();
    points.refresh();
  }
}

class DrawingArea {
  DrawingArea({
    required this.points,
    required this.areaPaint,
  });

  final Offset points;
  final Paint areaPaint;
}
