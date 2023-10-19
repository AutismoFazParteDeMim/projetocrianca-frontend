import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/core/mixins/audio_mixin.dart';
import 'package:projeto_crianca/core/presentation/widgets/Buttons/button_component.dart';

class GitHubButtonWidget extends StatelessWidget with AudioMixin {
  const GitHubButtonWidget({
    required this.text,
    super.key,
    this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  void _onTap() {
    playButtonClickAudio();
    onPressed?.call();
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
