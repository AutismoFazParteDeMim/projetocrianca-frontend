import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/widgets/appbar_component.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/alphabet_activity_engine.dart';

class PointModel {
  final Vector2 position;

  PointModel({required this.position});
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
        PointModel(position: Vector2(115 + 52, 115 + 2)),
        PointModel(position: Vector2(115 - 52, 115 + 2)),
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
