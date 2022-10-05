import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  late GoogleMapController _googleMapsController;
  late Function _showPinModal;
  final LatLng _position = const LatLng(-26.294703, -48.848145); // coordernadas do O Farol(OMG)
  final Set<Marker> _markers = Set<Marker>();
  final Rx<ProfissionalModel?> _profissional = Rx<ProfissionalModel?>(null);

  set setShowPinModal(value) => _showPinModal = value;
  get googleMapsController => _googleMapsController;
  get position => _position;
 Set<Marker> get getMarkers => _markers;
 ProfissionalModel? get getProfessional => _profissional.value;

  LocalizePageController(this.repository);

  // static LocalizePageControler get to => Get.find<LocalizePageControler>();

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
    log("loadMarkers");
    try {
      final List<ProfissionalModel?>? data =
          await repository.getProfissionals();
      if (data != null) {
        for (var element in data) {
          log(element!.latitude.toString());
          _markers.add(
            Marker(
              markerId: MarkerId(element.profissionalId!.toString()),
              position: LatLng(element.latitude!, element.longitude!),
              onTap: () {
                _profissional.value = element;
                _showPinModal();
                } ,
              // icon: await BitmapDescriptor.fromAssetImage(
              // ImageConfiguration(),
              // "assets/map_styles/pin_map.png")
            ),
            
          );
           update();
        }
       
      }
    } catch (error) {
      log(error.toString());
    }
    ;
  }

  mapInit(GoogleMapController gmc) async {
    _googleMapsController = gmc;
    getPosition();
    loadMarkers();

    var style = await rootBundle.loadString("assets/map_styles/normal.json");
    _googleMapsController.setMapStyle(style);
  }
}
