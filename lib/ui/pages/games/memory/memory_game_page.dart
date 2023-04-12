import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';
import 'package:projeto_crianca/ui/widgets/appbar_component.dart';
import 'package:projeto_crianca/ui/pages/games/memory/memory_game_engine.dart';

class MemoryGamePage extends StatelessWidget {
  const MemoryGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeColors colors = theme.extension<ThemeColors>()!;
    //final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;

    return Scaffold(
      backgroundColor: colors.primary,
      appBar: AppBarComponent(
        title: "Jogo da Memória",
        transparent: true,
        invertedColor: true,
      ),
      extendBodyBehindAppBar: true,
      body: GameWidget<MemoryGameEngine>(
        game: MemoryGameEngine(),
      ),
    );
  }
}
