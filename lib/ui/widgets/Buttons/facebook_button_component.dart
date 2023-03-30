import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/mixins/audio_mixin.dart';
import 'package:projeto_crianca/ui/widgets/buttons/button_component.dart';

class FacebookButtonWidget extends StatelessWidget with AudioMixin {
  final VoidCallback? onPressed;
  final String text;

  const FacebookButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
  });

  void _onTap() {
    playButtonClickAudio();
    if (onPressed != null) onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      icon: Ionicons.logo_facebook,
      text: text,
      full: true,
      backgroundColor: const Color(0xFF4267B2),
      borderColor: const Color(0xFF365592),
      textColor: Colors.white,
      onPressed: _onTap,
    );
  }
}
