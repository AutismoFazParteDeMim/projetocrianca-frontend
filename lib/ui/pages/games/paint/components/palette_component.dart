import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/games/paint_game_controller.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class PaletteComponent extends GetView<PaintGameController> {
  final void Function(Color) onColorChanged;
  const PaletteComponent({
    super.key,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;

    List<Color> rowColors1 = [
      Colors.black,
      Colors.grey,
      Colors.red,
      Colors.yellow,
      Colors.blue
    ];
    List<Color> rowColors2 = [
      Colors.green,
      Colors.purple,
      Colors.orange,
      Colors.cyan,
      Colors.brown,
    ];

    return Container(
      padding: metrics.padding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (final color in rowColors1)
                Obx(
                  () => _CircleColor(
                    color: color,
                    onPressed: () => onColorChanged(color),
                    isActives: color == controller.getColor,
                  ),
                ),
            ],
          ),
          SizedBox(height: metrics.gap),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (final color in rowColors2)
                Obx(
                  () => _CircleColor(
                    color: color,
                    onPressed: () => onColorChanged(color),
                    isActives: color == controller.getColor,
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}

class _CircleColor extends StatelessWidget {
  final Color color;
  final void Function() onPressed;
  final bool? isActives;

  const _CircleColor({
    required this.color,
    required this.onPressed,
    this.isActives,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeColors colors = theme.extension<ThemeColors>()!;

    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isActives == true ? colors.primary : Colors.transparent,
            width: 4,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        child: Ink(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: color,
          ),
        ),
      ),
    );
  }
}
