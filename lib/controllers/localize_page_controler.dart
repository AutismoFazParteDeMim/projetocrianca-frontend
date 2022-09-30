import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocalizePageControler extends GetxController {
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  LatLng _position = LatLng(-26.294627, -48.848147); // coordenadas do Farol(ONG)
  late GoogleMapController _googleMapsController;

  get position => _position;
  get mapsController => _googleMapsController;

  static LocalizePageControler get to => Get.find<LocalizePageControler>();
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
      latitude.value = attPosition.latitude;
      longitude.value = attPosition.longitude;
      _googleMapsController.animateCamera(CameraUpdate.newLatLng(
        LatLng(latitude.value, longitude.value),
      ));
    } catch (error) {
      Get.snackbar(
        "Erro",
        error.toString(),
      );
    }
  }

  mapInit(GoogleMapController gmc) async {
    _googleMapsController = gmc;
    getPosition();
  }
}
