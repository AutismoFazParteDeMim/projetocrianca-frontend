import 'dart:developer';
import 'package:get/get.dart';
import 'package:projeto_crianca/data/models/avatar_model.dart';
import 'package:projeto_crianca/data/repositorys/avatar_repository.dart';

AvatarModel avatar1 = AvatarModel(
  eye: AvatarModelEye.cheery,
  skinColor: AvatarModelSkinColor.variant02,
  mouth: AvatarModelMouth.openedSmile,
  hair: AvatarModelHairType.bunHair,
  hairColor: AvatarModelHairColor.variant04,
  accessories: AvatarModelAccessories.glasses,
);

class ProfileController extends GetxController {
  final AvatarRepository repository;

  ProfileController(this.repository);
  Future<String?> getAvatar(AvatarModel avatar) async {
    return await repository.getAvatar(avatar);
  }

  @override
  void onInit() {
    super.onInit();
    log("ProfileControlller");
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      await getAvatar(avatar1).then((value) => log(value.toString()));
    } catch (error) {
      log(error.toString());
    }
  }
}
