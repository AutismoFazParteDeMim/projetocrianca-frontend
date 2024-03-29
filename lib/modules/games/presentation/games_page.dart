// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';
import 'package:projeto_crianca/core/presentation/widgets/appbar_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/buttons/menu_button_component.dart';
import 'package:projeto_crianca/core/routes/app_routes.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: 'Jogos',
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
                  MenuButtonWidget(
                    title: 'Jogo da Memória',
                    text:
                        'Trabalha raciocínio lógico das crianças de forma lúdica.',
                    image:
                        const AssetImage('assets/icons/jogodamemoria-icon.png'),
                    onPressed: () =>
                        Get.toNamed<void>(AppRoutes.memoryGame), //TEMP
                  ),
                  SizedBox(height: metrics.gap),
                  MenuButtonWidget(
                    title: 'Encaixar',
                    text:
                        'Trabalha o desenvolvimento das habilidades de raciocínio espacial, coordenação motora.',
                    image: const AssetImage('assets/icons/encaixar-icon.png'),
                    onPressed: () => Get.toNamed<void>(
                      AppRoutes.encaixarGame,
                    ),
                  ),
                  SizedBox(height: metrics.gap),
                  MenuButtonWidget(
                    title: 'Sombra',
                    text:
                        'Trabalha o desenvolvimento das habilidades de raciocínio espacial, coordenação motora.',
                    image: const AssetImage('assets/icons/sombra-icon.png'),
                    onPressed: () => Get.toNamed<void>(
                      AppRoutes.shadowGame,
                    ),
                  ),
                  SizedBox(height: metrics.gap),
                  MenuButtonWidget(
                    title: 'Quebra-cabeça',
                    text:
                        'Trabalha o desenvolvimento das habilidades de raciocínio espacial, coordenação motora.',
                    image:
                        const AssetImage('assets/icons/quebracabeca-icon.png'),
                    onPressed: () => Get.toNamed<void>(
                      AppRoutes.puzzleGame,
                    ),
                  ),
                  SizedBox(height: metrics.gap),
                  MenuButtonWidget(
                    title: 'Pareamento de Cores',
                    text:
                        'Trabalha o desenvolvimento das habilidades de raciocínio espacial, coordenação motora.',
                    image: const AssetImage('assets/icons/pardecores-icon.png'),
                    onPressed: () => Get.toNamed<void>(
                      AppRoutes.parDeCoresGame,
                    ),
                  ),
                  SizedBox(height: metrics.gap),
                  MenuButtonWidget(
                    title: 'Colorir',
                    text:
                        'Trabalha o desenvolvimento da criatividade e coordenação motora.',
                    image: const AssetImage('assets/icons/pardecores-icon.png'),
                    onPressed: () => Get.toNamed<void>(
                      AppRoutes.paintGame,
                    ),
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
