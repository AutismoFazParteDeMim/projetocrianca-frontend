import 'package:get/get.dart';
import 'package:projeto_crianca/core/external/datasources/auth_datasource_impl.dart';
import 'package:projeto_crianca/core/external/datasources/user_datasource_impl.dart';
import 'package:projeto_crianca/core/infra/repositories/register_repository_impl.dart';
import 'package:projeto_crianca/modules/auth/presentation/controllers/register_page_controller.dart';

class RegisterPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RegisterPageController(
        RegisterRepositoryImpl(
          AuthDatasourceImpl(),
          UserDatasourceImpl(),
        ),
      ),
    );
  }
}
