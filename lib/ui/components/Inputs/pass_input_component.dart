import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PassInputComponent extends StatefulWidget {
  final String placeholder;
  final Function? onChange;
  final IconData? icon;
  final TextInputAction? action;
  final TextEditingController? controller;
  final Function? validador;
  final Iterable<String>? autofillHints;

  const PassInputComponent({
    super.key,
    required this.placeholder,
    this.onChange,
    this.icon,
    this.action,
    this.validador,
    this.autofillHints,
    this.controller,
  });

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
      onChanged: widget.onChange != null
          ? (String value) => widget.onChange!(value)
          : null,
      validator: widget.validador != null
          ? (String? value) => widget.validador!(value)
          : null,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
        suffixIcon: _isObscure
            ? IconButton(
                autofocus: false,
                icon: const Icon(Ionicons.eye_outline),
                onPressed: () => setState(
                  () {
                    _isObscure = false;
                  },
                ),
              )
            : IconButton(
                autofocus: false,
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
