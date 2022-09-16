import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class DialogComponent extends StatelessWidget {
  final Widget child;
  final String? title;

  const DialogComponent({super.key, required this.child, this.title});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeColors colors = theme.extension<ThemeColors>()!;
    final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;

    return Dialog(
      insetPadding: metrics.padding,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 200,
          maxHeight: 500,
        ),
        decoration: BoxDecoration(
          borderRadius: metrics.borderRadius,
          color: colors.background,
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              color: colors.secondaryShadow,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Padding(
          padding: metrics.padding,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 24, height: 24),
                  Text(
                    title ?? "",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge,
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Ionicons.close_circle_outline),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints.tight(
                      const Size(24, 24),
                    ),
                    tooltip: "Botão para fechar o modal",
                  ),
                ],
              ),
              SizedBox(height: metrics.gap),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
