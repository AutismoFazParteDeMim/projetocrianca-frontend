import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/core/domain/entities/avatar_entity.dart';
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';
import 'package:projeto_crianca/core/presentation/widgets/Buttons/button_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/appbar_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/svg_component.dart';
import 'package:projeto_crianca/modules/avatar/presentation/controllers/avatar_page_controller.dart';

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
      'style': AvatarEntityHairType.bowlCutHair,
      'asset': 'assets/avatar/hair/bowlCutHair.png',
    },
    {
      'style': AvatarEntityHairType.froBun,
      'asset': 'assets/avatar/hair/froBun.png',
    },
    {
      'style': AvatarEntityHairType.shortHair,
      'asset': 'assets/avatar/hair/shortHair.png',
    },
    {
      'style': AvatarEntityHairType.curlyShortHair,
      'asset': 'assets/avatar/hair/shortHairCurly.png',
    },
    {
      'style': AvatarEntityHairType.straightHair,
      'asset': 'assets/avatar/hair/straightHair.png',
    },
    {
      'style': AvatarEntityHairType.wavyBob,
      'asset': 'assets/avatar/hair/wavyBob.png',
    }
  ];

  static final List<Map<String, dynamic>> _eyeStyles = [
    {
      'style': AvatarEntityEye.cheery,
      'asset': 'assets/avatar/eye/cheeryEyes.png',
    },
    {
      'style': AvatarEntityEye.confused,
      'asset': 'assets/avatar/eye/confusedEyes.png',
    },
    {
      'style': AvatarEntityEye.normal,
      'asset': 'assets/avatar/eye/normalEyes.png',
    },
    {
      'style': AvatarEntityEye.sleepy,
      'asset': 'assets/avatar/eye/sleepyEyes.png',
    },
    {
      'style': AvatarEntityEye.starstruck,
      'asset': 'assets/avatar/eye/starstruckEyes.png',
    },
    {
      'style': AvatarEntityEye.winking,
      'asset': 'assets/avatar/eye/winkingEyes.png',
    }
  ];

  static final List<Map<String, dynamic>> _accessories = [
    {
      'style': AvatarEntityAccessories.catEars,
      'asset': 'assets/avatar/objects/catEars.png',
    },
    {
      'style': AvatarEntityAccessories.clownNose,
      'asset': 'assets/avatar/objects/clownNose.png',
    },
    {
      'style': AvatarEntityAccessories.faceMask,
      'asset': 'assets/avatar/objects/faceMask.png',
    },
    {
      'style': AvatarEntityAccessories.glasses,
      'asset': 'assets/avatar/objects/glasses.png',
    },
    {
      'style': AvatarEntityAccessories.sailormoonCrown,
      'asset': 'assets/avatar/objects/sailormoonCrown.png',
    },
    {
      'style': AvatarEntityAccessories.sunglasses,
      'asset': 'assets/avatar/objects/sunglasses.png',
    }
  ];

  static final List<Map<String, dynamic>> _mouthStyles = [
    {
      'style': AvatarEntityMouth.awkwardSmile,
      'asset': 'assets/avatar/smile/awkwardSmile.png',
    },
    {
      'style': AvatarEntityMouth.braces,
      'asset': 'assets/avatar/smile/braces.png',
    },
    {
      'style': AvatarEntityMouth.gapSmile,
      'asset': 'assets/avatar/smile/gapSmile.png',
    },
    {
      'style': AvatarEntityMouth.kawaii,
      'asset': 'assets/avatar/smile/kawaii.png',
    },
    {
      'style': AvatarEntityMouth.openedSmile,
      'asset': 'assets/avatar/smile/openedSmile.png',
    },
    {
      'style': AvatarEntityMouth.teethSmile,
      'asset': 'assets/avatar/smile/teethSmile.png',
    }
  ];

  static final List<Map<String, dynamic>> _hairColor = [
    {
      'style': AvatarEntityHairColor.v220f00,
      'color': '0xFF220F00',
    },
    {
      'style': AvatarEntityHairColor.v3a1a00,
      'color': '0xFF3A1A00',
    },
    {
      'style': AvatarEntityHairColor.v71472d,
      'color': '0xFF71472D',
    },
    {
      'style': AvatarEntityHairColor.ve2ba87,
      'color': '0xFFE2BA87',
    },
    {
      'style': AvatarEntityHairColor.v605de4,
      'color': '0xFF605DE4',
    },
    {
      'style': AvatarEntityHairColor.v238d80,
      'color': '0xFF238D80',
    },
    {
      'style': AvatarEntityHairColor.vd56c0c,
      'color': '0xFFD56C0C',
    },
    {
      'style': AvatarEntityHairColor.ve9b729,
      'color': '0xFFE9B729',
    },
  ];

  static final List<Map<String, dynamic>> _skinColor = [
    {
      'style': AvatarEntitySkinColor.vffe4c0,
      'color': '0xFFFFE4C0',
    },
    {
      'style': AvatarEntitySkinColor.vf5d7b1,
      'color': '0xFFF5D7B1',
    },
    {
      'style': AvatarEntitySkinColor.vefcc9f,
      'color': '0xFFEFCC9F',
    },
    {
      'style': AvatarEntitySkinColor.ve2ba87,
      'color': '0xFFE2BA87',
    },
    {
      'style': AvatarEntitySkinColor.vc99c62,
      'color': '0xFFC99C62',
    },
    {
      'style': AvatarEntitySkinColor.va47539,
      'color': '0xFFA47539',
    },
    {
      'style': AvatarEntitySkinColor.v8c5a2b,
      'color': '0xFF8C5A2B',
    },
    {
      'style': AvatarEntitySkinColor.v643d19,
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
