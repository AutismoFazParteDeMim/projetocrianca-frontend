import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:projeto_crianca/ui/components/Buttons/menu_button_component.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';
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
                  MenuButtonComponent(
                    title: "Rotinas",
                    text:
                        "Trabalha estabelecer a relação do numero com a quantidade e percepção visual, etc.",
                    image: const AssetImage("assets/icons/routines-icon.png"),
                    onPressed: () => Get.toNamed(AppRoutes.routines),
                  ),
                  SizedBox(height: metrics.gap),
                  MenuButtonComponent(
                    title: "Expressões",
                    text:
                        "Trabalha estabelecer a relação do numero com a quantidade e percepção visual, etc.",
                    image:
                        const AssetImage("assets/icons/expressions-icon.png"),
                    onPressed: () => Get.toNamed(AppRoutes.expressions),
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
