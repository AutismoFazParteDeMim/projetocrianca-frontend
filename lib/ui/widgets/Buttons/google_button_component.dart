import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/mixins/audio_mixin.dart';
import 'package:projeto_crianca/ui/widgets/buttons/button_component.dart';

class GoogleButtonWidget extends StatelessWidget with AudioMixin {
  final String text;
  final VoidCallback? onPressed;

  const GoogleButtonWidget({
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
      icon: Ionicons.logo_google,
      text: text,
      full: true,
      color: ButtonWidgetColor.secoundary,
      onPressed: _onTap,
    );
  }
}
