import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';
import 'package:projeto_crianca/core/presentation/widgets/appbar_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/buttons/icon_button_component.dart';
import 'package:projeto_crianca/modules/games/games/paint/presentation/components/canva_component.dart';
import 'package:projeto_crianca/modules/games/games/paint/presentation/components/palette_component.dart';
import 'package:projeto_crianca/modules/games/games/paint/presentation/controllers/paint_game_controller.dart';

class PaintGamePage extends GetView<PaintGameController> {
  const PaintGamePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<ThemeColors>()!;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBarComponent(
        title: 'Colorir',
        transparent: false,
        invertedColor: false,
        suffixChild: IconButtonWidget(
          icon: Ionicons.trash,
          onPressed: () => controller.clearPoints(),
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: CanvaComponent(),
          ),
          PaletteComponent(
            onColorChanged: (color) => controller.setColor = color,
          ),
        ],
      ),
    );
  }
}
