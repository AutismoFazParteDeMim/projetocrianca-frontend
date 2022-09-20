import 'package:get/get.dart';
import 'package:projeto_crianca/data/models/avatar_model.dart';
import 'package:projeto_crianca/data/repositorys/avatar_repository.dart';
import 'package:projeto_crianca/ui/components/alert_modal_component.dart';

class AvatarPageController extends GetxController {
  final AvatarRepository repository;
  final AvatarModel _avatar = AvatarModel();

  final Rx<String?> _avatarSvg = Rx(null);

  String? get getAvatarSvg => _avatarSvg.value;

  AvatarPageController(this.repository);

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
      Get.generalDialog(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AlertModalComponent(
          title: "Ops!",
          message: e.toString(),
        ),
      );
    }
  }
}
