import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'package:projeto_crianca/controllers/avatar_page_controller.dart';
import 'package:projeto_crianca/data/models/avatar_model.dart';
import 'package:projeto_crianca/ui/components/Buttons/button_component.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';
import 'package:projeto_crianca/ui/components/svg_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class _SectionComponent extends StatelessWidget {
  final AvatarPageController _controller = Get.find<AvatarPageController>();

  final String title;
  final List<Map<String, dynamic>> data;

  _SectionComponent({
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeColors colors = theme.extension<ThemeColors>()!;
    final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium,
        ),
        SizedBox(height: metrics.gap),
        LayoutGrid(
          columnSizes: [1.fr, 1.fr, 1.fr, 1.fr],
          rowSizes: [60.px, 60.px, 60.px],
          columnGap: metrics.gap,
          rowGap: metrics.gap,
          children: data
              .map(
                (e) => Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () => _controller.getAvatar(e["style"]),
                    borderRadius: metrics.borderRadius,
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: metrics.borderRadius,
                        color: colors.secondary,
                      ),
                      child: Image(
                        width: 60,
                        height: 60,
                        image: AssetImage(e["asset"]!),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class AvatarPage extends GetView<AvatarPageController> {
  static final List<Map<String, dynamic>> _hairStyles = [
    {
      "style": AvatarModelHairType.bowlCutHair,
      "asset": "assets/avatar/hair/bowlCutHair.png"
    },
    {
      "style": AvatarModelHairType.froBun,
      "asset": "assets/avatar/hair/froBun.png"
    },
    {
      "style": AvatarModelHairType.shortHair,
      "asset": "assets/avatar/hair/shortHair.png"
    },
    {
      "style": AvatarModelHairType.curlyShortHair,
      "asset": "assets/avatar/hair/shortHairCurly.png"
    },
    {
      "style": AvatarModelHairType.straightHair,
      "asset": "assets/avatar/hair/straightHair.png"
    },
    {
      "style": AvatarModelHairType.wavyBob,
      "asset": "assets/avatar/hair/wavyBob.png"
    }
  ];

  static final List<Map<String, dynamic>> _eyeStyles = [
    {
      "style": AvatarModelEye.cheery,
      "asset": "assets/avatar/eye/cheeryEyes.png",
    },
    {
      "style": AvatarModelEye.confused,
      "asset": "assets/avatar/eye/confusedEyes.png",
    },
    {
      "style": AvatarModelEye.normal,
      "asset": "assets/avatar/eye/normalEyes.png",
    },
    {
      "style": AvatarModelEye.sleepy,
      "asset": "assets/avatar/eye/sleepyEyes.png",
    },
    {
      "style": AvatarModelEye.starstruck,
      "asset": "assets/avatar/eye/starstruckEyes.png",
    },
    {
      "style": AvatarModelEye.winking,
      "asset": "assets/avatar/eye/winkingEyes.png",
    }
  ];

  static final List<Map<String, dynamic>> _accessories = [
    {
      "style": AvatarModelAccessories.catEars,
      "asset": "assets/avatar/objects/catEars.png",
    },
    {
      "style": AvatarModelAccessories.clownNose,
      "asset": "assets/avatar/objects/clownNose.png",
    },
    {
      "style": AvatarModelAccessories.faceMask,
      "asset": "assets/avatar/objects/faceMask.png",
    },
    {
      "style": AvatarModelAccessories.glasses,
      "asset": "assets/avatar/objects/glasses.png",
    },
    {
      "style": AvatarModelAccessories.sailormoonCrown,
      "asset": "assets/avatar/objects/sailormoonCrown.png",
    },
    {
      "style": AvatarModelAccessories.sunglasses,
      "asset": "assets/avatar/objects/sunglasses.png",
    }
  ];

  static final List<Map<String, dynamic>> _mouthStyles = [
    {
      "style": AvatarModelMouth.awkwardSmile,
      "asset": "assets/avatar/smile/awkwardSmile.png",
    },
    {
      "style": AvatarModelMouth.braces,
      "asset": "assets/avatar/smile/braces.png",
    },
    {
      "style": AvatarModelMouth.gapSmile,
      "asset": "assets/avatar/smile/gapSmile.png",
    },
    {
      "style": AvatarModelMouth.kawaii,
      "asset": "assets/avatar/smile/kawaii.png",
    },
    {
      "style": AvatarModelMouth.openedSmile,
      "asset": "assets/avatar/smile/openedSmile.png",
    },
    {
      "style": AvatarModelMouth.teethSmile,
      "asset": "assets/avatar/smile/teethSmile.png",
    }
  ];

  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeColors colors = theme.extension<ThemeColors>()!;
    final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: "Avatar",
      ),
      body: Padding(
        padding: metrics.padding,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(140),
                  child: ColoredBox(
                    color: colors.secondary,
                    child: Obx(
                      () => SVGComponent(
                        width: 140,
                        height: 140,
                        rawSvg: controller.getAvatarSvg,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      _SectionComponent(
                        title: "Estilos de cabelo",
                        data: _hairStyles,
                      ),
                      _SectionComponent(
                        title: "Estilos de olhos",
                        data: _eyeStyles,
                      ),
                      _SectionComponent(
                        title: "Estilos de boca",
                        data: _mouthStyles,
                      ),
                      _SectionComponent(
                        title: "Acessórios",
                        data: _accessories,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: metrics.gap),
            ButtonComponent(
              text: "Salvar",
              icon: Ionicons.save_outline,
              type: ButtonComponentType.success,
              onPressed: () => controller.saveAvatar(),
            ),
          ],
        ),
      ),
    );
  }
}
