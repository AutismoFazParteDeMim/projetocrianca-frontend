import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/services/auth_service.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';
import 'package:projeto_crianca/ui/widgets/appbar_component.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/alphabet_activity_engine.dart';
import 'package:projeto_crianca/ui/widgets/avatar_widget.dart';
import 'package:projeto_crianca/ui/widgets/confetti_component.dart';

class AlphabetActivityPage extends StatelessWidget {
  final AuthService authService = Get.find<AuthService>();

  AlphabetActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: "Alfabeto",
        transparent: true,
        invertedColor: true,
      ),
      extendBodyBehindAppBar: true,
      body: GameWidget<AlphabetActivityEngine>(
        game: AlphabetActivityEngine(),
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
