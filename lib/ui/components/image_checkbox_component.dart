import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class ImageCheckboxComponent extends StatelessWidget {
  final Function? onChange;
  final bool isChecked;
  final ImageProvider image;
  final String? text;

  const ImageCheckboxComponent({
    super.key,
    required this.isChecked,
    required this.onChange,
    required this.image,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return InkWell(
      onTap: () {
        if (onChange != null) {
          onChange!(isChecked);
        }
      },
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
