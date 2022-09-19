import 'dart:developer';
import 'package:get/get.dart';
import 'package:projeto_crianca/data/models/avatar_model.dart';
import 'package:projeto_crianca/data/repositorys/avatar_repository.dart';

class AvatarPageController extends GetxController {
  final AvatarRepository repository;

  final String variable = "teste";

  String get getVariable => variable;

  final AvatarModel avatar1 = AvatarModel(
    eye: AvatarModelEye.cheery,
    skinColor: AvatarModelSkinColor.variant02,
  );

  AvatarPageController(this.repository);

  Future<String?> getAvatar(AvatarModel avatar) async {
    return await repository.getAvatar(avatar);
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
