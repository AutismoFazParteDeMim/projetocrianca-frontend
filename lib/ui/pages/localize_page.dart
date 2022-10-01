import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/controllers/localize_page_controler.dart';
import 'package:projeto_crianca/ui/components/Inputs/text_input_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

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
        children: const [
          Flexible(
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

class LocalizePage extends GetView<LocalizePageControler> {
  LocalizePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _CustomAppBar(),
      extendBodyBehindAppBar: true,

      body: GetBuilder<LocalizePageControler>(
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
        ),
      ),
    );
  }
}
