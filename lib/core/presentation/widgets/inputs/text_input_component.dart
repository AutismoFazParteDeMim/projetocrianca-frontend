import 'package:flutter/material.dart';

class TextInputComponent extends StatelessWidget {
  const TextInputComponent({
    required this.placeholder,
    super.key,
    this.onChange,
    this.icon,
    this.type,
    this.action,
    this.controller,
    this.validador,
    this.autofillHints,
  });

  final String placeholder;
  final void Function(String value)? onChange;
  final IconData? icon;
  final TextInputType? type;
  final TextInputAction? action;
  final TextEditingController? controller;
  final String? Function(String?)? validador;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      keyboardType: type ?? TextInputType.text,
      textInputAction: action ?? TextInputAction.next,
      controller: controller,
      autofillHints: autofillHints,
      validator: validador,
      decoration: InputDecoration(
        hintText: placeholder,
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
    );
  }
}
