import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/mixins/audio_mixin.dart';
import 'package:projeto_crianca/ui/widgets/buttons/button_component.dart';

class GoogleButtonWidget extends StatelessWidget with AudioMixin {
  const GoogleButtonWidget({
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
      icon: Ionicons.logo_google,
      text: text,
      full: true,
      color: ButtonWidgetColor.secondary,
      onPressed: _onTap,
    );
  }
}
