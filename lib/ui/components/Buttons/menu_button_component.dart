import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class MenuButtonComponent extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final String title;
  final ImageProvider image;

  const MenuButtonComponent({
    super.key,
    this.onPressed,
    required this.title,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeColors colors = theme.extension<ThemeColors>()!;
    final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;

    return SizedBox(
      height: 100,
      child: InkWell(
        onTap: onPressed,
        borderRadius: metrics.borderRadius,
        child: Ink(
          height: 60,
          padding: metrics.padding,
          decoration: BoxDecoration(
            borderRadius: metrics.borderRadius,
            color: colors.secondary,
            boxShadow: [
              BoxShadow(
                blurRadius: 0,
                color: colors.secondaryShadow,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: image,
                width: 54,
                height: 54,
              ),
              SizedBox(
                width: metrics.gap,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(text),
                  ],
                ),
              ),
              SizedBox(
                width: metrics.gap,
              ),
              const Icon(Ionicons.arrow_forward_outline),
            ],
          ),
        ),
      ),
    );
  }
}
