import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PassInputComponent extends StatefulWidget {
  final String placeholder;
  final Function onChange;
  final IconData? icon;
  final TextInputAction? action;

  const PassInputComponent({
    super.key,
    required this.placeholder,
    required this.onChange,
    this.icon,
    this.action,
  });

  @override
  State<PassInputComponent> createState() => _PassInputComponentState();
}

class _PassInputComponentState extends State<PassInputComponent> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String value) => widget.onChange(value),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: widget.action ?? TextInputAction.next,
      obscureText: _isObscure,
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
                )),
    );
  }
}
