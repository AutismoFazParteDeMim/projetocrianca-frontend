import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/controllers/auth_controller.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:projeto_crianca/ui/components/Buttons/button_component.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';
import 'package:projeto_crianca/ui/components/switch_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class _OptionComponent extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget? action;
  final VoidCallback? onPressed;

  const _OptionComponent({
    required this.title,
    this.icon,
    this.action,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return InkWell(
      onTap: onPressed,
      borderRadius: metrics.borderRadius,
      child: Ink(
        height: 60,
        padding: metrics.padding,
        decoration: BoxDecoration(
          borderRadius: metrics.borderRadius,
          color: colors.secondary,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(icon),
                  SizedBox(width: metrics.gap),
                  Text(title),
                ],
              ),
            ),
            if (action != null) action!,
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final authController = Get.find<AuthController>();

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: "Configurações",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: metrics.padding,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Aparência"),
                  SizedBox(height: metrics.gap),
                  _OptionComponent(
                    title: "Modo escuro",
                    icon: Ionicons.contrast_outline,
                    action: SwitchComponent(
                      onChanged: (bool value) {
                        if (value) {
                          Get.changeThemeMode(ThemeMode.dark);
                        } else {
                          Get.changeThemeMode(ThemeMode.light);
                        }
                      },
                    ),
                  ),
                  SizedBox(height: metrics.gap),
                  _OptionComponent(
                    title: "Modo daltônico",
                    icon: Ionicons.color_filter_outline,
                    action: SwitchComponent(
                      onChanged: (bool value) => log(
                        value.toString(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: metrics.gap * 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Outros"),
                  SizedBox(height: metrics.gap),
                  _OptionComponent(
                    title: "Sobre o projeto",
                    icon: Ionicons.information_circle_outline,
                    action: const Icon(Ionicons.arrow_forward_outline),
                    onPressed: () => Get.toNamed(AppRoutes.about),
                  ),
                ],
              ),
              SizedBox(height: metrics.gap),
              ButtonComponent(
                text: "Sair da conta",
                type: "danger",
                icon: Ionicons.log_out_outline,
                reverse: true,
                onPressed: () => authController.logOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
