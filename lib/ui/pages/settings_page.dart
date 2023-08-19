import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'package:projeto_crianca/controllers/settings_page_controller.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:projeto_crianca/services/auth_service.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';
import 'package:projeto_crianca/ui/widgets/appbar_component.dart';
import 'package:projeto_crianca/ui/widgets/buttons/button_component.dart';
import 'package:projeto_crianca/ui/widgets/switch_component.dart';

class _OptionComponent extends StatelessWidget {
  const _OptionComponent({
    required this.title,
    this.icon,
    this.action,
    this.onPressed,
  });

  final String title;
  final IconData? icon;
  final Widget? action;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<ThemeMetrics>()!;
    final colors = Theme.of(context).extension<ThemeColors>()!;

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

class SettingsPage extends GetView<SettingsPageController> {
  SettingsPage({super.key});

  final AuthService authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: 'Configurações',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: metrics.padding,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Aparência'),
                  SizedBox(height: metrics.gap),
                  _OptionComponent(
                    title: 'Modo escuro',
                    icon: Ionicons.contrast_outline,
                    action: Obx(
                      () => SwitchComponent(
                        isChecked: controller.getCurrentTheme == ThemeMode.dark,
                        onChanged: ({required bool isChecked}) =>
                            controller.changeTheme(
                          isDark: isChecked,
                        ),
                      ),
                    ),
                  ),
                  /*SizedBox(height: metrics.gap),
                  _OptionComponent(
                    title: 'Modo daltônico',
                    icon: Ionicons.color_filter_outline,
                    action: SwitchComponent(
                      onChanged: (bool value) => log(
                        value.toString(),
                      ),
                    ),
                  ),*/
                ],
              ),
              SizedBox(height: metrics.gap * 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Outros'),
                  SizedBox(height: metrics.gap),
                  _OptionComponent(
                    title: 'Sobre o projeto',
                    icon: Ionicons.information_circle_outline,
                    action: const Icon(Ionicons.arrow_forward_outline),
                    onPressed: () => Get.toNamed<void>(AppRoutes.about),
                  ),
                ],
              ),
              SizedBox(height: metrics.gap),
              ButtonWidget(
                text: 'Sair da conta',
                color: ButtonWidgetColor.danger,
                icon: Ionicons.log_out_outline,
                reversed: true,
                full: true,
                onPressed: authService.logOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
