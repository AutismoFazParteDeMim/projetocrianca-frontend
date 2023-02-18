import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class SwitchComponent extends StatefulWidget {
  final Function onChanged;
  final bool? isChecked;

  const SwitchComponent({super.key, required this.onChanged, this.isChecked});

  @override
  State<StatefulWidget> createState() => _SwitchComponentState();
}

class _SwitchComponentState extends State<SwitchComponent> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return Switch(
      activeColor: colors.primary,
      activeTrackColor: colors.primary,
      value: _isChecked,
      onChanged: (value) {
        setState(() {
          _isChecked = !_isChecked;
        });
        widget.onChanged(value);
      },
    );
  }
}
