import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/widgets/appbar_component.dart';
import 'package:projeto_crianca/ui/pages/games/memory/memory_game_engine.dart';

class MemoryGamePage extends StatelessWidget {
  final MemoryGameEngine _gameInstance = MemoryGameEngine();

  MemoryGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Jogo da Memória",
        transparent: true,
        invertedColor: true,
      ),
      extendBodyBehindAppBar: true,
      body: GameWidget<MemoryGameEngine>(game: _gameInstance),
    );
  }
}
