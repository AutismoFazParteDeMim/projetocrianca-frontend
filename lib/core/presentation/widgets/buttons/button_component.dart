// ignore_for_file: no_default_cases

import 'package:flutter/material.dart';
import 'package:projeto_crianca/core/mixins/audio_mixin.dart';
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';

enum ButtonWidgetColor {
  primary,
  secondary,
  danger,
  warning,
  success,
}

class ButtonWidget extends StatelessWidget with AudioMixin {
  const ButtonWidget({
    required this.text,
    super.key,
    this.onPressed,
    this.color,
    this.icon,
    this.reversed,
    this.full,
    this.isLoading,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
  });

  final String text;
  final IconData? icon;
  final ButtonWidgetColor? color;
  final VoidCallback? onPressed;
  final bool? reversed;
  final bool? full;
  final bool? isLoading;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  void _onTap() {
    playButtonClickAudio();
    onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<ThemeMetrics>()!;
    final colors = Theme.of(context).extension<ThemeColors>()!;

    var backgroundcolor = colors.primary;
    var bordercolor = colors.primaryShadow;
    var textcolor = colors.onPrimary;

    switch (color) {
      case ButtonWidgetColor.primary:
        backgroundcolor = colors.primary;
        bordercolor = colors.primaryShadow;
        textcolor = colors.onPrimary;
      case ButtonWidgetColor.secondary:
        backgroundcolor = colors.secondary;
        bordercolor = colors.secondaryShadow;
        textcolor = colors.onSecondary;
      case ButtonWidgetColor.danger:
        backgroundcolor = colors.error;
        bordercolor = colors.errorShadow;
        textcolor = colors.onPrimary;
      case ButtonWidgetColor.warning:
        backgroundcolor = colors.warning;
        bordercolor = colors.warningShadow;
        textcolor = colors.onPrimary;
      case ButtonWidgetColor.success:
        backgroundcolor = colors.success;
        bordercolor = colors.successShadow;
        textcolor = colors.onPrimary;
      default:
        backgroundcolor = backgroundColor ?? colors.primary;
        bordercolor = borderColor ?? colors.primaryShadow;
        textcolor = textColor ?? colors.onPrimary;
    }

    final content = <Widget>[
      if (icon != null) Icon(icon, color: textcolor),
      if (icon != null) SizedBox(width: metrics.gap),
      Text(
        text,
        style: TextStyle(
          color: textcolor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: metrics.borderRadius,
        boxShadow: [
          BoxShadow(
            color: bordercolor,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: _onTap,
          splashColor: textcolor.withOpacity(0.1),
          borderRadius: metrics.borderRadius,
          child: Ink(
            width: full == true ? null : 200,
            padding: metrics.padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: reversed == true ? content.reversed.toList() : content,
            ),
          ),
        ),
      ),
    );
  }
}
