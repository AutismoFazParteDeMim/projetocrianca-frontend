import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class LinkButtonComponent extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const LinkButtonComponent({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: colors.primary,
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
      child: Text(text),
    );
  }
}
