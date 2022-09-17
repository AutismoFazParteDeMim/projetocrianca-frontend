import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/controllers/auth_controller.dart';
import 'package:projeto_crianca/ui/components/Buttons/button_component.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';

class SettingsPage extends StatelessWidget {
  final authController = Get.find<AuthController>();

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Configurações",
      ),
      body: Center(
        child: ButtonComponent(
          text: "Sair",
          type: "danger",
          icon: Ionicons.log_out_outline,
          onPressed: () => authController.logOut(),
        ),
      ),
    );
  }
}
