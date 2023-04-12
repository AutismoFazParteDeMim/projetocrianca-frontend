import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/controllers/auth_controller.dart';
import 'package:projeto_crianca/data/providers/auth_provider.dart';
import 'package:projeto_crianca/data/repositories/auth_repository.dart';
import 'package:projeto_crianca/firebase_options.dart';
import 'package:projeto_crianca/mixins/storage_mixin.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:projeto_crianca/routes/app_pages.dart';
import 'package:projeto_crianca/ui/theme/app_theme.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //env
  if (!kIsWeb) {
    await FlutterConfig.loadEnvVariables();
  }

  //firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (value) => Get.put(
      AuthController(
        AuthRepository(AuthProvider()),
      ),
    ),
  );

  //storage
  await GetStorage.init("settings");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget with StorageMixin {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode getTheme() {
      if (storageRead(container: "settings", key: "theme") == "dark") {
        return ThemeMode.dark;
      } else {
        return ThemeMode.light;
      }
    }

    return GetMaterialApp(
      title: 'Projeto Criança',
      getPages: AppPages.pages,
      initialRoute: AppRoutes.initial,
      theme: AppTheme(isDark: false).getTheme(),
      darkTheme: AppTheme(isDark: true).getTheme(),
      themeMode: getTheme(),
      locale: const Locale("pt", "BR"),
      debugShowCheckedModeBanner: false,
    );
  }
}
