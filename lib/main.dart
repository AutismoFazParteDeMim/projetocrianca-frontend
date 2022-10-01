import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_crianca/controllers/auth_controller.dart';
import 'package:projeto_crianca/data/providers/auth_provider.dart';
import 'package:projeto_crianca/data/repositorys/auth_repository.dart';
import 'package:projeto_crianca/firebase_options.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:projeto_crianca/routes/app_pages.dart';
import 'package:projeto_crianca/ui/theme/app_theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (value) => Get.put(
      AuthController(
        AuthRepository(AuthProvider()),
      ),
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Projeto Criança',
      getPages: AppPages.pages,
      initialRoute: AppRoutes.initial,
      theme: AppTheme(isDark: false).getTheme(),
      darkTheme: AppTheme(isDark: true).getTheme(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
