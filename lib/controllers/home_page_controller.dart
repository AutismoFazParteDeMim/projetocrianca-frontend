import 'package:get/get.dart';
import 'package:projeto_crianca/data/models/child_model.dart';
import 'package:projeto_crianca/data/repositories/user_repository.dart';

class HomePageController extends GetxController {
  HomePageController(this.repository);

  final UserRepository repository;

  //vars
  final Rx<ChildModel?> _child = Rx<ChildModel?>(ChildModel());

  //getters
  ChildModel? get getCurrentChild => _child.value;

  @override
  void onInit() {
    super.onInit();

    final stream = repository.getChildStream();
    _child.bindStream(stream!);
  }
}
