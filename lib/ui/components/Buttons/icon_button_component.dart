import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class IconButtonComponent extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;

  const IconButtonComponent({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return RawMaterialButton(
      onPressed: onPressed,
      constraints: const BoxConstraints(
        minWidth: 50,
        minHeight: 50,
        maxWidth: 50,
        maxHeight: 50,
      ),
      fillColor: colors.secondary,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Icon(icon),
    );
  }
}
