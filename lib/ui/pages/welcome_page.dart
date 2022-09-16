import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:projeto_crianca/ui/components/Buttons/button_component.dart';
import 'package:projeto_crianca/ui/components/Buttons/link_button_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class WelcomePage extends GetView {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;
    final ThemeColors colors = theme.extension<ThemeColors>()!;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              color: colors.primary,
              alignment: Alignment.center,
              padding: metrics.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bem-Vindo(a)!",
                    style: theme.textTheme.headlineMedium
                        ?.copyWith(color: colors.onPrimary),
                  ),
                  SizedBox(height: metrics.gap * 2),
                  Text(
                    "Seja bem-vindo ao aplicativo do projeto Autismo Faz Parte de Mim.",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium
                        ?.copyWith(color: colors.onPrimary),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: metrics.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonComponent(
                    text: "Fazer login",
                    onPress: () => Get.toNamed(AppRoutes.login),
                  ),
                  SizedBox(height: metrics.gap),
                  ButtonComponent(
                    text: "Cadastre-se",
                    type: "secondary",
                    onPress: () => Get.toNamed(AppRoutes.register),
                  ),
                  SizedBox(height: metrics.gap),
                  LinkButtonComponent(
                    text: "Política de privacidade",
                    onPressed: () => {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
