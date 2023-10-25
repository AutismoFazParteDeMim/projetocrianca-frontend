import 'package:get/get.dart';
import 'package:projeto_crianca/core/domain/entities/github_entity.dart';
import 'package:projeto_crianca/core/mixins/dialog_mixin.dart';
import 'package:projeto_crianca/core/presentation/widgets/alert_modal_component.dart';
import 'package:projeto_crianca/modules/settings/domain/repositories/contributors_repository.dart';

class AboutPageController extends GetxController with DialogMixin {
  AboutPageController(this.repository);

  final ContributorsRepository repository;

  //vars
  final Rx<List<GitHubEntity?>?> _contributors = Rx<List<GitHubEntity?>?>([]);

  //getters
  List<GitHubEntity?>? get getContributors => _contributors.value;

  @override
  Future<void> onReady() async {
    super.onReady();

    try {
      final contributors = await repository.getContributors();
      _contributors.value = contributors;
    } catch (e) {
      showAlertDialog(
        title: 'Ops!',
        message: e.toString(),
        type: AlertModalComponentType.warning,
      );
    }
  }
}
