import 'package:get/get.dart';
import 'package:projeto_crianca/data/models/child_model.dart';
import 'package:projeto_crianca/data/repositorys/user_repository.dart';

class HomePageController extends GetxController {
  final UserRepository repository;
  late Rx<ChildModel?> _child;

  ChildModel? get getCurrentChild => _child.value;

  HomePageController(this.repository);

  @override
  void onInit() {
    super.onInit();

    _child = Rx<ChildModel?>(
      ChildModel(
        name: "",
        sex: "",
        photoURL: "default",
      ),
    );
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    await repository.getCurrentChild().then((value) => _child.value = value);
  }
}
