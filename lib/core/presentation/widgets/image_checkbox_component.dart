import 'package:flutter/material.dart';
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';

class ImageCheckboxComponent extends StatelessWidget {
  const ImageCheckboxComponent({
    required this.isChecked,
    required this.onChange,
    required this.image,
    super.key,
    this.text,
  });

  final void Function({required bool isChecked})? onChange;
  final bool isChecked;
  final ImageProvider image;
  final String? text;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ThemeColors>()!;

    return InkWell(
      onTap: () => onChange?.call(isChecked: isChecked),
      child: Column(
        children: [
          AnimatedContainer(
            width: 80,
            height: 80,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              border: Border.all(
                color: isChecked ? colors.primary : Colors.transparent,
                width: 2,
              ),
            ),
            child: Image(
              width: 80,
              height: 80,
              image: image,
              fit: BoxFit.cover,
            ),
          ),
          if (text != null) Text(text!),
        ],
      ),
    );
  }
}
