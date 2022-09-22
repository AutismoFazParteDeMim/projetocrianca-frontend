import 'package:get/get.dart';
import 'package:projeto_crianca/data/models/github_model.dart';
import 'package:projeto_crianca/data/repositorys/github_repository.dart';
import 'package:projeto_crianca/ui/components/alert_modal_component.dart';

void _showAlertModal(
  String message,
  AlertModalComponentType type,
) {
  Get.generalDialog(
    pageBuilder: (
      context,
      animation,
      secondaryAnimation,
    ) =>
        AlertModalComponent(
      type: AlertModalComponentType.warning,
      title: "Ops!",
      message: message,
    ),
  );
}

class AboutPageController extends GetxController {
  final GitHubRepository repository;
  final Rx<List<GitHubModel?>?> _contributors = Rx<List<GitHubModel?>?>([]);

  List<GitHubModel?>? get getContributors => _contributors.value;

  AboutPageController(this.repository);

  @override
  Future<void> onReady() async {
    super.onReady();
    final contributors = await repository.getContributors();
    _contributors.value = contributors;
  }
}
