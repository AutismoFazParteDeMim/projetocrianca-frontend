import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/ui/components/Buttons/icon_button_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class AppBarComponent extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String? title;
  final bool? transparent;
  final bool? invertedColor;

  AppBarComponent({
    super.key,
    this.title,
    this.transparent,
    this.invertedColor,
    this.preferredSize = const Size.fromHeight(100),
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;
    final ThemeColors colors = Theme.of(context).extension<ThemeColors>()!;

    return Container(
      height: metrics.headerHeight,
      color: transparent == true ? Colors.transparent : colors.background,
      alignment: Alignment.bottomCenter,
      padding: metrics.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButtonComponent(
            icon: Ionicons.arrow_back,
            onPressed: () => Get.back(),
          ),
          Text(
            title ?? "",
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: invertedColor == true ? colors.onPrimary : colors.text,
            ),
          ),
          const SizedBox(width: 50),
        ],
      ),
    );
  }
}
