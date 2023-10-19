// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';
import 'package:projeto_crianca/core/presentation/widgets/appbar_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/buttons/menu_button_component.dart';
import 'package:projeto_crianca/core/routes/app_routes.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: 'Atividades',
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
                    title: 'Rotinas',
                    text:
                        'Trabalha antecipação dos acontecimentos no seu dia-a-dia faz com que criança se sinta segura, auxiliam na independência das crianças.',
                    image: const AssetImage('assets/icons/routines-icon.png'),
                    onPressed: () => Get.toNamed<void>(AppRoutes.routines),
                  ),
                  SizedBox(height: metrics.gap),
                  MenuButtonWidget(
                    title: 'Expressões',
                    text:
                        'Trabalha com apoio visual, contribui para uma melhor interação social com amigos e família.',
                    image:
                        const AssetImage('assets/icons/expressions-icon.png'),
                    onPressed: () => Get.toNamed<void>(AppRoutes.expressions),
                  ),
                  SizedBox(height: metrics.gap),
                  MenuButtonWidget(
                    title: 'Alfabeto',
                    text:
                        'Trabalha com apoio visual, contribui para uma melhor interação social com amigos e família.',
                    image: const AssetImage('assets/icons/alphabet-icon.png'),
                    onPressed: () =>
                        Get.toNamed<void>(AppRoutes.alphabetActivity),
                  ),
                  SizedBox(height: metrics.gap),
                  MenuButtonWidget(
                    title: 'Números',
                    text:
                        'Trabalha com apoio visual, contribui para uma melhor interação social com amigos e família.',
                    image: const AssetImage('assets/icons/numbers-icon.png'),
                    onPressed: () =>
                        Get.toNamed<void>(AppRoutes.numbersActivity),
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
