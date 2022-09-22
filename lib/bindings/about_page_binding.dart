import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/about_page_controller.dart';
import 'package:projeto_crianca/data/providers/github_provider.dart';
import 'package:projeto_crianca/data/repositorys/github_repository.dart';

class AboutPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutPageController(GitHubRepository(GitHubProvider())));
  }
}
