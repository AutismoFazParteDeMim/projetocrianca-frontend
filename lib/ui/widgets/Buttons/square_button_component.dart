import 'package:flutter/material.dart';
import 'package:projeto_crianca/mixins/audio_mixin.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class SquareButtonWidget extends StatelessWidget with AudioMixin {
  final VoidCallback? onPressed;
  final String text;
  final ImageProvider image;

  const SquareButtonWidget({
    super.key,
    this.onPressed,
    required this.text,
    required this.image,
  });

  void _onTap() {
    playButtonClickAudio();
    if (onPressed != null) onPressed!();
  }

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
        onPressed: _onTap,
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
