import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/widgets/appbar_component.dart';
import 'package:projeto_crianca/ui/pages/games/sombra/sombra_game_engine.dart';

class SombraGamePage extends StatelessWidget {
  final SombraGameEngine _gameInstance = SombraGameEngine();

  SombraGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Sombra",
        transparent: true,
        invertedColor: true,
      ),
      extendBodyBehindAppBar: true,
      body: GameWidget<SombraGameEngine>(game: _gameInstance),
    );
  }
}
