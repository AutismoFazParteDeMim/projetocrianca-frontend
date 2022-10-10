import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_crianca/data/models/profissional_model.dart';
import 'package:projeto_crianca/data/repositorys/localize_repository.dart';

class LocalizePageController extends GetxController {
  final LocalizeRepository repository;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxBool _isDark = false.obs;
  late GoogleMapController _googleMapsController;
  late Function _showPinModal;
  final Set<Marker> _markers = <Marker>{};
  final Rx<ProfissionalModel?> _profissional = Rx<ProfissionalModel?>(null);
  final RxList<ProfissionalModel?> _profissionals =
      RxList<ProfissionalModel?>([null]);
  final RxList<ProfissionalModel?> _results =
      RxList<ProfissionalModel?>([null]);
  final TextEditingController searchFieldController = TextEditingController();
  final LatLng _position = const LatLng(
    -26.294703,
    -48.848145,
  ); // coordernadas do O Farol(OMG)

  set setShowPinModal(value) => _showPinModal = value;
  set setProfissional(value) => _profissional.value = value;
  get googleMapsController => _googleMapsController;
  get position => _position;
  Set<Marker> get getMarkers => _markers;
  ProfissionalModel? get getProfessional => _profissional.value;
  List<ProfissionalModel?> get getProfessionals => _profissionals;
  List<ProfissionalModel?> get getResults => _results;

  LocalizePageController(this.repository);

  Future<Position> _currentPosition() async {
    LocationPermission permission;
    bool enable = await Geolocator.isLocationServiceEnabled();

    if (!enable) {
      return Future.error("GPS desativado, por favor habilite-o.");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error(
            "Voce precisa autorizar o uso de GPS para usar essas parte do aplicativo.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Sem acesso ao GPS essa parte do aplicativo fica incapaz de funcionar, caso mude de ideia sera preciso abrir as configuracoes e mudar a permissao.");
    }

    return await Geolocator.getCurrentPosition();
  }

  getPosition() async {
    try {
      final attPosition = await _currentPosition();
      _latitude.value = attPosition.latitude;
      _longitude.value = attPosition.longitude;
      _googleMapsController.animateCamera(CameraUpdate.newLatLng(
        LatLng(_latitude.value, _longitude.value),
      ));
    } catch (error) {
      Get.snackbar(
        "Erro",
        error.toString(),
      );
    }
  }

  loadMarkers() async {
    try {
      final List<ProfissionalModel?>? data =
          await repository.getProfissionals();
      if (data != null) {
        _profissionals.value = data;

        for (var element in data) {
          _markers.add(
            Marker(
              markerId: MarkerId(element!.profissionalId.toString()),
              position: LatLng(element.latitude, element.longitude),
              onTap: () {
                _profissional.value = element;
                _showPinModal();
              },
              icon: await BitmapDescriptor.fromAssetImage(
                  const ImageConfiguration(),
                  _isDark.value
                      ? "assets/map_styles/pin_map_dark.png"
                      : "assets/map_styles/pin_map.png"),
            ),
          );
          update();
        }
      }
    } catch (error) {
      log(error.toString());
    }
  }

  mapInit(GoogleMapController gmc) async {
    _googleMapsController = gmc;
    getPosition();

    final currentTime = DateTime.now();

    if (currentTime.hour >= 18) {
      _isDark.value = true;
      final style = await rootBundle.loadString("assets/map_styles/dark.json");
      _googleMapsController.setMapStyle(style);
    } else {
      _isDark.value = false;
      final style =
          await rootBundle.loadString("assets/map_styles/normal.json");
      _googleMapsController.setMapStyle(style);
    }

    loadMarkers();
  }

  void search() {
    if (_profissionals.isNotEmpty) {
      _results.value = _profissionals
          .where(
            (element) => element!.nome.toLowerCase().contains(
                  searchFieldController.text.toLowerCase(),
                ),
          )
          .toList();
    }
  }
}
