import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/services/auth_service.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';
import 'package:projeto_crianca/ui/widgets/appbar_component.dart';
import 'package:projeto_crianca/ui/pages/games/memory/memory_game_engine.dart';
import 'package:projeto_crianca/ui/widgets/avatar_widget.dart';
import 'package:projeto_crianca/ui/widgets/confetti_component.dart';

class MemoryGamePage extends StatelessWidget {
  final AuthService authService = Get.find<AuthService>();

  MemoryGamePage({super.key});

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
        overlayBuilderMap: {
          "confetti": (context, game) => const ConfettiComponent(),
          "avatar": (context, game) {
            return Obx(
              () => AvatarWidget(
                rawSvg: authService.getCurrentChild?.photoURL ?? "",
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
