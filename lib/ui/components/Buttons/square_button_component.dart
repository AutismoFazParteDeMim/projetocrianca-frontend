import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class SquareButtonComponent extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final ImageProvider image;

  const SquareButtonComponent({
    super.key,
    this.onPressed,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: metrics.borderRadius,
        boxShadow: [
          BoxShadow(
            blurRadius: 0,
            color: colors.secondaryShadow,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: RawMaterialButton(
        onPressed: onPressed,
        fillColor: colors.secondary,
        padding: metrics.padding,
        elevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: metrics.borderRadius),
        textStyle: TextStyle(
          color: colors.text,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              width: 60,
              height: 60,
              image: image,
            ),
            SizedBox(height: metrics.gap),
            Text(text),
          ],
        ),
      ),
    );
  }
}
