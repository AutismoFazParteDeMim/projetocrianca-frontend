import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';
import 'package:projeto_crianca/ui/widgets/buttons/icon_button_component.dart';

class AppBarComponent extends PreferredSize {
  AppBarComponent({
    super.key,
    this.title,
    this.transparent,
    this.invertedColor,
    this.suffixChild,
  }) : super(
          child: Container(),
          preferredSize: const Size.fromHeight(100),
        );

  final String? title;
  final bool? transparent;
  final bool? invertedColor;
  final Widget? suffixChild;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final metrics = Theme.of(context).extension<ThemeMetrics>()!;
    final colors = Theme.of(context).extension<ThemeColors>()!;

    return Container(
      height: metrics.headerHeight,
      color: transparent == false ? colors.background : Colors.transparent,
      alignment: Alignment.bottomCenter,
      padding: metrics.padding,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            left: 0,
            child: IconButtonWidget(
              icon: Ionicons.arrow_back,
              onPressed: () => Get.back<void>(),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              child: suffixChild,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Text(
              title ?? '',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: invertedColor == true ? colors.onPrimary : colors.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
