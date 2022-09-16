import 'package:flutter/material.dart';

class TextInputComponent extends StatelessWidget {
  final String placeholder;
  final Function? onChange;
  final IconData? icon;
  final TextInputType? type;
  final TextInputAction? action;
  final TextEditingController? controller;
  final Function? validador;
  final Iterable<String>? autofillHints;

  const TextInputComponent({
    super.key,
    required this.placeholder,
    this.onChange,
    this.icon,
    this.type,
    this.action,
    this.controller,
    this.validador,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange != null ? (String value) => onChange!(value) : null,
      keyboardType: type ?? TextInputType.text,
      textInputAction: action ?? TextInputAction.next,
      controller: controller,
      autofillHints: autofillHints,
      validator:
          validador != null ? (String? value) => validador!(value) : null,
      decoration: InputDecoration(
        hintText: placeholder,
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
    );
  }
}
