import 'package:get/get.dart';
import 'package:projeto_crianca/modules/about/presentation/controllers/about_page_controller.dart';
import 'package:projeto_crianca/modules/settings/external/datasources/github_datasource_impl.dart';
import 'package:projeto_crianca/modules/settings/infra/repositories/contributors_repository_impl.dart';

class AboutPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AboutPageController(
        ContributorsRepositoryImpl(
          GitHubDatasourceImpl(),
        ),
      ),
    );
  }
}
