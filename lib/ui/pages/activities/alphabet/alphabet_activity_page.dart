import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/widgets/appbar_component.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/alphabet_activity_engine.dart';

class PointModel {
  final Vector2 positionTop;
  final Vector2 positionBottom;

  PointModel({required this.positionTop, required this.positionBottom});
}

class LetterModel {
  final String image;
  final Map<int, List<PointModel>> points;

  LetterModel({required this.image, required this.points});
}

final letters = {
  "A": LetterModel(
    image: "alphabet/A.png",
    points: {
      1: [
        PointModel(
          positionTop: Vector2(88, 478),
          positionBottom: Vector2(112, 502),
        ),
        PointModel(
          positionTop: Vector2(126, 388),
          positionBottom: Vector2(150, 412),
        ),
        PointModel(
          positionTop: Vector2(168, 296),
          positionBottom: Vector2(192, 320),
        ),
        PointModel(
          positionTop: Vector2(210, 388),
          positionBottom: Vector2(234, 412),
        ),
        PointModel(
          positionTop: Vector2(248, 478),
          positionBottom: Vector2(272, 502),
        ),
      ],
      2: [
        PointModel(
          positionTop: Vector2(126, 388),
          positionBottom: Vector2(150, 412),
        ),
        PointModel(
          positionTop: Vector2(210, 388),
          positionBottom: Vector2(234, 412),
        ),
      ]
    },
  ),
  "B": LetterModel(
    image: "alphabet/B.png",
    points: {
      1: [
        PointModel(
          positionTop: Vector2(88, 478),
          positionBottom: Vector2(112, 502),
        ),
        PointModel(
          positionTop: Vector2(126, 388),
          positionBottom: Vector2(150, 412),
        ),
        PointModel(
          positionTop: Vector2(168, 296),
          positionBottom: Vector2(192, 320),
        ),
        PointModel(
          positionTop: Vector2(210, 388),
          positionBottom: Vector2(234, 412),
        ),
        PointModel(
          positionTop: Vector2(248, 478),
          positionBottom: Vector2(272, 502),
        ),
      ],
      2: [
        PointModel(
          positionTop: Vector2(126, 388),
          positionBottom: Vector2(150, 412),
        ),
        PointModel(
          positionTop: Vector2(210, 388),
          positionBottom: Vector2(234, 412),
        ),
      ]
    },
  ),
};

class AlphabetActivityPage extends StatefulWidget {
  const AlphabetActivityPage({super.key});

  @override
  State<StatefulWidget> createState() => _AlphabetActivityPageState();
}

class _AlphabetActivityPageState extends State<AlphabetActivityPage> {
  int counter = 0;

  LetterModel currentLetter = letters.entries.elementAt(0).value;

  void nextLetterCallback() {
    if (counter == letters.entries.length - 1) {
      print("Fim de Jogo");
      counter = 0;
      setState(
        () => currentLetter = letters.entries.elementAt(counter).value,
      );
    } else {
      if (counter < letters.entries.length - 1) {
        counter += 1;
        setState(
          () => currentLetter = letters.entries.elementAt(counter).value,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Alfabeto",
        transparent: true,
        invertedColor: false,
      ),
      extendBodyBehindAppBar: true,
      body: GameWidget<AlphabetActivityEngine>(
        game: AlphabetActivityEngine(
          currentLetter: currentLetter,
          nextLetterCallback: nextLetterCallback,
        ),
      ),
    );
  }
}
