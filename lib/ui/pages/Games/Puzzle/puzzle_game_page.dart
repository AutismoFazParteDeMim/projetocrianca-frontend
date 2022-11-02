import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';
import 'package:projeto_crianca/ui/pages/Games/Puzzle/puzzle_game_engine.dart';

class PuzzleGamePage extends StatelessWidget {
  final PuzzleGameEngine _gameInstance = PuzzleGameEngine();

  PuzzleGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Quebra-cabeça",
        transparent: true,
        invertedColor: true,
      ),
      extendBodyBehindAppBar: true,
      body: GameWidget<PuzzleGameEngine>(game: _gameInstance),
    );
  }
}
