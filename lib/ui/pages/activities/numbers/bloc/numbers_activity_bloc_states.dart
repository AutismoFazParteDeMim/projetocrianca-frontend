import 'package:flame/components.dart';

class PointModel {
  final String id;
  final Vector2 position;

  PointModel({
    required this.id,
    required this.position,
  });
}

class NumberModel {
  final String image;
  final Map<int, List<PointModel>> points;

  NumberModel({required this.image, required this.points});
}

final numbers = {
  "1": NumberModel(
    image: "numbers/1.png",
    points: {
      1: [
        PointModel(id: "1-1", position: Vector2(115 - 45, 115 - 65)),
        PointModel(id: "1-2", position: Vector2(115 - 0, 115 - 93)),
        PointModel(id: "1-3", position: Vector2(115 - 0, 115 + 0)),
        PointModel(id: "1-4", position: Vector2(115 - 0, 115 + 93)),
      ]
    },
  ),
  "2": NumberModel(
    image: "numbers/2.png",
    points: {
      1: [
        PointModel(id: "1-1", position: Vector2(115 - 50, 115 - 53)),
        PointModel(id: "1-2", position: Vector2(115 - 0, 115 - 90)),
        PointModel(id: "1-3", position: Vector2(115 + 50, 115 - 40)),
        PointModel(id: "1-4", position: Vector2(115 + 0, 115 + 30)),
        PointModel(id: "1-5", position: Vector2(115 - 50, 115 + 93)),
        PointModel(id: "1-6", position: Vector2(115 + 50, 115 + 93)),
      ]
    },
  ),
  "3": NumberModel(
    image: "numbers/3.png",
    points: {
      1: [
        PointModel(id: "1-1", position: Vector2(115 - 50, 115 - 56)),
        PointModel(id: "1-2", position: Vector2(115 - 0, 115 - 90)),
        PointModel(id: "1-3", position: Vector2(115 + 50, 115 - 40)),
        PointModel(id: "1-4", position: Vector2(115 + 5, 115 - 10)),
        PointModel(id: "1-5", position: Vector2(115 + 55, 115 + 40)),
        PointModel(id: "1-6", position: Vector2(115 + 0, 115 + 90)),
        PointModel(id: "1-7", position: Vector2(115 - 50, 115 + 56)),
      ],
    },
  ),
  "4": NumberModel(
    image: "numbers/4.png",
    points: {
      1: [
        PointModel(id: "1-1", position: Vector2(115 - 60, 115 - 90)),
        PointModel(id: "1-2", position: Vector2(115 - 60, 115 + 30)),
        PointModel(id: "1-3", position: Vector2(115 + 60, 115 + 30)),
      ],
      2: [
        PointModel(id: "2-1", position: Vector2(115 + 25, 115 - 90)),
        PointModel(id: "2-2", position: Vector2(115 + 25, 115 + 30)),
        PointModel(id: "2-3", position: Vector2(115 + 25, 115 + 90)),
      ],
    },
  ),
  "5": NumberModel(
    image: "numbers/5.png",
    points: {
      1: [
        PointModel(id: "1-1", position: Vector2(115 + 58, 115 - 90)),
        PointModel(id: "1-2", position: Vector2(115 - 60, 115 - 90)),
        PointModel(id: "1-3", position: Vector2(115 - 60, 115 + 0)),
        PointModel(id: "1-4", position: Vector2(115 - 0, 115 - 20)),
        PointModel(id: "1-5", position: Vector2(115 + 58, 115 + 30)),
        PointModel(id: "1-6", position: Vector2(115 - 0, 115 + 85)),
        PointModel(id: "1-7", position: Vector2(115 - 60, 115 + 70)),
      ]
    },
  ),
  "6": NumberModel(
    image: "numbers/6.png",
    points: {
      1: [
        PointModel(id: "1-1", position: Vector2(115 + 24, 115 - 88)),
        PointModel(id: "1-2", position: Vector2(115 - 34, 115 + 80)),
        PointModel(id: "1-3", position: Vector2(115 + 48, 115 + 6)),
        PointModel(id: "1-4", position: Vector2(115 - 34, 115 + 80)),
      ],
    },
  ),
  "7": NumberModel(
    image: "numbers/7.png",
    points: {
      1: [
        PointModel(id: "1-1", position: Vector2(115 - 60, 115 - 80)),
        PointModel(id: "1-2", position: Vector2(115 + 60, 115 - 80)),
        PointModel(id: "1-3", position: Vector2(115 + 40, 115 - 30)),
        PointModel(id: "1-4", position: Vector2(115 - 6, 115 + 80)),
      ],
      2: [
        PointModel(id: "2-1", position: Vector2(115 - 16, 115)),
        PointModel(id: "2-2", position: Vector2(115 + 68, 115)),
      ],
    },
  ),
  "8": NumberModel(
    image: "numbers/8.png",
    points: {
      1: [
        PointModel(id: "1-1", position: Vector2(115 - 10, 115 - 90)),
        PointModel(id: "1-2", position: Vector2(115, 115 - 10)),
        PointModel(id: "1-3", position: Vector2(115 + 60, 115 + 48)),
        PointModel(id: "1-4", position: Vector2(115 - 56, 115 + 26)),
        PointModel(id: "1-5", position: Vector2(115 + 50, 115 - 48)),
        PointModel(id: "1-6", position: Vector2(115 - 10, 115 - 90)),
      ],
    },
  ),
  "9": NumberModel(
    image: "numbers/9.png",
    points: {
      1: [
        PointModel(id: "1-1", position: Vector2(115 + 44, 115 - 58)),
        PointModel(id: "1-2", position: Vector2(115 - 26, 115 - 80)),
        PointModel(id: "1-3", position: Vector2(115, 115 + 22)),
        PointModel(id: "1-4", position: Vector2(115 + 44, 115 - 58)),
      ],
      2: [
        PointModel(id: "2-1", position: Vector2(115 + 44, 115 - 58)),
        PointModel(id: "2-2", position: Vector2(115 + 44, 115 + 80)),
      ]
    },
  ),
  "10": NumberModel(
    image: "numbers/10.png",
    points: {
      1: [
        PointModel(id: "1-1", position: Vector2(115 - 66, 115 - 60)),
        PointModel(id: "1-2", position: Vector2(115 - 42, 115 - 80)),
        PointModel(id: "1-3", position: Vector2(115 - 42, 115)),
        PointModel(id: "1-4", position: Vector2(115 - 42, 115 + 80)),
      ],
      2: [
        PointModel(id: "2-1", position: Vector2(115 + 30, 115 - 82)),
        PointModel(id: "2-2", position: Vector2(115 + 68, 115)),
        PointModel(id: "2-3", position: Vector2(115 + 30, 115 + 82)),
        PointModel(id: "2-4", position: Vector2(115 - 8, 115)),
        PointModel(id: "2-5", position: Vector2(115 + 30, 115 - 82)),
      ],
    },
  ),
};

class NumbersActivityState {
  final NumberModel number;

  NumbersActivityState({required this.number});

  NumbersActivityState.initialState()
      : number = numbers.entries.elementAt(0).value;
}
