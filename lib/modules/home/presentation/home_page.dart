import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';
import 'package:projeto_crianca/core/presentation/widgets/buttons/square_button_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/svg_component.dart';
import 'package:projeto_crianca/core/routes/app_routes.dart';
import 'package:projeto_crianca/core/services/auth_service.dart';
import 'package:projeto_crianca/modules/home/presentation/controllers/home_page_controller.dart';

class _CustomAppBar extends PreferredSize {
  _CustomAppBar()
      : super(
          child: Container(),
          preferredSize: const Size.fromHeight(100),
        );

  final HomePageController controller = Get.find<HomePageController>();
  final AuthService authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final metrics = theme.extension<ThemeMetrics>()!;
    final colors = theme.extension<ThemeColors>()!;

    return Container(
      height: metrics.headerHeight * 2,
      color: colors.background,
      alignment: Alignment.bottomCenter,
      padding: metrics.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: ColoredBox(
              color: colors.secondary,
              child: InkWell(
                onTap: () => Get.toNamed<void>(AppRoutes.avatar),
                child: Obx(
                  () => SVGComponent(
                    width: 60,
                    height: 60,
                    rawSvg: authService.getCurrentChild?.photoURL,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: metrics.gap),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  controller.getCurrentChild?.sex == 'f' ||
                          controller.getCurrentChild?.sex == 'female'
                      ? 'Bem vinda'
                      : 'Bem vindo',
                  style: theme.textTheme.titleSmall,
                ),
              ),
              Obx(
                () => Text(
                  '${controller.getCurrentChild?.name}',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Scaffold(
      appBar: _CustomAppBar(),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: metrics.gap * 2,
          mainAxisSpacing: metrics.gap * 2,
          shrinkWrap: true,
          padding: metrics.padding,
          children: [
            SquareButtonWidget(
              text: 'Atividades',
              image: const AssetImage('assets/icons/activities-icon.png'),
              onPressed: () => Get.toNamed<void>(AppRoutes.activities),
            ),
            SquareButtonWidget(
              text: 'Jogos',
              image: const AssetImage('assets/icons/games-icon.png'),
              onPressed: () => Get.toNamed<void>(AppRoutes.games),
            ),
            SquareButtonWidget(
              text: 'Localizar',
              image: const AssetImage('assets/icons/local-icon.png'),
              onPressed: () => Get.toNamed<void>(AppRoutes.localize),
            ),
            SquareButtonWidget(
              text: 'Configurações',
              image: const AssetImage('assets/icons/settings-icon.png'),
              onPressed: () => Get.toNamed<void>(AppRoutes.settings),
            ),
          ],
        ),
      ),
    );
  }
}
