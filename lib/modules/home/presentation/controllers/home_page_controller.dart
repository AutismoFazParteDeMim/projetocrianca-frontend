import 'package:get/get.dart';
import 'package:projeto_crianca/core/domain/entities/child_entity.dart';
import 'package:projeto_crianca/core/domain/repositories/user_repository.dart';

class HomePageController extends GetxController {
  HomePageController(this.repository);

  final UserRepository repository;

  //vars
  final Rx<ChildEntity?> _child = Rx<ChildEntity?>(ChildEntity());

  //getters
  ChildEntity? get getCurrentChild => _child.value;

  @override
  void onInit() {
    super.onInit();

    final stream = repository.getChildStream();
    _child.bindStream(stream!);
  }
}
