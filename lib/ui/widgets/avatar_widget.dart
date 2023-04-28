import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';
import 'package:projeto_crianca/ui/widgets/svg_component.dart';

class _ChatWidget extends StatelessWidget {
  final String text;

  const _ChatWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Container(
      padding: metrics.padding,
      margin: EdgeInsets.only(top: metrics.gap),
      decoration: BoxDecoration(
        color: Colors.white,
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

  const AvatarWidget({
    super.key,
    required this.rawSvg,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 16,
          sigmaY: 16,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: metrics.padding.copyWith(
            top: metrics.padding.top + metrics.headerHeight,
          ),
          color: Colors.black.withOpacity(0.2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                child: SVGComponent(
                  width: 50,
                  height: 50,
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
      ),
    );
  }
}
