import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/alphabet_activity_engine.dart';

class PointModel {
  final Vector2 positionTop;
  final Vector2 positionBottom;

  PointModel({required this.positionTop, required this.positionBottom});
}

class LetterModel {
  final List<List<PointModel>> points;

  LetterModel({required this.points});
}

class GameBloc extends Cubit {
  int current = 0;
  final List<LetterModel> letters = [
    LetterModel(
      points: [
        [
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
        [
          PointModel(
            positionTop: Vector2(126, 388),
            positionBottom: Vector2(150, 412),
          ),
          PointModel(
            positionTop: Vector2(210, 388),
            positionBottom: Vector2(234, 412),
          ),
        ]
      ],
    ),
  ];

  GameBloc() : super([]);

  LetterModel getCurrentLetter() {
    return letters[current];
  }

  void getLetter() {
    emit(letters[current]);
  }

  void nextLetter() {
    current = current + 1;
    emit(letters[current]);
  }
}

class _GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameBloc = context.read<GameBloc>();
    return GameWidget<AlphabetActivityEngine>(
      game: AlphabetActivityEngine(gameBloc: gameBloc),
    );
  }
}

class AlphabetActivityPage extends StatelessWidget {
  const AlphabetActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Alfabeto",
        transparent: true,
        invertedColor: true,
      ),
      extendBodyBehindAppBar: true,
      body: BlocProvider(
        create: (_) => GameBloc(),
        child: _GameView(),
      ),
    );
  }
}
