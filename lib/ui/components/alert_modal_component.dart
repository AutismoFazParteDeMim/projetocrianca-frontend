import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

enum AlertModalComponentType {
  error,
  warning,
  success,
}

class AlertModalComponent extends StatelessWidget {
  final String title;
  final String message;
  final AlertModalComponentType? type;

  const AlertModalComponent({
    super.key,
    required this.title,
    required this.message,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeColors colors = theme.extension<ThemeColors>()!;
    final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;

    Color backgroundColor = colors.primary;
    Color borderColor = colors.primaryShadow;
    Color textColor = colors.onPrimary;

    switch (type) {
      case AlertModalComponentType.error:
        backgroundColor = colors.error;
        borderColor = colors.errorShadow;
        textColor = colors.onError;
        break;
      case AlertModalComponentType.warning:
        backgroundColor = colors.warning;
        borderColor = colors.warningShadow;
        textColor = colors.onWarning;
        break;
      case AlertModalComponentType.success:
        backgroundColor = colors.success;
        borderColor = colors.sucessShadow;
        textColor = colors.onSuccess;
        break;
      default:
        backgroundColor = colors.success;
        borderColor = colors.sucessShadow;
        textColor = colors.onSuccess;
    }

    return Dialog(
      insetPadding: metrics.padding,
      child: Container(
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: metrics.borderRadius,
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              color: borderColor,
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
                    title,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: textColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Ionicons.close_circle_outline,
                      color: textColor,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints.tight(
                      const Size(24, 24),
                    ),
                    tooltip: "Botão para fechar o modal",
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
