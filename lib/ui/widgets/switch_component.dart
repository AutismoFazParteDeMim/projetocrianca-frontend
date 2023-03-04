import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class SwitchComponent extends StatelessWidget {
  final Function(bool value) onChanged;
  final bool? isChecked;

  const SwitchComponent({
    super.key,
    required this.onChanged,
    this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return Switch(
      activeColor: colors.primary,
      activeTrackColor: colors.primary,
      value: isChecked == true,
      onChanged: onChanged,
    );
  }
}
