import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

enum ButtonWidgetColor {
  primary,
  secoundary,
  danger,
  warning,
  success,
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final IconData? icon;
  final ButtonWidgetColor? color;
  final VoidCallback? onPressed;
  final bool? reversed;
  final bool? full;
  final bool? isLoading;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  const ButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
    this.icon,
    this.reversed,
    this.full,
    this.isLoading,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    Color backgroundcolor = colors.primary;
    Color bordercolor = colors.primaryShadow;
    Color textcolor = colors.onPrimary;

    switch (color) {
      case ButtonWidgetColor.primary:
        backgroundcolor = colors.primary;
        bordercolor = colors.primaryShadow;
        textcolor = colors.onPrimary;
        break;
      case ButtonWidgetColor.secoundary:
        backgroundcolor = colors.secondary;
        bordercolor = colors.secondaryShadow;
        textcolor = colors.onSecondary;
        break;
      case ButtonWidgetColor.danger:
        backgroundcolor = colors.error;
        bordercolor = colors.errorShadow;
        textcolor = colors.onPrimary;
        break;
      case ButtonWidgetColor.warning:
        backgroundcolor = colors.warning;
        bordercolor = colors.warningShadow;
        textcolor = colors.onPrimary;
        break;
      case ButtonWidgetColor.success:
        backgroundcolor = colors.success;
        bordercolor = colors.sucessShadow;
        textcolor = colors.onPrimary;
        break;
      default:
        backgroundcolor = backgroundColor ?? colors.primary;
        bordercolor = borderColor ?? colors.primaryShadow;
        textcolor = textColor ?? colors.onPrimary;
    }

    final List<Widget> content = [
      if (icon != null) Icon(icon, color: textcolor),
      if (icon != null) SizedBox(width: metrics.gap),
      Text(
        text,
        style: TextStyle(
          color: textcolor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];

    return InkWell(
      onTap: onPressed,
      splashColor: textcolor.withOpacity(0.1),
      borderRadius: metrics.borderRadius,
      child: Ink(
        width: full == true ? null : 200,
        padding: metrics.padding,
        decoration: BoxDecoration(
          color: backgroundcolor,
          borderRadius: metrics.borderRadius,
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              color: bordercolor,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: reversed == true ? content.reversed.toList() : content,
        ),
      ),
    );
  }
}
