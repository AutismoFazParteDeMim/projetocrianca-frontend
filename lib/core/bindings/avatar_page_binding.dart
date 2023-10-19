import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/core/external/datasources/user_datasource_impl.dart';
import 'package:projeto_crianca/modules/avatar/external/dicebear_datasource_impl.dart';
import 'package:projeto_crianca/modules/avatar/infra/repositories/avatar_repository_impl.dart';
import 'package:projeto_crianca/modules/avatar/presentation/controllers/avatar_page_controller.dart';

class AvatarPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AvatarPageController(
        AvatarRepositoryImpl(
          DicebearDatasourceImpl(Dio()),
          UserDatasourceImpl(),
        ),
      ),
    );
  }
}
