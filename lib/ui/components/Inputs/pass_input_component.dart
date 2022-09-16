import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PassInputComponent extends StatelessWidget {
  final String placeholder;
  final Function onChange;
  final IconData? icon;
  final TextInputType? type;

  const PassInputComponent({
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
        suffixIcon: Icon(Ionicons.eye),
      ),
    );
  }
}
