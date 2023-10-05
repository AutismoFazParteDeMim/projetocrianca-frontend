import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'package:projeto_crianca/controllers/avatar_page_controller.dart';
import 'package:projeto_crianca/data/models/avatar_model.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';
import 'package:projeto_crianca/ui/widgets/appbar_component.dart';
import 'package:projeto_crianca/ui/widgets/buttons/button_component.dart';
import 'package:projeto_crianca/ui/widgets/svg_component.dart';

class _SectionComponent extends StatelessWidget {
  _SectionComponent({
    required this.title,
    required this.data,
  });

  final AvatarPageController _controller = Get.find<AvatarPageController>();

  final String title;
  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<ThemeColors>()!;
    final metrics = theme.extension<ThemeMetrics>()!;

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
                    onTap: () => _controller.getAvatar(e['style']),
                    borderRadius: metrics.borderRadius,
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: metrics.borderRadius,
                        color: e['asset'] == null
                            ? Color(int.parse(e['color'] as String))
                            : colors.secondary,
                      ),
                      child: e['asset'] != null
                          ? Image(
                              width: 60,
                              height: 60,
                              image: AssetImage(e['asset']! as String),
                            )
                          : const SizedBox(
                              width: 60,
                              height: 60,
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
  const AvatarPage({super.key});

  static final List<Map<String, dynamic>> _hairStyles = [
    {
      'style': AvatarModelHairType.bowlCutHair,
      'asset': 'assets/avatar/hair/bowlCutHair.png',
    },
    {
      'style': AvatarModelHairType.froBun,
      'asset': 'assets/avatar/hair/froBun.png',
    },
    {
      'style': AvatarModelHairType.shortHair,
      'asset': 'assets/avatar/hair/shortHair.png',
    },
    {
      'style': AvatarModelHairType.curlyShortHair,
      'asset': 'assets/avatar/hair/shortHairCurly.png',
    },
    {
      'style': AvatarModelHairType.straightHair,
      'asset': 'assets/avatar/hair/straightHair.png',
    },
    {
      'style': AvatarModelHairType.wavyBob,
      'asset': 'assets/avatar/hair/wavyBob.png',
    }
  ];

  static final List<Map<String, dynamic>> _eyeStyles = [
    {
      'style': AvatarModelEye.cheery,
      'asset': 'assets/avatar/eye/cheeryEyes.png',
    },
    {
      'style': AvatarModelEye.confused,
      'asset': 'assets/avatar/eye/confusedEyes.png',
    },
    {
      'style': AvatarModelEye.normal,
      'asset': 'assets/avatar/eye/normalEyes.png',
    },
    {
      'style': AvatarModelEye.sleepy,
      'asset': 'assets/avatar/eye/sleepyEyes.png',
    },
    {
      'style': AvatarModelEye.starstruck,
      'asset': 'assets/avatar/eye/starstruckEyes.png',
    },
    {
      'style': AvatarModelEye.winking,
      'asset': 'assets/avatar/eye/winkingEyes.png',
    }
  ];

  static final List<Map<String, dynamic>> _accessories = [
    {
      'style': AvatarModelAccessories.catEars,
      'asset': 'assets/avatar/objects/catEars.png',
    },
    {
      'style': AvatarModelAccessories.clownNose,
      'asset': 'assets/avatar/objects/clownNose.png',
    },
    {
      'style': AvatarModelAccessories.faceMask,
      'asset': 'assets/avatar/objects/faceMask.png',
    },
    {
      'style': AvatarModelAccessories.glasses,
      'asset': 'assets/avatar/objects/glasses.png',
    },
    {
      'style': AvatarModelAccessories.sailormoonCrown,
      'asset': 'assets/avatar/objects/sailormoonCrown.png',
    },
    {
      'style': AvatarModelAccessories.sunglasses,
      'asset': 'assets/avatar/objects/sunglasses.png',
    }
  ];

  static final List<Map<String, dynamic>> _mouthStyles = [
    {
      'style': AvatarModelMouth.awkwardSmile,
      'asset': 'assets/avatar/smile/awkwardSmile.png',
    },
    {
      'style': AvatarModelMouth.braces,
      'asset': 'assets/avatar/smile/braces.png',
    },
    {
      'style': AvatarModelMouth.gapSmile,
      'asset': 'assets/avatar/smile/gapSmile.png',
    },
    {
      'style': AvatarModelMouth.kawaii,
      'asset': 'assets/avatar/smile/kawaii.png',
    },
    {
      'style': AvatarModelMouth.openedSmile,
      'asset': 'assets/avatar/smile/openedSmile.png',
    },
    {
      'style': AvatarModelMouth.teethSmile,
      'asset': 'assets/avatar/smile/teethSmile.png',
    }
  ];

  static final List<Map<String, dynamic>> _hairColor = [
    {
      'style': AvatarModelHairColor.v220f00,
      'color': '0xFF220F00',
    },
    {
      'style': AvatarModelHairColor.v3a1a00,
      'color': '0xFF3A1A00',
    },
    {
      'style': AvatarModelHairColor.v71472d,
      'color': '0xFF71472D',
    },
    {
      'style': AvatarModelHairColor.ve2ba87,
      'color': '0xFFE2BA87',
    },
    {
      'style': AvatarModelHairColor.v605de4,
      'color': '0xFF605DE4',
    },
    {
      'style': AvatarModelHairColor.v238d80,
      'color': '0xFF238D80',
    },
    {
      'style': AvatarModelHairColor.vd56c0c,
      'color': '0xFFD56C0C',
    },
    {
      'style': AvatarModelHairColor.ve9b729,
      'color': '0xFFE9B729',
    },
  ];

  static final List<Map<String, dynamic>> _skinColor = [
    {
      'style': AvatarModelSkinColor.variant01,
      'color': '0xFFFFE4C0',
    },
    {
      'style': AvatarModelSkinColor.variant02,
      'color': '0xFFF5D7B1',
    },
    {
      'style': AvatarModelSkinColor.variant03,
      'color': '0xFFEFCC9F',
    },
    {
      'style': AvatarModelSkinColor.variant04,
      'color': '0xFFE2BA87',
    },
    {
      'style': AvatarModelSkinColor.variant05,
      'color': '0xFFC99C62',
    },
    {
      'style': AvatarModelSkinColor.variant06,
      'color': '0xFFA47539',
    },
    {
      'style': AvatarModelSkinColor.variant07,
      'color': '0xFF8C5A2B',
    },
    {
      'style': AvatarModelSkinColor.variant08,
      'color': '0xFF643D19',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<ThemeColors>()!;
    final metrics = theme.extension<ThemeMetrics>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: 'Avatar',
      ),
      body: Padding(
        padding: metrics.padding,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                bottom: metrics.toDouble(metrics.padding)!,
              ),
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
            Expanded(
              child: ContainedTabBarView(
                tabBarProperties: TabBarProperties(
                  height: 50,
                  indicatorColor: colors.primary,
                  labelColor: colors.primary,
                  unselectedLabelColor: colors.text,
                  margin: EdgeInsets.only(
                    bottom: metrics.toDouble(metrics.padding)!,
                  ),
                ),
                tabs: const [
                  Text('Estilo'),
                  Text('Cores'),
                ],
                views: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        _SectionComponent(
                          title: 'Estilo do cabelo',
                          data: _hairStyles,
                        ),
                        _SectionComponent(
                          title: 'Estilo dos olhos',
                          data: _eyeStyles,
                        ),
                        _SectionComponent(
                          title: 'Estilo da boca',
                          data: _mouthStyles,
                        ),
                        _SectionComponent(
                          title: 'Acessórios',
                          data: _accessories,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        _SectionComponent(
                          title: 'Cor da pele',
                          data: _skinColor,
                        ),
                        _SectionComponent(
                          title: 'Cor do cabelo',
                          data: _hairColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: metrics.gap),
            ButtonWidget(
              text: 'Salvar',
              icon: Ionicons.save_outline,
              color: ButtonWidgetColor.success,
              onPressed: () => controller.saveAvatar(),
            ),
          ],
        ),
      ),
    );
  }
}
