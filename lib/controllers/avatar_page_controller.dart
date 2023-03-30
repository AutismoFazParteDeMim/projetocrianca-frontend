import 'package:get/get.dart';
import 'package:projeto_crianca/data/models/avatar_model.dart';
import 'package:projeto_crianca/data/models/child_model.dart';
import 'package:projeto_crianca/data/repositorys/avatar_repository.dart';
import 'package:projeto_crianca/mixins/dialog_mixin.dart';
import 'package:projeto_crianca/ui/widgets/alert_modal_component.dart';

class AvatarPageController extends GetxController with DialogMixin {
  final AvatarRepository repository;

  //vars
  final AvatarModel _avatar = AvatarModel();
  final Rx<String?> _avatarSvg = Rx(null);

  //getters
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
    } else if (seed is AvatarModelHairColor) {
      _avatar.hairColor = seed;
    } else if (seed is AvatarModelSkinColor) {
      _avatar.skinColor = seed;
    }

    try {
      final avatarSvg = await repository.getAvatar(_avatar);
      _avatarSvg.value = avatarSvg;
    } catch (e) {
      showAlertDialog(
        title: "Ops!",
        message: e.toString(),
        type: AlertModalComponentType.warning,
      );
    }
  }

  Future<void> saveAvatar() async {
    final child = ChildModel(photoURL: _avatarSvg.value);
    try {
      await repository.saveAvatar(child);
      Get.back();
    } catch (e) {
      showAlertDialog(
        title: "Ops!",
        message: e.toString(),
        type: AlertModalComponentType.warning,
      );
    }
  }
}
