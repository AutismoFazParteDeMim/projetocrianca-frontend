import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/ui/components/Buttons/button_component.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';

class LoginPage extends GetView {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Login",
      ),
      body: Center(
        child: Column(
          children: const [
            ButtonComponent(
              text: "Fazer login",
              icon: Ionicons.enter_outline,
            )
          ],
        ),
      ),
    );
  }
}
