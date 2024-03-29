import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projeto_crianca/core/external/datasources/auth_datasource_impl.dart';
import 'package:projeto_crianca/core/external/datasources/user_datasource_impl.dart';
import 'package:projeto_crianca/core/infra/repositories/auth_repository_impl.dart';
import 'package:projeto_crianca/core/mixins/storage_mixin.dart';
import 'package:projeto_crianca/core/presentation/theme/app_theme.dart';
import 'package:projeto_crianca/core/routes/app_pages.dart';
import 'package:projeto_crianca/core/routes/app_routes.dart';
import 'package:projeto_crianca/core/services/auth_service.dart';
import 'package:projeto_crianca/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //env
  if (!kIsWeb) {
    await FlutterConfig.loadEnvVariables();
  }

  //firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (value) => Get.put(
      AuthService(
        AuthRepositoryImpl(
          authDatasource: AuthDatasourceImpl(),
          userDatasource: UserDatasourceImpl(),
        ),
      ),
    ),
  );

  //storage
  await GetStorage.init('settings');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget with StorageMixin {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode getTheme() {
      if (storageRead(container: 'settings', key: 'theme') == 'dark') {
        return ThemeMode.dark;
      } else {
        return ThemeMode.light;
      }
    }

    return GetMaterialApp(
      title: 'Projeto Criança',
      getPages: AppPages.pages,
      initialRoute: AppRoutes.welcome,
      theme: AppTheme(isDark: false).getTheme(),
      darkTheme: AppTheme(isDark: true).getTheme(),
      themeMode: getTheme(),
      locale: const Locale('pt', 'BR'),
      debugShowCheckedModeBanner: false,
    );
  }
}
