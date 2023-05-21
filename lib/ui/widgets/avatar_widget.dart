import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';
import 'package:projeto_crianca/ui/widgets/svg_component.dart';

class _ChatWidget extends StatelessWidget {
  final String text;

  const _ChatWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Container(
      padding: metrics.padding,
      margin: EdgeInsets.only(top: metrics.gap),
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: metrics.borderRadius.copyWith(
          topLeft: const Radius.circular(0),
        ),
      ),
      child: Text(text),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  final String rawSvg;
  final String text;
  final bool isBackdrop;

  const AvatarWidget({
    super.key,
    required this.rawSvg,
    required this.text,
    this.isBackdrop = false,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return IgnorePointer(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: metrics.padding.copyWith(
          top: metrics.padding.top + metrics.headerHeight,
        ),
        color: isBackdrop ? Colors.black.withOpacity(0.6) : Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SVGComponent(
                width: 80,
                height: 80,
                rawSvg: rawSvg,
              ),
            ),
            SizedBox(width: metrics.gap),
            Expanded(
              child: _ChatWidget(text: text),
            ),
          ],
        ),
      ),
    );
  }
}
