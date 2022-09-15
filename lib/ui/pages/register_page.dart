import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';

class RegisterPage extends GetView {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Cadastre-se",
      ),
      body: const Center(
        child: Text("Register"),
      ),
    );
  }
}
