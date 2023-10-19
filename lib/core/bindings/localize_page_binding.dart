import 'package:get/get.dart';
import 'package:projeto_crianca/modules/localize/external/datasources/professional_datasource_impl.dart';
import 'package:projeto_crianca/modules/localize/infra/repositories/professional_repository_impl.dart';
import 'package:projeto_crianca/modules/localize/presentation/controllers/localize_page_controller.dart';

class LocalizePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LocalizePageController(
        ProfessionalRepositoryImpl(ProfessionalDatasourceImpl()),
      ),
    );
  }
}
