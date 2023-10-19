import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/core/mixins/audio_mixin.dart';
import 'package:projeto_crianca/core/presentation/widgets/Buttons/button_component.dart';

class FacebookButtonWidget extends StatelessWidget with AudioMixin {
  const FacebookButtonWidget({
    required this.text,
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final String text;

  void _onTap() {
    playButtonClickAudio();
    onPressed?.call();
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
