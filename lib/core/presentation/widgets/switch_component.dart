import 'package:flutter/material.dart';
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';

class SwitchComponent extends StatelessWidget {
  const SwitchComponent({
    required this.onChanged,
    super.key,
    this.isChecked,
  });

  final void Function({required bool isChecked}) onChanged;
  final bool? isChecked;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;

    return Switch(
      activeColor: colors.primary,
      activeTrackColor: colors.primary,
      value: isChecked == true && true,
      onChanged: (bool value) => onChanged(isChecked: value),
    );
  }
}
