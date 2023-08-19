import 'package:flutter/material.dart';
import 'package:projeto_crianca/mixins/audio_mixin.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class IconButtonWidget extends StatelessWidget with AudioMixin {
  const IconButtonWidget({
    required this.icon,
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final IconData icon;

  void _onTap() {
    playButtonClickAudio();
    onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: colors.secondaryShadow,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: RawMaterialButton(
        onPressed: _onTap,
        fillColor: colors.secondary,
        elevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Icon(icon),
      ),
    );
  }
}
