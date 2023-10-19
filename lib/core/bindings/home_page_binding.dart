import 'package:get/get.dart';
import 'package:projeto_crianca/core/external/datasources/user_datasource_impl.dart';
import 'package:projeto_crianca/core/infra/repositories/user_repository_impl.dart';
import 'package:projeto_crianca/modules/home/presentation/controllers/home_page_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomePageController(
        UserRepositoryImpl(UserDatasourceImpl()),
      ),
    );
  }
}
