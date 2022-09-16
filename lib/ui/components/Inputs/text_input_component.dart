import 'package:flutter/material.dart';

class TextInputComponent extends StatelessWidget {
  final String placeholder;
  final Function onChange;
  final IconData? icon;
  final TextInputType? type;

  const TextInputComponent({
    super.key,
    required this.placeholder,
    required this.onChange,
    this.icon,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String value) => onChange(value),
      keyboardType: type ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: placeholder,
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
    );
  }
}
