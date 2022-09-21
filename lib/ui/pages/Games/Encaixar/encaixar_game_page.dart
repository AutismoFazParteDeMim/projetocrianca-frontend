import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';
import 'package:projeto_crianca/ui/pages/Games/Encaixar/engine/encaixar_game_engine.dart';

final EncaixarGameEngine _gameInstance = EncaixarGameEngine();

class EncaixarGamePage extends StatelessWidget {
  const EncaixarGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Encaixar",
        transparent: true,
        invertedColor: true,
      ),
      extendBodyBehindAppBar: true,
      body: GameWidget<EncaixarGameEngine>(game: _gameInstance),
    );
  }
}
