import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:projeto_crianca/routes/app_pages.dart';
import 'package:projeto_crianca/ui/theme/app_theme.dart';

void main() {
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
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
