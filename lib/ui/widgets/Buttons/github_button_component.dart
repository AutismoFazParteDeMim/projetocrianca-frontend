import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/mixins/audio_mixin.dart';
import 'package:projeto_crianca/ui/widgets/Buttons/button_component.dart';

class GitHubButtonWidget extends StatelessWidget with AudioMixin {
  final String text;
  final VoidCallback? onPressed;

  const GitHubButtonWidget({
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
      icon: Ionicons.logo_github,
      text: text,
      full: true,
      backgroundColor: const Color(0xFF313131),
      borderColor: const Color(0xFF202020),
      textColor: Colors.white,
      onPressed: _onTap,
    );
  }
}
