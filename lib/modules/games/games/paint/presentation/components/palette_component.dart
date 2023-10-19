import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';
import 'package:projeto_crianca/modules/games/games/paint/presentation/controllers/paint_game_controller.dart';

class PaletteComponent extends GetView<PaintGameController> {
  const PaletteComponent({
    required this.onColorChanged,
    super.key,
  });

  final void Function(Color) onColorChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final metrics = theme.extension<ThemeMetrics>()!;

    final rowColors1 = <Color>[
      Colors.black,
      Colors.grey,
      Colors.red,
      Colors.yellow,
      Colors.blue,
    ];

    final rowColors2 = <Color>[
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
          ),
        ],
      ),
    );
  }
}

class _CircleColor extends StatelessWidget {
  const _CircleColor({
    required this.color,
    required this.onPressed,
    this.isActives,
  });

  final Color color;
  final void Function() onPressed;
  final bool? isActives;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<ThemeColors>()!;

    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isActives == false ? Colors.transparent : colors.primary,
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
