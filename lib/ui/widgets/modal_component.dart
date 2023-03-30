import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class ModalComponent extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool? fill;

  const ModalComponent({
    super.key,
    required this.child,
    this.title,
    this.fill,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final ThemeData theme = Theme.of(context);
    final ThemeColors colors = theme.extension<ThemeColors>()!;
    final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;

    return Dialog(
      insetPadding: metrics.padding,
      child: Container(
        width: fill == true ? screenWidth : null,
        height: fill == true ? screenHeight : null,
        padding: metrics.padding,
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
        constraints: const BoxConstraints(
          minWidth: 100,
          minHeight: 100,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            child,
          ],
        ),
      ),
    );
  }
}
