import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart'
    as modal_bottom_sheet;
import 'package:projeto_crianca/core/presentation/theme/theme_extensions.dart';
import 'package:projeto_crianca/core/presentation/widgets/Buttons/button_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/buttons/icon_button_component.dart';
import 'package:projeto_crianca/core/presentation/widgets/inputs/text_input_component.dart';
import 'package:projeto_crianca/modules/localize/presentation/controllers/localize_page_controller.dart';

class _CustomAppBar extends StatelessWidget {
  final LocalizePageController _controller = Get.find<LocalizePageController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final metrics = theme.extension<ThemeMetrics>()!;
    final colors = theme.extension<ThemeColors>()!;

    return Container(
      color: Colors.transparent,
      alignment: Alignment.bottomCenter,
      padding: metrics.padding,
      child: Column(
        children: [
          Row(
            children: [
              IconButtonWidget(
                icon: Ionicons.arrow_back_outline,
                onPressed: () => Get.back<void>(),
              ),
              SizedBox(width: metrics.gap),
              Flexible(
                child: TextInputComponent(
                  controller: _controller.searchFieldController,
                  placeholder: 'Pesquisa...',
                  icon: Icons.search,
                  onChange: (String value) => _controller.search(),
                ),
              ),
            ],
          ),
          SizedBox(height: metrics.gap / 2),
          Obx(
            () => Visibility(
              visible: _controller.searchFieldController.text != '',
              child: Container(
                padding: metrics.padding,
                decoration: BoxDecoration(
                  color: colors.secondary,
                  borderRadius: metrics.borderRadius,
                ),
                child: _controller.getResults.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: _controller.getResults.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: metrics.gap,
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            InkWell(
                          onTap: () {
                            _controller.setProfessional =
                                _controller.getResults[index]!;
                            modal_bottom_sheet
                                .showMaterialModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) =>
                                  CustomModalBottomSheet(),
                            );
                          },
                          child: Text(
                            _controller.getResults[index]!.nome,
                          ),
                        ),
                      )
                    : const Text('Nada foi encontrado!'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomModalBottomSheet extends StatelessWidget {
  CustomModalBottomSheet({super.key});

  final LocalizePageController controller = Get.find<LocalizePageController>();

  @override
  Widget build(BuildContext context) {
    final metrics = Theme.of(context).extension<ThemeMetrics>()!;
    final colors = Theme.of(context).extension<ThemeColors>()!;
    final theme = Theme.of(context);
    final modalScrollController =
        modal_bottom_sheet.ModalScrollController.of(context);

    if (controller.getProfessional != null) {
      return Obx(
        () => Container(
          color: colors.background,
          padding: metrics.padding,
          height: 400,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButtonWidget(
                    icon: Ionicons.close_outline,
                    onPressed: () => Get.back<void>(),
                  ),
                ],
              ),
              SizedBox(
                height: metrics.gap,
              ),
              Flexible(
                child: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    controller: modalScrollController,
                    padding: EdgeInsets.only(
                      bottom: metrics.toDouble(metrics.padding)!,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.getProfessional!.nome,
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
                                      controller
                                          .getProfessional!.diasFuncionamento,
                                    ),
                                  ],
                                ),
                                SizedBox(width: metrics.gap),
                                Row(
                                  children: [
                                    const Icon(Ionicons.time_outline),
                                    const SizedBox(width: 10),
                                    Text(
                                      controller.getProfessional!.horario,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: metrics.gap),
                            Row(
                              children: [
                                const Icon(Ionicons.map_outline),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    controller.getProfessional!.endereco,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: metrics.gap),
                            Row(
                              children: [
                                const Icon(Ionicons.call_outline),
                                const SizedBox(width: 10),
                                Text(
                                  controller.getProfessional!.telefone ??
                                      'Nenhum contato conhecido.',
                                ),
                              ],
                            ),
                            SizedBox(height: metrics.gap),
                            Row(
                              children: [
                                const Icon(Ionicons.mail_outline),
                                const SizedBox(width: 10),
                                Text(
                                  controller.getProfessional!.email ??
                                      'Nenhum email conhecido.',
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: metrics.gap),
                        Text(controller.getProfessional!.descricao),
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
                            ButtonWidget(
                              text: 'Rotas',
                              icon: Ionicons.navigate,
                              onPressed: () => MapsLauncher.launchCoordinates(
                                controller.getProfessional!.latitude,
                                controller.getProfessional!.longitude,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
    final metrics = Theme.of(context).extension<ThemeMetrics>()!;
    controller.setShowPinModal =
        () => modal_bottom_sheet.showMaterialModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) => CustomModalBottomSheet(),
            );
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          GetBuilder<LocalizePageController>(
            init: controller,
            builder: (value) => GoogleMap(
              onMapCreated: controller.mapInit,
              initialCameraPosition: CameraPosition(
                target: controller.getPosition,
                zoom: 13,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              markers: controller.getMarkers,
              compassEnabled: false,
            ),
          ),
          Positioned(
            top: metrics.toDouble(metrics.padding)! * 2,
            left: 0,
            right: 0,
            child: _CustomAppBar(),
          ),
        ],
      ),
    );
  }
}
