import 'package:get/get.dart';
import 'package:projeto_crianca/core/domain/entities/avatar_entity.dart';
import 'package:projeto_crianca/core/domain/entities/child_entity.dart';
import 'package:projeto_crianca/core/mixins/dialog_mixin.dart';
import 'package:projeto_crianca/core/presentation/widgets/alert_modal_component.dart';
import 'package:projeto_crianca/modules/avatar/domain/repositories/avatar_repository.dart';

class AvatarPageController extends GetxController with DialogMixin {
  AvatarPageController(this.repository);

  final AvatarRepository repository;

  //vars
  AvatarEntity _avatar = AvatarEntity();
  final Rx<String?> _avatarSvg = Rx(null);

  //getters
  String? get getAvatarSvg => _avatarSvg.value;

  @override
  Future<void> onReady() async {
    super.onReady();
    final child = await repository.getCurrentChild();
    _avatarSvg.value = child?.photoURL;
  }

  Future<void> getAvatar(dynamic seed) async {
    if (seed is AvatarEntityEye) {
      _avatar = _avatar.copyWith(eye: seed);
    } else if (seed is AvatarEntityHairType) {
      _avatar = _avatar.copyWith(hair: seed);
    } else if (seed is AvatarEntityMouth) {
      _avatar = _avatar.copyWith(mouth: seed);
    } else if (seed is AvatarEntityAccessories) {
      _avatar = _avatar.copyWith(accessories: seed);
    } else if (seed is AvatarEntityHairColor) {
      _avatar = _avatar.copyWith(hairColor: seed);
    } else if (seed is AvatarEntitySkinColor) {
      _avatar = _avatar.copyWith(skinColor: seed);
    }

    try {
      final avatarSvg = await repository.getAvatar(_avatar);
      _avatarSvg.value = avatarSvg;
    } catch (e) {
      showAlertDialog(
        title: 'Ops!',
        message: e.toString(),
        type: AlertModalComponentType.warning,
      );
    }
  }

  Future<void> saveAvatar() async {
    final child = ChildEntity(photoURL: _avatarSvg.value);
    try {
      await repository.saveAvatar(child);
      Get.back<void>();
    } catch (e) {
      showAlertDialog(
        title: 'Ops!',
        message: e.toString(),
        type: AlertModalComponentType.warning,
      );
    }
  }
}
