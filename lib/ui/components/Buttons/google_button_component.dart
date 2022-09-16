import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class GoogleButtonComponent extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;

  const GoogleButtonComponent({
    super.key,
    required this.text,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: metrics.borderRadius,
        boxShadow: [
          BoxShadow(
            blurRadius: 0,
            color: colors.secondary,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: RawMaterialButton(
        onPressed: onPress,
        fillColor: const Color(0xFFFCFCFC),
        padding: metrics.padding,
        elevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: metrics.borderRadius),
        textStyle: TextStyle(
          color: colors.text,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Ionicons.logo_google),
            SizedBox(width: metrics.gap),
            Text(text),
          ],
        ),
      ),
    );
  }
}
