import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';
import 'package:projeto_crianca/ui/pages/games/pardecores/pardecores_game_engine.dart';

class ParDeCoresGamePage extends StatelessWidget {
  final ParDeCoresGameEngine _gameInstance = ParDeCoresGameEngine();

  ParDeCoresGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Pareamento de Cores",
        transparent: true,
        invertedColor: true,
      ),
      extendBodyBehindAppBar: true,
      body: GameWidget<ParDeCoresGameEngine>(game: _gameInstance),
    );
  }
}
