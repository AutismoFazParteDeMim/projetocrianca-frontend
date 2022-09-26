import 'package:get/get.dart';
import 'package:projeto_crianca/data/models/child_model.dart';
import 'package:projeto_crianca/data/repositorys/user_repository.dart';

class ProfilePageController extends GetxController {
  final UserRepository repository;
  
  final Rx<ChildModel?> _child = Rx<ChildModel?>(ChildModel());

  ChildModel? get getCurrentChild => _child.value;

  ProfilePageController(this.repository);

  @override
  void onInit() {
    super.onInit();

    final stream = repository.getChildStream();
    _child.bindStream(stream!);
  }
}
