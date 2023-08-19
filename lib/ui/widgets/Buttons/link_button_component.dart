import 'package:flutter/material.dart';
import 'package:projeto_crianca/mixins/audio_mixin.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class LinkButtonWidget extends StatelessWidget with AudioMixin {
  const LinkButtonWidget({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;

  void _onTap() {
    playButtonClickAudio();
    onPressed();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;

    return TextButton(
      onPressed: _onTap,
      style: TextButton.styleFrom(
        foregroundColor: colors.primary,
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
        elevation: 0,
      ),
      child: Text(text),
    );
  }
}
