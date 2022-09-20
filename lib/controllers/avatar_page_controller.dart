import 'package:get/get.dart';
import 'package:projeto_crianca/data/models/avatar_model.dart';
import 'package:projeto_crianca/data/models/child_model.dart';
import 'package:projeto_crianca/data/repositorys/avatar_repository.dart';
import 'package:projeto_crianca/ui/components/alert_modal_component.dart';

void _showAlertModal(
  String message,
  AlertModalComponentType type,
) {
  Get.generalDialog(
    pageBuilder: (
      context,
      animation,
      secondaryAnimation,
    ) =>
        AlertModalComponent(
      type: AlertModalComponentType.warning,
      title: "Ops!",
      message: message,
    ),
  );
}

class AvatarPageController extends GetxController {
  final AvatarRepository repository;

  final AvatarModel _avatar = AvatarModel();
  final Rx<String?> _avatarSvg = Rx(null);

  String? get getAvatarSvg => _avatarSvg.value;

  AvatarPageController(this.repository);

  @override
  Future<void> onReady() async {
    super.onReady();
    final child = await repository.getCurrentChild();
    _avatarSvg.value = child?.photoURL;
  }

  Future<void> getAvatar(dynamic seed) async {
    if (seed is AvatarModelEye) {
      _avatar.eye = seed;
    } else if (seed is AvatarModelHairType) {
      _avatar.hair = seed;
    } else if (seed is AvatarModelMouth) {
      _avatar.mouth = seed;
    } else if (seed is AvatarModelAccessories) {
      _avatar.accessories = seed;
    }

    try {
      final avatarSvg = await repository.getAvatar(_avatar);
      _avatarSvg.value = avatarSvg;
    } catch (e) {
      _showAlertModal(e.toString(), AlertModalComponentType.warning);
    }
  }

  Future<void> saveAvatar() async {
    final child = ChildModel(photoURL: _avatarSvg.value);
    try {
      await repository.saveAvatar(child);
      Get.back();
    } catch (e) {
      _showAlertModal(e.toString(), AlertModalComponentType.warning);
    }
  }
}
