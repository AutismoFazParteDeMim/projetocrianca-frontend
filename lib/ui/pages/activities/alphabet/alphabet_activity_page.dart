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
  final Map<int, List<Vector2>> points;

  LetterModel({required this.image, required this.points});
}

final letters = {
  "N": LetterModel(
    image: "alphabet/N.png",
    points: {
      1: [
        Vector2(115 - 79, 115 + 100),
        Vector2(115 - 76, 115 - 100),
        Vector2(115 + 71, 115 + 102),
        Vector2(115 + 78, 115 - 102),
      ],
    },
  ),
  "O": LetterModel(
    image: "alphabet/O.png",
    points: {
      1: [
        Vector2(115, 115 - 104),
        Vector2(115, 115 - 104),
      ],
    },
  ),
  "P": LetterModel(
    image: "alphabet/P.png",
    points: {
      1: [
        Vector2(115 - 44, 115 - 104),
        Vector2(115 - 45, 115 + 5),
        Vector2(115 - 44, 115 + 104),
      ],
      2: [
        Vector2(115 - 45, 115 + 5),
        Vector2(115 - 44, 115 - 104),
      ],
    },
  ),
  "Q": LetterModel(
    image: "alphabet/Q.png",
    points: {
      1: [
        Vector2(115 - 4, 115 - 104),
        Vector2(115 - 4, 115 - 104),
      ],
      2: [
        Vector2(115 + 22, 115 + 18),
        Vector2(115 + 90, 115 + 96),
      ],
    },
  ),
  "R": LetterModel(
    image: "alphabet/R.png",
    points: {
      1: [
        Vector2(115 - 81, 115 - 104),
        Vector2(115 - 82, 115),
        Vector2(115 - 82, 115 + 100),
      ],
      2: [
        Vector2(115 - 81, 115 - 104),
        Vector2(115 - 82, 115),
        Vector2(115 + 60, 115 + 100),
      ],
    },
  ),
  "S": LetterModel(
    image: "alphabet/S.png",
    points: {
      1: [
        Vector2(115 + 56, 115 - 94),
        Vector2(115 - 70, 115 + 88),
      ],
    },
  ),
  "T": LetterModel(
    image: "alphabet/T.png",
    points: {
      1: [
        Vector2(115 - 82, 115 - 102),
        Vector2(115 - 1, 115 - 102),
        Vector2(115 + 84, 115 - 102),
      ],
      2: [
        Vector2(115 - 1, 115 - 102),
        Vector2(115 - 1, 115 + 102),
      ],
    },
  ),
  "U": LetterModel(
    image: "alphabet/U.png",
    points: {
      1: [
        Vector2(115 - 76, 115 - 102),
        Vector2(115 + 78, 115 - 104),
      ],
    },
  ),
  "V": LetterModel(
    image: "alphabet/V.png",
    points: {
      1: [
        Vector2(115 - 90, 115 - 104),
        Vector2(115, 115 + 100),
        Vector2(115 + 84, 115 - 104),
      ],
    },
  ),
  "W": LetterModel(
    image: "alphabet/W.png",
    points: {
      1: [
        Vector2(115 - 106, 115 - 106),
        Vector2(115 - 56, 115 + 98),
        Vector2(115 - 4, 115 - 106),
        Vector2(115 + 50, 115 + 98),
        Vector2(115 + 102, 115 - 106),
      ],
    },
  ),
  "X": LetterModel(
    image: "alphabet/X.png",
    points: {
      1: [
        Vector2(115 - 72, 115 - 106),
        Vector2(115 + 70, 115 + 104),
      ],
      2: [
        Vector2(115 + 70, 115 - 106),
        Vector2(115 - 72, 115 + 104),
      ],
    },
  ),
  "Y": LetterModel(
    image: "alphabet/Y.png",
    points: {
      1: [
        Vector2(115 - 80, 115 - 106),
        Vector2(115 - 2, 115 + 104),
      ],
      2: [
        Vector2(115 + 70, 115 - 106),
        Vector2(115 - 2, 115 + 104),
      ],
    },
  ),
  "Z": LetterModel(
    image: "alphabet/Z.png",
    points: {
      1: [
        Vector2(115 - 65, 115 - 104),
        Vector2(115 + 68, 115 - 102),
        Vector2(115 - 68, 115 + 102),
        Vector2(115 + 73, 115 + 104),
      ],
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
      setState(
        () {
          counter = 0;
          currentLetter = letters.entries.elementAt(0).value;
        },
      );
    } else {
      if (counter < letters.entries.length - 1) {
        setState(
          () {
            counter += 1;
            currentLetter = letters.entries.elementAt(counter).value;
          },
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
