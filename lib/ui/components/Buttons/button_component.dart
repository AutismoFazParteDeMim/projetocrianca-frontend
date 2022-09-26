import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

enum ButtonComponentType {
  primary,
  secoundary,
  danger,
  warning,
  success,
}

class ButtonComponent extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final IconData? icon;
  final ButtonComponentType? type;
  final bool? reversed;

  const ButtonComponent({
    super.key,
    required this.text,
    this.onPressed,
    this.type,
    this.icon,
    this.reversed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    Color backgroundColor = colors.primary;
    Color borderColor = colors.primaryShadow;
    Color textColor = colors.onPrimary;

    switch (type) {
      case ButtonComponentType.primary:
        backgroundColor = colors.primary;
        borderColor = colors.primaryShadow;
        textColor = colors.onPrimary;
        break;
      case ButtonComponentType.secoundary:
        backgroundColor = colors.secondary;
        borderColor = colors.secondaryShadow;
        textColor = colors.onSecondary;
        break;
      case ButtonComponentType.danger:
        backgroundColor = colors.error;
        borderColor = colors.errorShadow;
        textColor = colors.onPrimary;
        break;
      case ButtonComponentType.warning:
        backgroundColor = colors.warning;
        borderColor = colors.warningShadow;
        textColor = colors.onPrimary;
        break;
      case ButtonComponentType.success:
        backgroundColor = colors.success;
        borderColor = colors.sucessShadow;
        textColor = colors.onPrimary;
        break;
      default:
        backgroundColor = colors.primary;
        borderColor = colors.primaryShadow;
        textColor = colors.onPrimary;
    }

    final List<Widget> content = [
      if (icon != null) Icon(icon),
      if (icon != null) SizedBox(width: metrics.gap),
      Text(text),
    ];

    return Container(
      width: 250,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: metrics.borderRadius,
        boxShadow: [
          BoxShadow(
            blurRadius: 0,
            color: borderColor,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: RawMaterialButton(
        onPressed: onPressed,
        fillColor: backgroundColor,
        padding: metrics.padding,
        elevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: metrics.borderRadius),
        textStyle: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.up,
          children: reversed == true ? content.reversed.toList() : content,
        ),
      ),
    );
  }
}