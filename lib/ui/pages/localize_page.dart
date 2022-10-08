import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/controllers/localize_page_controller.dart';
import 'package:projeto_crianca/ui/components/Buttons/button_component.dart';
import 'package:projeto_crianca/ui/components/Buttons/icon_button_component.dart';
import 'package:projeto_crianca/ui/components/Inputs/text_input_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;

    return Container(
      height: metrics.headerHeight * 2,
      color: Colors.transparent,
      alignment: Alignment.bottomCenter,
      padding: metrics.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButtonComponent(
            icon: Ionicons.arrow_back_outline,
            onPressed: () => Get.back(),
          ),
          SizedBox(
            width: metrics.gap,
          ),
          const Flexible(
            child: TextInputComponent(
              placeholder: "Pesquisa...",
              icon: Icons.search,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class CustomModalBottomSheet extends StatelessWidget {
  final LocalizePageController controller = Get.find<LocalizePageController>();

  CustomModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;
    final ThemeData theme = Theme.of(context);
    final ScrollController? modalScrollController =
        ModalScrollController.of(context);

    if (controller.getProfessional != null) {
      return Obx(
        () => Container(
          padding: metrics.padding,
          height: 400,
          child: SingleChildScrollView(
            controller: modalScrollController,
            scrollDirection: Axis.vertical,
            padding:
                EdgeInsets.only(bottom: metrics.toDouble(metrics.padding)!),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButtonComponent(
                      icon: Ionicons.close_outline,
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
                Text(
                  controller.getProfessional!.nome!,
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: metrics.gap),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(Ionicons.calendar_outline),
                            const SizedBox(width: 10),
                            Text(
                                controller.getProfessional!.diasFuncionamento!),
                          ],
                        ),
                        SizedBox(width: metrics.gap),
                        Row(
                          children: [
                            const Icon(Ionicons.time_outline),
                            const SizedBox(width: 10),
                            Text(controller.getProfessional!.horario!),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: metrics.gap),
                    Row(
                      children: [
                        const Icon(Ionicons.map_outline),
                        const SizedBox(width: 10),
                        Text(controller.getProfessional!.endereco!),
                      ],
                    ),
                    SizedBox(height: metrics.gap),
                    Row(
                      children: [
                        const Icon(Ionicons.call_outline),
                        const SizedBox(width: 10),
                        Text(controller.getProfessional!.telefone!),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: metrics.gap),
                Text(controller.getProfessional!.descricao!),
                SizedBox(height: metrics.gap),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: metrics.gap),
                    // add btn maps
                    SizedBox(height: metrics.gap),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonComponent(
                      text: "Rotas",
                      icon: Ionicons.navigate_outline,
                      onPressed: () => launchUrl(controller.getProfessional!.rotaLink!),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
    return const CircularProgressIndicator();
  }
}

class LocalizePage extends GetView<LocalizePageController> {
  const LocalizePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setShowPinModal = () => showMaterialModalBottomSheet(
          expand: false,
          context: context,
          builder: (BuildContext context) => CustomModalBottomSheet(),
        );
    return Scaffold(
      appBar: _CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: GetBuilder<LocalizePageController>(
        init: controller,
        builder: (value) => GoogleMap(
          onMapCreated: controller.mapInit,
          initialCameraPosition: CameraPosition(
            target: controller.position,
            zoom: 13,
          ),
          mapType: MapType.normal,
          zoomControlsEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          markers: controller.getMarkers,
        ),
      ),
    );
  }
}
