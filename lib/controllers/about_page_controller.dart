import 'package:get/get.dart';
import 'package:projeto_crianca/data/models/github_model.dart';
import 'package:projeto_crianca/data/repositories/github_repository.dart';
import 'package:projeto_crianca/mixins/dialog_mixin.dart';
import 'package:projeto_crianca/ui/widgets/alert_modal_component.dart';

class AboutPageController extends GetxController with DialogMixin {
  final GitHubRepository repository;

  //vars
  final Rx<List<GitHubModel?>?> _contributors = Rx<List<GitHubModel?>?>([]);

  //getters
  List<GitHubModel?>? get getContributors => _contributors.value;

  AboutPageController(this.repository);

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final contributors = await repository.getContributors();
      _contributors.value = contributors;
    } catch (e) {
      showAlertDialog(
        title: "Ops!",
        message: e.toString(),
        type: AlertModalComponentType.warning,
      );
    }
  }
}
