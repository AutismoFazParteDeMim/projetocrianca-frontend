import 'package:get/get.dart';
import 'package:projeto_crianca/core/external/datasources/auth_datasource_impl.dart';
import 'package:projeto_crianca/core/external/datasources/user_datasource_impl.dart';
import 'package:projeto_crianca/core/infra/repositories/auth_repository_impl.dart';
import 'package:projeto_crianca/modules/auth/presentation/controllers/login_page_controller.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginPageController(
        AuthRepositoryImpl(
          authDatasource: AuthDatasourceImpl(),
          userDatasource: UserDatasourceImpl(),
        ),
      ),
    );
  }
}
