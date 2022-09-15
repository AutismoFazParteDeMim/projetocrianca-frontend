import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class ButtonComponent extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;
  final IconData? icon;
  final String? type;

  const ButtonComponent({
    super.key,
    required this.text,
    this.onPress,
    this.type,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    Color backgroundColor = colors.primary!;
    Color borderColor = colors.primaryShadow!;
    Color textColor = colors.onPrimary!;

    switch (type) {
      case "primary":
        backgroundColor = colors.primary!;
        borderColor = colors.primaryShadow!;
        textColor = colors.onPrimary!;
        break;
      case "secondary":
        backgroundColor = colors.secondary!;
        borderColor = colors.secondaryShadow!;
        textColor = colors.onSecondary!;
        break;
      default:
        backgroundColor = colors.primary!;
        borderColor = colors.primaryShadow!;
        textColor = colors.onPrimary!;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: RawMaterialButton(
        onPressed: onPress,
        fillColor: backgroundColor,
        padding: metrics.padding as EdgeInsetsGeometry,
        shape: Border(
          bottom: BorderSide(color: borderColor, width: 4),
        ),
        constraints: const BoxConstraints(
          minWidth: 250,
          maxWidth: 250,
          minHeight: 60,
          maxHeight: 60,
        ),
        textStyle: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon),
            SizedBox(width: metrics.gap),
            Text(text),
          ],
        ),
      ),
    );
  }
}
