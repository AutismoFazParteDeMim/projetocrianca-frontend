import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/controllers/profile_page_controller.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:projeto_crianca/ui/components/Buttons/icon_button_component.dart';
import 'package:projeto_crianca/ui/components/svg_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;

    return Container(
      height: metrics.headerHeight,
      color: Colors.transparent,
      alignment: Alignment.bottomLeft,
      padding: metrics.padding,
      child: IconButtonComponent(
        icon: Ionicons.arrow_back,
        onPressed: () => Get.back(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class ProfilePage extends GetView<ProfilePageController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;
    final ThemeColors colors = theme.extension<ThemeColors>()!;

    return Scaffold(
      appBar: _CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          SizedBox(
            height: 280,
            child: Stack(
              children: [
                const Image(
                  height: 240,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://eskipaper.com/images/kids-wallpaper-21.jpg",
                  ),
                ),
                Positioned(
                  left: metrics.padding.left,
                  bottom: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: ColoredBox(
                          color: colors.secondary,
                          child: InkWell(
                            onTap: () => Get.toNamed(AppRoutes.avatar),
                            borderRadius: BorderRadius.circular(60),
                            child: Obx(
                              () => SVGComponent(
                                width: 80,
                                height: 80,
                                rawSvg: controller.getCurrentChild?.photoURL,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: metrics.gap),
                      Obx(
                        () => Text(
                          "${controller.getCurrentChild?.name}",
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text("Perfil do usuário"),
            ),
          ),
        ],
      ),
    );
  }
}
