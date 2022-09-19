import 'dart:developer';
import 'package:get/get.dart';
import 'package:projeto_crianca/data/models/child_model.dart';
import 'package:projeto_crianca/data/repositorys/user_repository.dart';

class ProfilePageController extends GetxController {
  final UserRepository repository;
  final Rx<ChildModel?> _child = Rx<ChildModel?>(ChildModel());

  ChildModel? get getCurrentChild => _child.value;

  ProfilePageController(this.repository);

  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      final childData = await repository.getCurrentChild();
      _child.value = childData;
    } catch (e) {
      log(e.toString());
    }
  }
}
