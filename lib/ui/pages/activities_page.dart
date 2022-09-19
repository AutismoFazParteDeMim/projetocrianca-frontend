import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:projeto_crianca/ui/components/Buttons/button_component.dart';
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
                        title: "titulo",
                        text: "Descricao",
                        image: const AssetImage("assets/login.png"),
                        onPressed: () => Get.toNamed(AppRoutes.home), //TEMP
                      ),
                      SizedBox(height: metrics.gap),
                      ButtonComponent(
                        text: "Sobre o projeto",
                        type: ButtonComponentType.secoundary,
                        icon: Ionicons.information_circle_outline,
                        onPressed: () => Get.toNamed(AppRoutes.home), //TEMP
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: metrics.gap),
                      ButtonComponent(
                        text: "Sobre o projeto",
                        type: ButtonComponentType.secoundary,
                        icon: Ionicons.information_circle_outline,
                        onPressed: () => Get.toNamed(AppRoutes.home), //TEMP
                      ),
                    ],
                  ),
                  SizedBox(height: metrics.gap),
                  ButtonComponent(
                    text: "Sobre o projeto",
                    type: ButtonComponentType.secoundary,
                    icon: Ionicons.information_circle_outline,
                    onPressed: () => Get.toNamed(AppRoutes.home), //TEMP
                  ),
                ],
              ))),
    );
  }
}
