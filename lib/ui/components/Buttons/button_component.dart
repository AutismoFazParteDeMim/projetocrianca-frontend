import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class ButtonComponent extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;
  final IconData? icon;
  final String? type;
  final bool? reverse;

  const ButtonComponent({
    super.key,
    required this.text,
    this.onPress,
    this.type,
    this.icon,
    this.reverse,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    Color backgroundColor = colors.primary;
    Color borderColor = colors.primaryShadow;
    Color textColor = colors.onPrimary;

    switch (type) {
      case "primary":
        backgroundColor = colors.primary;
        borderColor = colors.primaryShadow;
        textColor = colors.onPrimary;
        break;
      case "secondary":
        backgroundColor = colors.secondary;
        borderColor = colors.secondaryShadow;
        textColor = colors.onSecondary;
        break;
      default:
        backgroundColor = colors.primary;
        borderColor = colors.primaryShadow;
        textColor = colors.onPrimary;
    }

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
        onPressed: onPress,
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
        child: reverse == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(text),
                  if (icon != null) SizedBox(width: metrics.gap),
                  if (icon != null) Icon(icon),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (icon != null) Icon(icon),
                  if (icon != null) SizedBox(width: metrics.gap),
                  Text(text),
                ],
              ),
      ),
    );
  }
}
