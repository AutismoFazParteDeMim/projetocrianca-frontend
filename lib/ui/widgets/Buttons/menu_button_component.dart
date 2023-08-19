import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/mixins/audio_mixin.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class MenuButtonWidget extends StatelessWidget with AudioMixin {
  const MenuButtonWidget({
    required this.title,
    required this.text,
    required this.image,
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final String text;
  final String title;
  final ImageProvider image;

  void _onTap() {
    playButtonClickAudio();
    onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<ThemeColors>()!;
    final metrics = theme.extension<ThemeMetrics>()!;

    return SizedBox(
      height: 100,
      child: InkWell(
        onTap: _onTap,
        borderRadius: metrics.borderRadius,
        child: Ink(
          height: 60,
          padding: metrics.padding,
          decoration: BoxDecoration(
            borderRadius: metrics.borderRadius,
            color: colors.secondary,
            boxShadow: [
              BoxShadow(
                color: colors.secondaryShadow,
                offset: const Offset(0, 4),
              ),
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
                    Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
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
