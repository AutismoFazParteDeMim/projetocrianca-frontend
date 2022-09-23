import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:projeto_crianca/ui/components/Buttons/menu_button_component.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: "Games",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: metrics.padding,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: metrics.gap),
                  MenuButtonComponent(
                    title: "Quebra Cabeça",
                    text:
                        "Quebra-cabeça é um jogo onde um jogador deve resolver um problema proposto.",
                    image:
                        const AssetImage("assets/icons/quebraCabecaIcon.png"),
                    onPressed: () => {}, //TEMP
                  ),
                  SizedBox(height: metrics.gap),
                  MenuButtonComponent(
                    title: "Encaixar",
                    text:
                        "Encaixar é um jogo onde tem varias partes de uma figura e o jogador deve acertar onde vai cada parte.",
                    image: const AssetImage("assets/icons/encaixarIcon.png"),
                    onPressed: () => Get.toNamed(
                      AppRoutes.encaixarGame,
                    ), //TEMP
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
