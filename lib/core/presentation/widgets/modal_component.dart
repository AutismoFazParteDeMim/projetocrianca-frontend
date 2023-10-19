import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';

class ModalComponent extends StatelessWidget {
  const ModalComponent({
    required this.child,
    super.key,
    this.title,
    this.fill,
  });

  final Widget child;
  final String? title;
  final bool? fill;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    final colors = theme.extension<ThemeColors>()!;
    final metrics = theme.extension<ThemeMetrics>()!;

    return Dialog(
      insetPadding: metrics.padding,
      child: Container(
        width: fill == false ? null : screenWidth,
        height: fill == false ? null : screenHeight,
        padding: metrics.padding,
        decoration: BoxDecoration(
          borderRadius: metrics.borderRadius,
          color: colors.background,
          boxShadow: [
            BoxShadow(
              color: colors.secondaryShadow,
              offset: const Offset(0, 4),
            ),
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
              children: [
                const SizedBox(width: 24, height: 24),
                Text(
                  title ?? '',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge,
                ),
                IconButton(
                  onPressed: () => Get.back<void>(),
                  icon: const Icon(Ionicons.close_circle_outline),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints.tight(
                    const Size(24, 24),
                  ),
                  tooltip: 'Botão para fechar o modal',
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
