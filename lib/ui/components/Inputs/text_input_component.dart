import 'package:flutter/material.dart';

class TextInputComponent extends StatelessWidget {
  final String placeholder;
  final Function onChange;
  final IconData? icon;
  final TextInputType? type;
  final TextInputAction? action;

  const TextInputComponent({
    super.key,
    required this.placeholder,
    required this.onChange,
    this.icon,
    this.type,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String value) => onChange(value),
      keyboardType: type ?? TextInputType.text,
      textInputAction: action ?? TextInputAction.next,
      decoration: InputDecoration(
        hintText: placeholder,
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
    );
  }
}
