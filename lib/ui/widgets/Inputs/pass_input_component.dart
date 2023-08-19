import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PassInputComponent extends StatefulWidget {
  const PassInputComponent({
    required this.placeholder,
    super.key,
    this.onChange,
    this.icon,
    this.action,
    this.validador,
    this.autofillHints,
    this.controller,
  });

  final String placeholder;
  final void Function(String value)? onChange;
  final IconData? icon;
  final TextInputAction? action;
  final TextEditingController? controller;
  final String? Function(String?)? validador;
  final Iterable<String>? autofillHints;

  @override
  State<PassInputComponent> createState() => _PassInputComponentState();
}

class _PassInputComponentState extends State<PassInputComponent> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      textInputAction: widget.action ?? TextInputAction.next,
      controller: widget.controller,
      obscureText: _isObscure,
      autofillHints: widget.autofillHints ?? [AutofillHints.password],
      onChanged: widget.onChange,
      validator: widget.validador,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
        suffixIcon: _isObscure
            ? IconButton(
                icon: const Icon(Ionicons.eye_outline),
                onPressed: () => setState(
                  () {
                    _isObscure = false;
                  },
                ),
              )
            : IconButton(
                icon: const Icon(Ionicons.eye_off_outline),
                onPressed: () => setState(
                  () {
                    _isObscure = true;
                  },
                ),
              ),
      ),
    );
  }
}
