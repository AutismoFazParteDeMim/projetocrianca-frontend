import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/controllers/localize_page_controler.dart';
import 'package:projeto_crianca/ui/components/Buttons/icon_button_component.dart';
import 'package:projeto_crianca/ui/components/Inputs/text_input_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeMetrics metrics = theme.extension<ThemeMetrics>()!;
    final ThemeColors colors = theme.extension<ThemeColors>()!;

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
  @override
  Widget build(BuildContext context) {
    if (controller.getProfessional != null) {
      return Obx(
        () => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(controller.getProfessional!.nome!),
              // Text(controller.getProfessional.data) // descricao da modal
            ],
          ),
        ),
      );
    }
    return CircularProgressIndicator();
  }
}

class LocalizePage extends GetView<LocalizePageController> {
  LocalizePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setShowPinModal = () => showMaterialModalBottomSheet(
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
