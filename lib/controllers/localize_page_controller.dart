// ignore_for_file: lines_longer_than_80_chars

import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_crianca/data/models/profissional_model.dart';
import 'package:projeto_crianca/data/repositories/localize_repository.dart';

class LocalizePageController extends GetxController {
  LocalizePageController(this.repository);

  final LocalizeRepository repository;

  //controllers
  late GoogleMapController _googleMapsController;
  final TextEditingController searchFieldController = TextEditingController();

  //vars
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxBool _isDark = false.obs;
  late Function _showPinModal;
  final Set<Marker> _markers = <Marker>{};
  final Rx<ProfessionalModel?> _profissional = Rx<ProfessionalModel?>(null);
  final RxList<ProfessionalModel?> _professionals = RxList<ProfessionalModel?>(
    [null],
  );
  final RxList<ProfessionalModel?> _results = RxList<ProfessionalModel?>(
    [null],
  );
  final LatLng _position = const LatLng(
    -26.294703,
    -48.848145,
  ); // coordenadas do O Farol(OMG)

  //getters
  GoogleMapController get getGoogleMapsController => _googleMapsController;
  LatLng get getPosition => _position;
  Set<Marker> get getMarkers => _markers;
  ProfessionalModel? get getProfessional => _profissional.value;
  List<ProfessionalModel?> get getProfessionals => _professionals;
  List<ProfessionalModel?> get getResults => _results;

  //setters
  set setShowPinModal(Function value) => _showPinModal = value;
  set setProfessional(ProfessionalModel value) => _profissional.value = value;

  Future<Position> _currentPosition() async {
    LocationPermission permission;
    final enable = await Geolocator.isLocationServiceEnabled();

    if (!enable) {
      return Future.error('GPS desativado, por favor habilite-o.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error(
          'Voce precisa autorizar o uso de GPS para usar essas parte do aplicativo.',
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Sem acesso ao GPS essa parte do aplicativo fica incapaz de funcionar, caso mude de ideia será preciso abrir as configurações e mudar a permissão.',
      );
    }

    return Geolocator.getCurrentPosition();
  }

  Future<void> _getCurrentPosition() async {
    try {
      final attPosition = await _currentPosition();
      _latitude.value = attPosition.latitude;
      _longitude.value = attPosition.longitude;

      await _googleMapsController.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(_latitude.value, _longitude.value),
        ),
      );
    } catch (error) {
      Get.snackbar(
        'Erro',
        error.toString(),
      );
    }
  }

  Future<void> loadMarkers() async {
    try {
      final data = await repository.getProfessionals();
      if (data != null) {
        _professionals.value = data;

        for (final element in data) {
          _markers.add(
            Marker(
              markerId: MarkerId(element!.profissionalId.toString()),
              position: LatLng(element.latitude, element.longitude),
              onTap: () {
                _profissional.value = element;
                // ignore: avoid_dynamic_calls
                _showPinModal();
              },
              icon: await BitmapDescriptor.fromAssetImage(
                ImageConfiguration.empty,
                _isDark.value
                    ? 'assets/map_styles/pin_map_dark.png'
                    : 'assets/map_styles/pin_map.png',
              ),
            ),
          );
          update();
        }
      }
    } catch (error) {
      log(error.toString());
    }
  }

  Future<void> mapInit(GoogleMapController gmc) async {
    _googleMapsController = gmc;
    await _getCurrentPosition();

    final currentTime = DateTime.now();

    if (currentTime.hour >= 18) {
      _isDark.value = true;
      final style = await rootBundle.loadString('assets/map_styles/dark.json');
      await _googleMapsController.setMapStyle(style);
    } else {
      _isDark.value = false;
      final style =
          await rootBundle.loadString('assets/map_styles/normal.json');
      await _googleMapsController.setMapStyle(style);
    }

    await loadMarkers();
  }

  void search() {
    if (_professionals.isNotEmpty) {
      _results.value = _professionals
          .where(
            (element) => element!.nome.toLowerCase().contains(
                  searchFieldController.text.toLowerCase(),
                ),
          )
          .toList();
    }
  }
}
