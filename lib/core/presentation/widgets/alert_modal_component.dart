// ignore_for_file: no_default_cases

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';

enum AlertModalComponentType {
  error,
  warning,
  success,
}

class AlertModalComponent extends StatelessWidget {
  const AlertModalComponent({
    required this.title,
    required this.message,
    super.key,
    this.type,
  });

  final String title;
  final String message;
  final AlertModalComponentType? type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<ThemeColors>()!;
    final metrics = theme.extension<ThemeMetrics>()!;

    var backgroundColor = colors.primary;
    var borderColor = colors.primaryShadow;
    var textColor = colors.onPrimary;

    switch (type) {
      case AlertModalComponentType.error:
        backgroundColor = colors.error;
        borderColor = colors.errorShadow;
        textColor = colors.onError;
      case AlertModalComponentType.warning:
        backgroundColor = colors.warning;
        borderColor = colors.warningShadow;
        textColor = colors.onWarning;
      case AlertModalComponentType.success:
        backgroundColor = colors.success;
        borderColor = colors.successShadow;
        textColor = colors.onSuccess;
      default:
        backgroundColor = colors.success;
        borderColor = colors.successShadow;
        textColor = colors.onSuccess;
    }

    return Dialog(
      insetPadding: metrics.padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: metrics.padding,
            decoration: BoxDecoration(
              borderRadius: metrics.borderRadius,
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: borderColor,
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
                      title,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: textColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.back<void>(),
                      icon: Icon(
                        Ionicons.close_circle_outline,
                        color: textColor,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints.tight(
                        const Size(24, 24),
                      ),
                      tooltip: 'Botão para fechar o modal',
                    ),
                  ],
                ),
                SizedBox(height: metrics.gap),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      type == AlertModalComponentType.error
                          ? Ionicons.stop_circle_outline
                          : type == AlertModalComponentType.warning
                              ? Ionicons.warning_outline
                              : Ionicons.checkmark_done_circle_outline,
                      size: 54,
                      color: textColor,
                    ),
                    SizedBox(height: metrics.gap),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
