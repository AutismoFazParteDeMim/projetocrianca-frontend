import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';
import 'package:projeto_crianca/core/presentation/widgets/appbar_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/avatar_widget.dart';
import 'package:projeto_crianca/core/presentation/widgets/confetti_component.dart';
import 'package:projeto_crianca/core/services/auth_service.dart';
import 'package:projeto_crianca/modules/games/games/puzzle/puzzle_game_engine.dart';

class PuzzleGamePage extends StatelessWidget {
  PuzzleGamePage({super.key});

  final AuthService authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: 'Quebra-cabeça',
        transparent: true,
        invertedColor: true,
      ),
      extendBodyBehindAppBar: true,
      body: GameWidget<PuzzleGameEngine>(
        game: PuzzleGameEngine(),
        overlayBuilderMap: {
          'confetti': (context, game) => const ConfettiComponent(),
          'avatar': (context, game) {
            return Obx(
              () => AvatarWidget(
                rawSvg: authService.getCurrentChild?.photoURL ?? '',
                text: game.avatarMessage,
              ),
            );
          },
        },
        backgroundBuilder: (BuildContext context) => Container(
          color: colors.background,
        ),
      ),
    );
  }
}
