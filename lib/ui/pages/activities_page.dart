import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:projeto_crianca/ui/widgets/buttons/menu_button_component.dart';
import 'package:projeto_crianca/ui/widgets/appbar_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: "Atividades",
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
                    title: "Rotinas",
                    text:
                        "Trabalha antecipação dos acontecimentos no seu dia-a-dia faz com que criança se sinta segura, auxiliam na independência das crianças.",
                    image: const AssetImage("assets/icons/routines-icon.png"),
                    onPressed: () => Get.toNamed(AppRoutes.routines),
                  ),
                  SizedBox(height: metrics.gap),
                  MenuButtonWidget(
                    title: "Expressões",
                    text:
                        "Trabalha com apoio visual, contribui para uma melhor interação social com amigos e família.",
                    image:
                        const AssetImage("assets/icons/expressions-icon.png"),
                    onPressed: () => Get.toNamed(AppRoutes.expressions),
                  ),
                  SizedBox(height: metrics.gap),
                  MenuButtonWidget(
                    title: "Alfabeto",
                    text:
                        "Trabalha com apoio visual, contribui para uma melhor interação social com amigos e família.",
                    image: const AssetImage("assets/icons/alphabet-icon.png"),
                    onPressed: () => Get.toNamed(AppRoutes.alphabetActivity),
                  ),
                  SizedBox(height: metrics.gap),
                  MenuButtonWidget(
                    title: "Números",
                    text:
                        "Trabalha com apoio visual, contribui para uma melhor interação social com amigos e família.",
                    image: const AssetImage("assets/icons/numbers-icon.png"),
                    onPressed: () => Get.toNamed(AppRoutes.numbersActivity),
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
